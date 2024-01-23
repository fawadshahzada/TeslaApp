import 'package:flutter/material.dart';

class ClimateProvider extends ChangeNotifier {
  bool acButtonON = false;
  bool fanButtonON = false;
  bool heatButtonON = false;
  bool autoButtonON = false;
  bool showCircularProgressIndicator = false;

  String lastButtonPressed = 'AC';

  double acSliderValue = 0.1;
  double fanSliderValue = 0.2;
  double heatSliderValue = 0.4;
  double autoSliderValue = 0.5;
  double progressIndicatorValue = 0.0;

  void acButton() {
    acButtonON = !acButtonON;
    print('acButtonON: $acButtonON');
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
    if (acButtonON) {
      acSliderValue = value;
    } else {
      acSliderValue = acSliderValue;
    }
    notifyListeners();
  }

  void fanSlider(double value) {
    if (fanButtonON) {
      fanSliderValue = value;
    } else {
      fanSliderValue = fanSliderValue;
    }
    notifyListeners();
  }

  void heatSlider(double value) {
    if (heatButtonON) {
      heatSliderValue = value;
    } else {
      heatSliderValue = heatSliderValue;
    }
    notifyListeners();
  }

  void autoSlider(double value) {
    if (autoButtonON) {
      autoSliderValue = value;
    } else {
      autoSliderValue = autoSliderValue;
    }
    notifyListeners();
  }

  void incrementAcSlider() {
    if(acButtonON){
      acSliderValue += 0.1;
      if (acSliderValue > 1.0) {
        acSliderValue = 1.0;
      }
    }else{
      acSliderValue = acSliderValue;
    }
    notifyListeners();
  }

  void decrementAcSlider() {
    if(acButtonON){
      acSliderValue -= 0.1;
      if (acSliderValue < 0.0) {
        acSliderValue = 0.0;
      }
    }else{
      acSliderValue = acSliderValue;
    }
    notifyListeners();
  }

  void incrementFanSlider() {
    if(fanButtonON){
      fanSliderValue += 0.1;
      fanSliderValue = fanSliderValue > 1.0 ? 1.0 : fanSliderValue;
    }else{
      fanSliderValue = fanSliderValue;
    }
    notifyListeners();
  }

  void decrementFanSlider() {
    if(fanButtonON){
      fanSliderValue -= 0.1;
      fanSliderValue = fanSliderValue < 0.0 ? 0.0 : fanSliderValue;
    }else{
      fanSliderValue = fanSliderValue;
    }
    notifyListeners();
  }

  void incrementHeatSlider() {
    if(heatButtonON){
      heatSliderValue += 0.1;
      heatSliderValue = heatSliderValue > 1.0 ? 1.0 : heatSliderValue;
    }else{
      heatSliderValue = heatSliderValue;
    }
    notifyListeners();
  }

  void decrementHeatSlider() {
    if(heatButtonON){
      heatSliderValue -= 0.1;
      heatSliderValue = heatSliderValue < 0.0 ? 0.0 : heatSliderValue;
    }else{
      heatSliderValue = heatSliderValue;
    }
    notifyListeners();
  }

  void incrementAutoSlider() {
    if(autoButtonON){
      autoSliderValue += 0.1;
      autoSliderValue = autoSliderValue > 1.0 ? 1.0 : autoSliderValue;}
    else{
      autoSliderValue = autoSliderValue;
    }
    notifyListeners();
  }

  void decrementAutoSlider() {
    if(autoButtonON){
      autoSliderValue -= 0.1;
      autoSliderValue = autoSliderValue < 0.0 ? 0.0 : autoSliderValue;
    }else{
      autoSliderValue = autoSliderValue;
    }
    notifyListeners();
  }

  // show progress indicator will depend on weather any of the button is on or off
  void showProgressIndicator() {
    if (acButtonON || fanButtonON || heatButtonON || autoButtonON) {
      showCircularProgressIndicator = true;
    } else {
      showCircularProgressIndicator = false;
    }
    notifyListeners();
  }

  // the value of the progress indicator will depend on the slider value which is been selected the latest
  void progressIndicator() {
    if (lastButtonPressed == 'AC') {
      progressIndicatorValue = acSliderValue;
    } else if (lastButtonPressed == 'Fan')  {
      progressIndicatorValue = fanSliderValue;
    } else if (lastButtonPressed == 'Heat')  {
      progressIndicatorValue = heatSliderValue;
    } else if (lastButtonPressed == 'Auto')  {
      progressIndicatorValue = autoSliderValue;
    } else {
      progressIndicatorValue = 0.0;
    }
    notifyListeners();
  }
}
