import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserBmiModel {
  String gender;
  int height;
  int weight;
  int age;
  UserBmiModel({
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
  });
  double get resultBmi {
    double calculateBmi = (weight / pow(height / 100, 2)).roundToDouble();
    return calculateBmi;
  }

  String get stringView {
    if (resultBmi < 18.5) {
      return 'Underweight';
    } else if (resultBmi < 25) {
      return 'Normal';
    } else if (resultBmi < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  Color get categoryColor {
    switch (stringView) {
      case 'Underweight':
        return const Color(0xFF3F51B5);

      case 'Normal':
        return const Color(0xFF4CAF50);

      case 'Overweight':
        return const Color(0xFFFF9800);

      case 'Obese':
        return const Color(0xFFF44336);

      default:
        return const Color(0xFF9E9E9E);
    }
  }

  String get healthAdvice {
    switch (stringView) {
      case 'Underweight':
        return 'Consider consulting a healthcare provider about healthy ways to gain weight.';

      case 'Normal':
        return 'You Have a Normal Body Weight, Good Job.';

      case 'Overweight':
        return 'Consider a balanced diet and increased physical activity to reach a healthier weight.';

      case 'Obese':
        return 'Consider consulting a healthcare provider about healthy lifestyle changes and weight management.';

      default:
        return 'Please check your height and weight values.';
    }
  }
}
