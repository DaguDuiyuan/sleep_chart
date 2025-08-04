import 'package:flutter/material.dart';

import 'package:sleep_chart/sleep_chart.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 根据睡眠阶段定义固定颜色
  final Map<SleepStage, Color> stageColors = {
    SleepStage.light: Color(0xFF4870F3), // 浅蓝色
    SleepStage.deep: Color(0xFF21B2A1), // 青色
    SleepStage.rem: Color(0xFFFCD166), // 黄色
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          width: double.infinity,
          height: 500,
          child: SleepDurationChartWidget(
            heightUnit: 1 / 8.0,
            titleHeight: 45.0,
            titleGap: 10.0,
            xAxisTitleOffset: 8.0,
            xAxisTitleHeight: 15.0,
            bgColor: Color.fromRGBO(72, 112, 243, 0.04),
            curveRadius: 0,
            details: [
              SleepDetailChart(
                model: SleepStage.light,
                startTime: DateTime.now(),
                endTime: DateTime.now().add(Duration(minutes: 5)),
                duration: 5,
              ),
              SleepDetailChart(
                model: SleepStage.deep,
                startTime: DateTime.now().add(Duration(minutes: 5)),
                endTime: DateTime.now().add(Duration(minutes: 10)),
                duration: 5,
              ),
              SleepDetailChart(
                model: SleepStage.rem,
                startTime: DateTime.now().add(Duration(minutes: 10)),
                endTime: DateTime.now().add(Duration(minutes: 50)),
                duration: 40,
              ),
              SleepDetailChart(
                model: SleepStage.light,
                startTime: DateTime.now().add(Duration(minutes: 10)),
                endTime: DateTime.now().add(Duration(minutes: 50)),
                duration: 40,
              ),
              SleepDetailChart(
                model: SleepStage.rem,
                startTime: DateTime.now().add(Duration(minutes: 50)),
                endTime: DateTime.now().add(Duration(minutes: 118)),
                duration: 68,
              ),
              SleepDetailChart(
                model: SleepStage.awake,
                startTime: DateTime.now().add(Duration(minutes: 118)),
                endTime: DateTime.now().add(Duration(minutes: 160)),
                duration: 20,
              ),
              SleepDetailChart(
                model: SleepStage.deep,
                startTime: DateTime.now().add(Duration(minutes: 118)),
                endTime: DateTime.now().add(Duration(minutes: 160)),
                duration: 42,
              ),
              SleepDetailChart(
                model: SleepStage.rem,
                startTime: DateTime.now().add(Duration(minutes: 160)),
                endTime: DateTime.now().add(Duration(minutes: 195)),
                duration: 35,
              ),
              SleepDetailChart(
                model: SleepStage.light,
                startTime: DateTime.now().add(Duration(minutes: 195)),
                endTime: DateTime.now().add(Duration(minutes: 227)),
                duration: 32,
              ),
              SleepDetailChart(
                model: SleepStage.deep,
                startTime: DateTime.now().add(Duration(minutes: 227)),
                endTime: DateTime.now().add(Duration(minutes: 260)),
                duration: 33,
              ),
            ],
            startTime: DateTime.now(),
            endTime: DateTime.now().add(Duration(minutes: 260)),
          ),
        ),
      ),
    );
  }
}
