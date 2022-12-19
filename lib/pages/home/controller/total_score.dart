import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TotalSocre extends GetxController {
  static TextEditingController g11 = TextEditingController();
  static TextEditingController g12 = TextEditingController();
  static TextEditingController g211 = TextEditingController();
  static TextEditingController g212 = TextEditingController();
  static TextEditingController g213 = TextEditingController();
  static TextEditingController g214 = TextEditingController();
  static TextEditingController g22 = TextEditingController();
  static TextEditingController g31 = TextEditingController();
  static TextEditingController g32 = TextEditingController();
  static TextEditingController g41 = TextEditingController();
  static TextEditingController g42 = TextEditingController();
  static TextEditingController g43 = TextEditingController();

  var subject1 = 0.0.obs;
  var subject2 = 0.0.obs;
  var subject3 = 0.0.obs;
  var subject4 = 0.0.obs;
  var totalScore = 0.0.obs;

  // 清空成绩
  clear() {
    g11.clear();
    g12.clear();
    g211.clear();
    g212.clear();
    g213.clear();
    g214.clear();
    g31.clear();
    g32.clear();
    g41.clear();
    g42.clear();
    g43.clear();
    subject1.value = 0.0;
    subject2.value = 0.0;
    subject3.value = 0.0;
    subject4.value = 0.0;
    totalScore.value = 0.0;
  }

  /// 计算总成绩
  operation() {
    totalScore.value =
        subject1.value + subject2.value + subject3.value + subject4.value;
  }
}
