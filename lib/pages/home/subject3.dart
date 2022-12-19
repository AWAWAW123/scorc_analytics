import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scorc_analytics/pages/home/widgets/subject_info.dart';
import 'package:scorc_analytics/widgets/input_widget.dart';

import 'controller/total_score.dart';

class Subject3 extends StatefulWidget {
  const Subject3({Key? key}) : super(key: key);

  @override
  State<Subject3> createState() => _Subject3State();
}

class _Subject3State extends State<Subject3> {
  TotalSocre totalSocre = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SubjectInfo(
        title: '体育分G3（3%）',
        subTitle: '体育分',
        score: totalSocre.subject3.value,
        children: [
          InputWidget(
            controller: TotalSocre.g31,
            labelStr: 'G31',
            hint: '0 ~ 50',
            maxNum: 50,
            onChanged: (text) => _operation(),
          ),
          InputWidget(
            controller: TotalSocre.g32,
            labelStr: 'G32',
            hint: '0 ~ 100',
            maxNum: 100,
            onChanged: (text) => _operation(),
          ),
        ],
      );
    });
  }

  /// 计算分数
  _operation() {
    totalSocre.subject3.value = ((TotalSocre.g31.text.trim().isEmpty
                ? 0
                : double.parse(TotalSocre.g31.text.trim())) +
            (TotalSocre.g32.text.trim().isEmpty
                ? 0
                : double.parse(TotalSocre.g32.text.trim()))) *
        0.03;
  }
}
