import 'package:flutter/material.dart';

class ClimateProvider extends ChangeNotifier {
  bool acButtonON = false;
  bool fanButtonON = false;
  bool heatButtonON = false;
  bool autoButtonON = false;
  bool showCircularProgressIndicator = false;

  double acSliderValue = 0.1;
  double fanSliderValue = 0.2;
  double heatSliderValue = 0.4;
  double autoSliderValue = 0.5;

  void acButton() {
    acButtonON = !acButtonON;
    notifyListeners();
  }

  void fanButton() {
    fanButtonON = !fanButtonON;
    notifyListeners();
  }

  void heatButton() {
    heatButtonON = !heatButtonON;
    notifyListeners();
  }

  void autoButton() {
    autoButtonON = !autoButtonON;
    notifyListeners();
  }

  void acSlider(double value) {
    print('acSliderValue: $value');
    acSliderValue = value;
    notifyListeners();
  }

  void fanSlider(double value) {
    fanSliderValue = value;
    notifyListeners();
  }

  void heatSlider(double value) {
    heatSliderValue = value;
    notifyListeners();
  }

  void autoSlider(double value) {
    autoSliderValue = value;
    notifyListeners();
  }

  void reset() {
    acButtonON = false;
    fanButtonON = false;
    heatButtonON = false;
    autoButtonON = false;
    acSliderValue = 0;
    fanSliderValue = 0;
    heatSliderValue = 0;
    autoSliderValue = 0;
    notifyListeners();
  }
}