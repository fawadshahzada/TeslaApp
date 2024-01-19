import 'package:flutter/material.dart';
import 'package:test1/screen/climate_screen.dart';
import 'package:test1/screen/look_screen.dart';

import '../screen/charging_screen.dart';
import '../screen/setting_screen.dart';

class HomeProvider extends ChangeNotifier{
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  set changeIndex(int index) {
    _currentIndex = index;
  }
  Widget get currentScreen{
  if(_currentIndex == 0){
    return const SettingScreen();
  }else if(_currentIndex == 1){
    return const ChargingScreen();
  }else if(_currentIndex == 2){
    return const ClimateScreen();
  }else{
    return const LockScreen();
  }
  }
}