import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ImcGaugeRange extends GaugeRange {

  ImcGaugeRange({
    required Color color,
    required double start,
    required double end,
    required String label,
  }) : super(
    startValue: start,
    endValue: end,
    color: color,
    label: label,
    sizeUnit: GaugeSizeUnit.factor,
    labelStyle: GaugeTextStyle(fontSize: 12, fontFamily: 'Times'),
    startWidth: 0.65,
    endWidth: 0.65,
  );

}