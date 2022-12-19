import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:scorc_analytics/pages/home/home_page.dart';

import 'pages/home/controller/total_score.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    TotalSocre totalSocre = Get.put(TotalSocre());

    return GetMaterialApp(
      title: '成绩统计',
      locale: const Locale('zh', 'CN'), // 默认语言
      supportedLocales: const [
        Locale('zh', 'CN'),
        Locale('zh', 'HK'),
      ], // 多语言
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
