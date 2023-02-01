// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:herbal_application/local_storage/local_storage.dart';
import 'package:herbal_application/model/herbals.dart';
import 'package:herbal_application/model/wishlist_model.dart';
import 'package:hive/hive.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final LocalStorageRepository _localStorageRepository;
  WishlistBloc({
    required LocalStorageRepository localStorageRepository,
  }) : _localStorageRepository = localStorageRepository,
  super(WishlistLoading()){
    on<LoadWishlist>(_onLoadWishlist);
    on<AddProductToWishlist>(_onAddProductToWishlist);
    on<RemoveProductFromWishlist>(_onRemoveProductFromWishlist);
  }

Future<void> _onLoadWishlist(event, Emitter<WishlistState> emit) async {
   emit (WishlistLoading());
    try {
      Box box = await _localStorageRepository.openBox();
      List<Herbal> herbalList = _localStorageRepository.getWishlist(box);
      await Future<void>.delayed(const Duration(seconds: 1));
      // ignore: prefer_const_constructors
      emit (WishlistLoaded(
        wishlist: Wishlist(herbalList: herbalList)
      ));
    } catch (_) {
      emit (WishlistError());
    }
}
Future<void> _onAddProductToWishlist(event, Emitter<WishlistState> emit) async {
  final state = this.state;
      if (state is WishlistLoaded) {
      try {
        Box box = await _localStorageRepository.openBox();
        _localStorageRepository.AddProductToWishlist(box, event.herbalList);
        emit (WishlistLoaded(
            wishlist: Wishlist(
                herbalList: List.from(state.wishlist.herbalList)
                  ..add(event.herbalList))));
      } on Exception { emit (WishlistLoaded(
            wishlist: Wishlist(
                herbalList: List.from(state.wishlist.herbalList)
                  ..remove(event.herbalList))));
      }
    }
}
Future<void> _onRemoveProductFromWishlist(event, Emitter<WishlistState> emit) 
  async {
      final state = this.state;
      if (state is WishlistLoaded) {
      try {
       Box box = await _localStorageRepository.openBox();
        _localStorageRepository.RemoveProductFromWishlist(box, event.herbalList);

        emit (WishlistLoaded(
            wishlist: Wishlist(
                herbalList: List.from(state.wishlist.herbalList)
                  ..remove(event.herbalList))));
      } on Exception {
        emit (WishlistError());
      }
    }
}


}
