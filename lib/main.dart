import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/providers/category_provider.dart';
import 'package:untitled1/providers/product_provider.dart';

import 'helper/cart_helper.dart';
import 'helper/favourite_helper.dart';
import 'screens/splash_screen/splash_screen.dart';
import 'utils/constants.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();

  final favoritesProvider = FavoritesProvider();
  await favoritesProvider.initFavorites();
  final cartsProvider = CartProvider();
  await cartsProvider.initCart();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => CategoryProvider()..fetchCategories()),
        ChangeNotifierProvider(
            create: (context) => ProductProvider()..fetchProducts()),
        ChangeNotifierProvider.value(
          value: favoritesProvider,
        ),
        ChangeNotifierProvider.value(
          value: cartsProvider,
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'online shop',
      theme: ThemeData(
        textTheme: GoogleFonts.spaceGroteskTextTheme(),
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
