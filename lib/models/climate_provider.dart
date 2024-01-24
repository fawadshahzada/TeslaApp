import 'package:flutter/material.dart';

class ClimateProvider extends ChangeNotifier {
  bool acButtonON = false;
  bool fanButtonON = false;
  bool heatButtonON = false;
  bool autoButtonON = false;
  bool showCircularProgressIndicator = false;

  get showProgress => showCircularProgressIndicator;

  String lastButtonPressed = 'AC';

  double acSliderValue = 0.0;
  double fanSliderValue = 0.0;
  double heatSliderValue = 0.0;
  double autoSliderValue = 0.0;
  double progressIndicatorValue = 0.0;

  set setShowCircularProgressIndicator(bool value) {
    showCircularProgressIndicator = value;
    notifyListeners();
  }

  set setIndicatorValue(double value) {
    progressIndicatorValue = value;
    notifyListeners();
  }

  void acButtonPressed() {
    acButton();
    notifyListeners();
  }

  void fanButtonPressed() {
    fanButton();
    notifyListeners();
  }

  void heatButtonPressed() {
    heatButton();
    if(heatButtonON){
      lastButtonPressed = 'Heat';
      showProgressIndicator();
      progressIndicator();
    }
    notifyListeners();
  }

  void autoButtonPressed() {
    autoButton();
    notifyListeners();
  }

  void acButton() {
    lastButtonPressed = 'AC';
    acButtonON = !acButtonON;
    showProgressIndicator();

    notifyListeners();
  }

  void fanButton() {
    lastButtonPressed = 'Fan';
    fanButtonON = !fanButtonON;
    showProgressIndicator();

    notifyListeners();
  }

  void heatButton() {
    lastButtonPressed = 'Heat';
    heatButtonON = !heatButtonON;
    showProgressIndicator();

    notifyListeners();
  }

  void autoButton() {
    lastButtonPressed = 'Auto';
    autoButtonON = !autoButtonON;
    showProgressIndicator();
    notifyListeners();
  }

  void acSlider(double value) {
    if (acButtonON) {
      acSliderValue = value;
    } else {
      acSliderValue = acSliderValue;
    }
    showProgressIndicator();
    notifyListeners();
  }

  void fanSlider(double value) {
    if (fanButtonON) {
      fanSliderValue = value;
    } else {
      fanSliderValue = fanSliderValue;
    }
    showProgressIndicator();
    notifyListeners();
  }

  void heatSlider(double value) {
    if (heatButtonON) {
      heatSliderValue = value;
    } else {
      heatSliderValue = heatSliderValue;
    }
    showProgressIndicator();
    notifyListeners();
  }

  void autoSlider(double value) {
    if (autoButtonON) {
      autoSliderValue = value;
    } else {
      autoSliderValue = autoSliderValue;
    }
    showProgressIndicator();

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
    showProgressIndicator();

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
    showProgressIndicator();

    notifyListeners();
  }

  void incrementFanSlider() {
    if(fanButtonON){
      fanSliderValue += 0.1;
      fanSliderValue = fanSliderValue > 1.0 ? 1.0 : fanSliderValue;
    }else{
      fanSliderValue = fanSliderValue;
    }
    showProgressIndicator();

    notifyListeners();
  }

  void decrementFanSlider() {
    if(fanButtonON){
      fanSliderValue -= 0.1;
      fanSliderValue = fanSliderValue < 0.0 ? 0.0 : fanSliderValue;
    }else{
      fanSliderValue = fanSliderValue;
    }
    showProgressIndicator();

    notifyListeners();
  }

  void incrementHeatSlider() {
    if(heatButtonON){
      heatSliderValue += 0.1;
      heatSliderValue = heatSliderValue > 1.0 ? 1.0 : heatSliderValue;
    }else{
      heatSliderValue = heatSliderValue;
    }
    showProgressIndicator();

    notifyListeners();
  }

  void decrementHeatSlider() {
    if(heatButtonON){
      heatSliderValue -= 0.1;
      heatSliderValue = heatSliderValue < 0.0 ? 0.0 : heatSliderValue;
    }else{
      heatSliderValue = heatSliderValue;
    }
    showProgressIndicator();

    notifyListeners();
  }

  void incrementAutoSlider() {
    if(autoButtonON){
      autoSliderValue += 0.1;
      autoSliderValue = autoSliderValue > 1.0 ? 1.0 : autoSliderValue;}
    else{
      autoSliderValue = autoSliderValue;
    }
    showProgressIndicator();

    notifyListeners();
  }

  void decrementAutoSlider() {
    if(autoButtonON){
      autoSliderValue -= 0.1;
      autoSliderValue = autoSliderValue < 0.0 ? 0.0 : autoSliderValue;
    }else{
      autoSliderValue = autoSliderValue;
    }
    showProgressIndicator();

    notifyListeners();
  }

  // show progress indicator will depend on weather any of the button is on or off
  void showProgressIndicator() {
    if (acButtonON || fanButtonON || heatButtonON || autoButtonON) {
     setShowCircularProgressIndicator = true;
    } else {
      setShowCircularProgressIndicator = false;
    }
    notifyListeners();
  }

  // the value of the progress indicator will depend on the slider value which is been selected the latest
  void progressIndicator() {
    if (lastButtonPressed == 'AC') {
      setIndicatorValue = acSliderValue;
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
