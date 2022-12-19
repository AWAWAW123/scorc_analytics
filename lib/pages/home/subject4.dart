import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scorc_analytics/pages/home/widgets/subject_info.dart';
import 'package:scorc_analytics/widgets/input_widget.dart';

import 'controller/total_score.dart';

class Subject4 extends StatefulWidget {
  const Subject4({Key? key}) : super(key: key);

  @override
  State<Subject4> createState() => _Subject4State();
}

class _Subject4State extends State<Subject4> {
  TotalSocre totalSocre = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SubjectInfo(
        title: '实践拓展G4（7%）',
        subTitle: '实践拓展分',
        score: totalSocre.subject4.value,
        children: [
          InputWidget(
            controller: TotalSocre.g41,
            labelStr: 'G41',
            hint: '0 ~ 40',
            maxNum: 40,
            onChanged: (text) => _operation(),
          ),
          InputWidget(
            controller: TotalSocre.g42,
            labelStr: 'G42',
            hint: '0 ~ 50',
            maxNum: 50,
            onChanged: (text) => _operation(),
          ),
          InputWidget(
            controller: TotalSocre.g43,
            labelStr: 'G43',
            hint: '0 ~ 10',
            maxNum: 10,
            onChanged: (text) => _operation(),
          ),
        ],
      );
    });
  }

  /// 计算分数
  _operation() {
    totalSocre.subject4.value = ((TotalSocre.g41.text.trim().isEmpty
                ? 0
                : double.parse(TotalSocre.g41.text.trim())) +
            (TotalSocre.g42.text.trim().isEmpty
                ? 0
                : double.parse(TotalSocre.g42.text.trim())) +
            (TotalSocre.g43.text.trim().isEmpty
                ? 0
                : double.parse(TotalSocre.g43.text.trim()))) *
        0.07;
  }
}
