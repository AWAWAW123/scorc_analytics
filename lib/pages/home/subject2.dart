import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/input_widget.dart';
import 'controller/total_score.dart';
import 'widgets/subject_info.dart';

class Subject2 extends StatefulWidget {
  const Subject2({Key? key}) : super(key: key);

  @override
  State<Subject2> createState() => _Subject2State();
}

class _Subject2State extends State<Subject2> {
  TotalSocre totalSocre = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SubjectInfo(
        title: '学科专业分G2（80% + 5分）',
        subTitle: '学科专业分',
        score: totalSocre.subject2.value,
        children: [
          InputWidget(
            controller: TotalSocre.g211,
            labelStr: '大学国文',
            hint: '0 ~ 100',
            maxNum: 100,
            onChanged: (text) => _operation(),
            credits: 2,
          ),
          InputWidget(
            controller: TotalSocre.g212,
            labelStr: '人工智能导论',
            hint: '0 ~ 100',
            maxNum: 100,
            onChanged: (text) => _operation(),
            credits: 3,
          ),
          InputWidget(
            controller: TotalSocre.g213,
            labelStr: '数值计算',
            hint: '0 ~ 100',
            maxNum: 100,
            onChanged: (text) => _operation(),
            credits: 1,
          ),
          InputWidget(
            controller: TotalSocre.g214,
            labelStr: '形式与政策',
            hint: '0 ~ 100',
            maxNum: 100,
            onChanged: (text) => _operation(),
            credits: 0.25,
          ),
          InputWidget(
            controller: TotalSocre.g22,
            labelStr: 'G22',
            hint: '0 ~ 5',
            maxNum: 5,
            onChanged: (text) => _operation(),
          ),
        ],
      );
    });
  }

  /// 计算分数
  _operation() {
    double g211Num = TotalSocre.g211.text.trim().isEmpty
        ? 0
        : double.parse(TotalSocre.g211.text.trim());

    double g212Num = TotalSocre.g212.text.trim().isEmpty
        ? 0
        : double.parse(TotalSocre.g212.text.trim());

    double g213Num = TotalSocre.g213.text.trim().isEmpty
        ? 0
        : double.parse(TotalSocre.g213.text.trim());

    double g214Num = TotalSocre.g214.text.trim().isEmpty
        ? 0
        : double.parse(TotalSocre.g214.text.trim());

    double g22Num = TotalSocre.g22.text.trim().isEmpty
        ? 0
        : double.parse(TotalSocre.g22.text.trim());

    //平均分
    double averageScore =
        (g211Num * 2 + g212Num * 3 + g213Num * 1 + g214Num * 0.25) /
            (2 + 3 + 1 + 0.25);

    // 成绩
    totalSocre.subject2.value = averageScore * 0.8 + g22Num;
  }
}
