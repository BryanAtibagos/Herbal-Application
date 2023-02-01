part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();
}

class LoadWishlist extends WishlistEvent{
  @override 
  List<Object> get props => [];
}

class AddProductToWishlist extends WishlistEvent{
  final Herbal herbalList;

  const AddProductToWishlist(this.herbalList);

  @override
  List<Object> get props => [herbalList];
}

class RemoveProductFromWishlist extends WishlistEvent{
  final Herbal herbalList;

  const RemoveProductFromWishlist(this.herbalList);

  @override 
  List<Object> get props =>[herbalList];
}