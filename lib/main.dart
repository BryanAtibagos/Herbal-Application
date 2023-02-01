import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get/get.dart';
import 'package:herbal_application/model/herbals.dart';
import 'package:herbal_application/splashscreen.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:herbal_application/block/wishlist/wishlist_bloc.dart';
import 'package:herbal_application/local_storage/local_storage.dart';
import 'package:herbal_application/pages/homepage.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HerbalAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors 
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(_) => WishlistBloc(
          localStorageRepository: LocalStorageRepository(),
        )
        ..add(LoadWishlist()) )
      ],
      child: GetMaterialApp(
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
