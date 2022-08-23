import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:project/model/chart.dart';
import 'package:project/style.dart';
import 'package:project/widget/developer_chart.dart';

class HomePage extends StatelessWidget {
  final List<SubscriberSeries> data = [
    SubscriberSeries(
      year: "السبت",
      subscribers: 10,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "الاحد",
      subscribers: 20,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "الاثنين",
      subscribers: 98,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "الثلاثاء",
      subscribers: 87,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "اربعاء",
      subscribers: 55,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "خميس",
      subscribers: 50,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "جمعة",
      subscribers: 70,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text(
          "النتائج",
          style: appbar,
        ),
      ),
      body: Center(
          child: SubscriberChart(
        data: data,
      )),
    );
  }
}

class HomePage2 extends StatelessWidget {
  final List<SubscriberSeries2> data = [
    SubscriberSeries2(
      year: 1,
      subscribers: 10,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries2(
      year: 2,
      subscribers: 20,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries2(
      year: 3,
      subscribers: 98,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries2(
      year: 4,
      subscribers: 87,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries2(
      year: 5,
      subscribers: 55,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries2(
      year: 6,
      subscribers: 50,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries2(
      year: 7,
      subscribers: 70,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text(
          "النتائج",
          style: appbar,
        ),
      ),
      body: Center(
          child: SubscriberChart2(
        data: data,
      )),
    );
  }
}
