import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Controller extends GetxController {
  void correctAnswer();
  void wrongAnswer();
  void Null();
  void list();
}

class Verifications extends Controller {
  int correctCount = 0;
  int wrongCount = 0;
  List<int> o = [];
  int t = 10;

  @override
  void correctAnswer() {
    correctCount++;
    update();
    Get.snackbar(
      'إجابة صحيحة',
      'تم الإجابة بشكل صحيح!',
      backgroundColor: Colors.green,
    );
  }

  @override
  void wrongAnswer() {
    wrongCount++;
    update();
    Get.snackbar(
      'إجابة خاطئة',
      'تم الإجابة بشكل خاطئ!',
      backgroundColor: Colors.red,
    );
  }

  @override
  void Null() {
    wrongCount++;
    update();
    Get.snackbar("اجابه خطاء", "!لأن الحقل فارغ", backgroundColor: Colors.red);
  }

  @override
  void list() {
    o.add(t);
    update();
  }
}
