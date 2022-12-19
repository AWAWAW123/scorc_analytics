import 'package:flutter/material.dart';

class SubjectInfo extends StatelessWidget {
  final String title;
  final List<Widget>? children;
  final String subTitle;
  final double score;

  const SubjectInfo(
      {Key? key,
      required this.title,
      this.children,
      required this.subTitle,
      required this.score})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 17, // 字体大小
              fontWeight: FontWeight.bold, //加粗
            ),
          ),
          // 分数信息
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children ?? [],
          ),
          const SizedBox(height: 10),
          // 学科分数
          Text(
            // 拼接科目和分数字符串，并且分数只保留两位小数
            '$subTitle  ${score.toStringAsFixed(2)}',
            style: const TextStyle(color: Colors.green),
          ),
        ],
      ),
    );
  }
}
