import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:up_005_travellingapp/providers/provider_place.dart';
import 'screen/screen_add_place.dart';
import 'screen/screen_locations_list.dart';

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
    return ChangeNotifierProvider.value(
      value: PlaceProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ENGAGE',
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.purple, // as above
            primaryColorDark: Colors.purpleAccent, // as above
            accentColor: Colors.amber, // as above
            cardColor: Colors.purple[
                300], // default based on theme brightness, can be set manually
            backgroundColor: Colors.transparent, // as above
            errorColor: const Color(
                0xFFFF0000), // default (Colors.red[700]), can be set manually
            brightness: Brightness
                .dark, // default (Brightness.light), can be set manually
          ),
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
            shadowColor: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.elliptical(90, 15),
              ),
            ),
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
          // pageTransitionsTheme: PageTransitionsTheme(builders: {
          //   TargetPlatform.android: CustomPageTransitionsBuilder(),
          // }),
        ),
        home: const PlacesListScreen(),
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
        routes: {
        PlacesListScreen.routeName: (ctx) =>
            const PlacesListScreen(),
          AddPlaceScreen.routeName: (ctx) =>
          const AddPlaceScreen(),

        },
      ),
    );
  }
}
