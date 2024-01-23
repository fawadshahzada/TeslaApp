import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test1/models/charging_provider.dart';
import 'package:test1/models/climate_provider.dart';
import 'package:test1/screen/look_screen.dart';
import 'models/home_providers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeProvider()),
          ChangeNotifierProvider(create: (context) => ChargingProvider()),
          ChangeNotifierProvider(create: (context) => ClimateProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Tech Solz Task #1',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.transparent,
              elevation: 0,
              selectedIconTheme: IconThemeData(
                color: Colors.white,
              ),
              unselectedIconTheme: IconThemeData(
                color: Colors.white,
              ),
              selectedLabelStyle: TextStyle(
                color: Colors.white,
              ),
              unselectedLabelStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          home: const LockScreen(),
        ),
      ),
    );
  }
}
