import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scorc_analytics/pages/home/controller/total_score.dart';

class Score extends StatelessWidget {
  const Score({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TotalSocre totalSocre = Get.find();

    return Container(
      width: double.infinity,
      height: 60,
      alignment: Alignment.centerLeft, // 居中偏左对齐
      padding: const EdgeInsets.only(left: 10),
      decoration: const BoxDecoration(
        color: Colors.blue,
        // 阴影
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -1),
            color: Colors.grey,
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() {
            return Text(
              '总分：${totalSocre.totalScore.toStringAsFixed(2)}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            );
          }),
          // Material(
          //   child: Ink(
          //     height: double.infinity,
          //     color: Colors.green,
          //     child: InkWell(
          //       child: Container(
          //         height: double.infinity,
          //         width: 90,
          //         alignment: Alignment.center,
          //         child: const Text(
          //           '计算总分',
          //           style: TextStyle(color: Colors.white),
          //         ),
          //       ),
          //       onTap: () => totalSocre.operation(),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
