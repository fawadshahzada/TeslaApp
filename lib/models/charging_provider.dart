import 'package:flutter/material.dart';

class ChargingProvider extends ChangeNotifier{
  //slider that extends between 75 and 100
  double _sliderValue = 105;
  double get sliderValue => _sliderValue;
  set sliderValue(double value) {
    print('value: $value');
    //if value is greater than 105 then make it 105, if less than 20 then make it 20
    if (value > 105) {
      value = 105;
    } else if (value < 20) {
      value = 20;
    }
    _sliderValue = value;
    notifyListeners();
  }
}