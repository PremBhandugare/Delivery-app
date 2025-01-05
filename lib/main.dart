import 'package:bigthing/constants/global.dart';
import 'package:bigthing/features/auth/screens/auth_scr.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
         style: ElevatedButton.styleFrom(
         foregroundColor: Colors.white,
         backgroundColor: GlobalVariables.secondaryColor, // Set to your color
         shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black ),
        ),
      ),
      onGenerateRoute:(settings) => generateRoute(settings),
      home: const AuthScr(),
    );
  }
}

Route<dynamic> generateRoute(RouteSettings routeSettings){
  switch (routeSettings.name) {
    case AuthScr.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder:(_) => const AuthScr()
        );
    default:
    return MaterialPageRoute(
      builder:(_)=>const Scaffold(
        body: Center(child: Text('Error 404'),),
        ),
      );
  }
}


