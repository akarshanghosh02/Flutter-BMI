import 'dart:math';

class CalculatorBrain {
  int weight;
  int height;
  double _bmi;
  CalculatorBrain(this.weight, this.height);

  String calculation() {
    _bmi = weight / (pow(height / 100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String bmiText() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String bmiAdvice() {
    if (_bmi >= 25) {
      return 'You have higher than normal BMI try to exercise more';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight ,Good Job';
    } else {
      return 'You have lower than average BMI,try to eat more';
    }
  }
}
