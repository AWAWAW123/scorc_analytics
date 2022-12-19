import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:scorc_analytics/pages/home/controller/total_score.dart';

class InputWidget extends StatelessWidget {
  final String labelStr;
  final TextEditingController controller;
  final String? hint;
  final Function(String)? onChanged;

  /// 学分
  final double? credits;

  /// 最大分数
  final int maxNum;

  const InputWidget(
      {Key? key,
      required this.controller,
      required this.labelStr,
      this.hint,
      this.onChanged,
      this.credits,
      required this.maxNum})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TotalSocre totalSocre = Get.find();
    return TextField(
      controller: controller,
      // 仅允许输入数字和一个小数点 小数点后最多3位
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
        FilteringTextInputFormatter.allow(RegExp(r'^\d{0,3}(.\d{0,3})?')),
      ],
      textInputAction: TextInputAction.next,
      // 锁定键盘类型
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      onChanged: (text) {
        if (text.trim().isNotEmpty) {
          // 如果输入的分数大于最大分数，则自动改为最大分数
          if (double.parse(text) > maxNum) {
            controller.value = TextEditingValue(
              // 把分数改为最大分数
              text: maxNum.toString(),
              // 移动光标到末尾
              selection: TextSelection.fromPosition(
                  TextPosition(offset: maxNum.toString().length)),
            );
          }
        }
        onChanged?.call(text);
        // 自动计算总成绩
        totalSocre.operation();
      },
      decoration: InputDecoration(
        labelText: labelStr,
        hintText: '$hint 留空默认为 0 ',
        helperText: credits == null ? null : '学分 $credits',
        helperStyle: const TextStyle(color: Colors.blueAccent),
      ),
    );
  }
}
