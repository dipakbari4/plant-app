import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:plant/components/responsive.dart';
import 'package:plant/services/state_check.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                visualDensity: VisualDensity.adaptivePlatformDensity,
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(),
                ),
              ),
              home: StateCheck(),
            );
          },
        );
      },
    );
  }
}
