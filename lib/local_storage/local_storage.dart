import 'package:herbal_application/local_storage/base_local_storage.dart';
import 'package:herbal_application/model/herbals.dart';
import 'package:hive/hive.dart';

class LocalStorageRepository extends BaseLocalStorageRepository{
  String boxName = 'wishlist_products';
    @override
  Future<Box> openBox() async{
    Box box = await Hive.openBox<Herbal>(boxName);
    return box;
  }
    @override
  List<Herbal> getWishlist(Box box) {
    return box.values.toList() as List<Herbal>;
  }
  @override
  // ignore: non_constant_identifier_names
  Future<void> AddProductToWishlist(Box box, Herbal herbalList) async {
    await box.put(herbalList.id, herbalList);
  }

  @override
  // ignore: non_constant_identifier_names
  Future<void> RemoveProductFromWishlist(Box box, Herbal herbalList) async {
    await box.delete(herbalList.id);
  }

  @override
  Future<void> clearWishlist(Box box) async {
    await box.clear();
  }

}