import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scorc_analytics/pages/home/controller/total_score.dart';
import 'package:scorc_analytics/pages/home/score.dart';
import 'package:scorc_analytics/pages/home/subject1.dart';
import 'package:scorc_analytics/pages/home/subject2.dart';
import 'package:scorc_analytics/pages/home/subject3.dart';
import 'package:scorc_analytics/pages/home/subject4.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TotalSocre totalSocre = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('成绩统计'),
        actions: [
          IconButton(
            onPressed: () => totalSocre.clear(),
            icon: const Icon(Icons.refresh),
            tooltip: '清空成绩',
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(), // 重力效果
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  // 思想品德
                  Subject1(),
                  // 学科专业
                  Subject2(),
                  // 体育
                  Subject3(),
                  // 实践拓展
                  Subject4(),
                  SizedBox(height: 60)
                ],
              ),
            ),
          ),
          // 总分
          const Score(),
        ],
      ),
    );
  }
}
