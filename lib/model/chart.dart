import 'package:flutter/foundation.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SubscriberSeries {
  final String year;
  final int subscribers;
  final charts.Color barColor;

  SubscriberSeries(
    {
      @required this.year,
      @required this.subscribers,
      @required this.barColor
    }
  );
}

class SubscriberSeries2 {
  final int year;
  final int subscribers;
  final charts.Color barColor;

  SubscriberSeries2(
    {
      @required this.year,
      @required this.subscribers,
      @required this.barColor
    }
  );
}