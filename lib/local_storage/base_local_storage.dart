import 'package:herbal_application/model/herbals.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class BaseLocalStorageRepository{
  Future<Box> openBox();
  List<Herbal> getWishlist(Box box);
  // ignore: non_constant_identifier_names
  Future<void> AddProductToWishlist(Box box, Herbal herbalList);
  // ignore: non_constant_identifier_names
  Future<void> RemoveProductFromWishlist(Box box, Herbal herbalList);
  Future<void> clearWishlist(Box box);
}