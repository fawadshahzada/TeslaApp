import 'package:flutter/material.dart';

class ChargingProvider extends ChangeNotifier{
  //slider that extends between 75 and 100
  double _sliderValue = 0.7;
  double get sliderValue => _sliderValue;
  set sliderValue(double value) {
    print('value: $value');
    //if value is greater than 105 then make it 105, if less than 20 then make it 20
    if (value > 1) {
      value = 1;
    } else if (value < 0.75) {
      value = 0.75;
    }
    _sliderValue = value;
    notifyListeners();
  }
}