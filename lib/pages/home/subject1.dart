import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scorc_analytics/pages/home/controller/total_score.dart';
import 'package:scorc_analytics/pages/home/widgets/subject_info.dart';
import 'package:scorc_analytics/widgets/input_widget.dart';

class Subject1 extends StatefulWidget {
  const Subject1({Key? key}) : super(key: key);

  @override
  State<Subject1> createState() => _Subject1State();
}

class _Subject1State extends State<Subject1> {
  TotalSocre totalSocre = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SubjectInfo(
        title: '思想品德分G1（10%）',
        subTitle: '思想品德分',
        score: totalSocre.subject1.value,
        children: [
          InputWidget(
            controller: TotalSocre.g11,
            labelStr: 'G1',
            hint: '0 ~ 70',
            maxNum: 70,
            onChanged: (text) => _operation(70),
          ),
          InputWidget(
            controller: TotalSocre.g12,
            labelStr: 'G2',
            hint: '0 ~ 70',
            maxNum: 70,
            onChanged: (text) => _operation(70),
          ),
        ],
      );
    });
  }

  /// 计算分数
  _operation(int maxNum) {
    totalSocre.subject1.value =
        ((TotalSocre.g11.text.isEmpty ? 0 : double.parse(TotalSocre.g11.text)) +
                (TotalSocre.g12.text.isEmpty
                    ? 0
                    : double.parse(TotalSocre.g12.text))) *
            0.1;
  }
}
