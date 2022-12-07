import 'dart:math';

class BmiBrain {
  BmiBrain({required this.height, required this.weight});
  final int height;
  final int weight;

  double _bmi=25;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {

    if (_bmi >= 25) {
      return'go to the gym';
    }
    else if (_bmi >= 18.5) {
      return'all good';
    }
    else {
     return 'eat more....';
    }
  }
}
