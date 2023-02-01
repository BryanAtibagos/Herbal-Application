import 'package:equatable/equatable.dart';
import 'package:herbal_application/model/herbals.dart';

class Wishlist extends Equatable {
  final List<Herbal> herbalList;

  const Wishlist({this.herbalList = const <Herbal>[]});
    
    @override 
    List<Object?> get props => [herbalList];
  }