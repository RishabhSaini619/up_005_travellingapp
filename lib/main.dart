import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ENGAGE',
      theme: ThemeData(
        fontFamily: 'Lato',
        // colorScheme: ColorScheme.fromSwatch(
        //   primarySwatch: Colors.deepOrange, // as above
        //   primaryColorDark: Colors.deepOrangeAccent, // as above
        //   accentColor: Colors.black87, // as above
        //   cardColor: const Color(
        //       0xFFFF4D00), // default based on theme brightness, can be set manually
        //   backgroundColor: Colors.transparent, // as above
        //   errorColor: const Color(
        //       0xFFFF0000), // default (Colors.red[700]), can be set manually
        //   brightness: Brightness
        //       .dark, // default (Brightness.light), can be set manually
        // ),
        textTheme: const TextTheme(
          displaySmall: TextStyle(
            fontFamily: 'Lato',
            fontStyle: FontStyle.italic,
          ),
          displayMedium: TextStyle(
            fontFamily: 'Lato',
            fontStyle: FontStyle.italic,
          ),
          displayLarge: TextStyle(
            fontFamily: 'Lato',
            fontStyle: FontStyle.italic,
          ),
          headlineSmall: TextStyle(
            fontFamily: 'Lato',
            fontStyle: FontStyle.italic,
          ),
          headlineMedium: TextStyle(
            fontFamily: 'Lato',
            fontStyle: FontStyle.italic,
          ),
          headlineLarge: TextStyle(
            fontFamily: 'Lato',
            fontStyle: FontStyle.italic,
          ),
          titleSmall: TextStyle(
            fontFamily: 'Lato',
            fontStyle: FontStyle.italic,
          ),
          titleMedium: TextStyle(
            fontFamily: 'Lato',
            fontStyle: FontStyle.italic,
          ),
          titleLarge: TextStyle(
            fontFamily: 'Lato',
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w900,
          ),
          bodySmall: TextStyle(fontFamily: 'Lato'),
          bodyMedium: TextStyle(fontFamily: 'Lato'),
          bodyLarge: TextStyle(fontFamily: 'Lato'),
          labelSmall: TextStyle(fontFamily: 'Lato'),
          labelMedium: TextStyle(fontFamily: 'Lato'),
          labelLarge: TextStyle(fontFamily: 'Lato'),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        // pageTransitionsTheme: PageTransitionsTheme(builders: {
        //   TargetPlatform.android: CustomPageTransitionsBuilder(),
        // }),
      ),
      // home:
      // authenticationData.isAuthenticated
      //     ? const ProductsOverviewScreen()
      //     : FutureBuilder(
      //         future: authenticationData.autoLogIn(),
      //         builder: (context, builderSnapshot) =>
      //             builderSnapshot.connectionState == ConnectionState.waiting
      //                 ? const LoadingSplashScreen()
      //                 : const AuthenticationScreen(),
      //       ),
      // routes: {
      // ProductsOverviewScreen.routeName: (ctx) =>
      //     const ProductsOverviewScreen(),
      // ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
      // CartScreen.routeName: (ctx) => const CartScreen(),
      // OrdersScreen.routeName: (ctx) => const OrdersScreen(),
      // ManageProductsScreen.routeName: (ctx) => const ManageProductsScreen(),
      // EditProductScreen.routeName: (ctx) => const EditProductScreen(),
      // },
    );
  }
}
