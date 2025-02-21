import 'package:flutter/material.dart';
import 'package:flutter_deafault_state_manager/widgets/imc_gauge_range.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ImcGauge extends StatelessWidget {

  final double imc;
  const ImcGauge({super.key, required this.imc});

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: [
        RadialAxis(
          showAxisLine: false,
          showLabels: false,
          showTicks: false,
          minimum: 12.5,
          maximum: 47.9,
          ranges: [
            ImcGaugeRange(
              color: Colors.blue,
              start: 12.5,
              end: 18.4,
              label: 'Abaixo do peso',
            ),
            ImcGaugeRange(
              color: Colors.green,
              start: 18.5,
              end: 24.9,
              label: 'Peso normal',
            ),
            ImcGaugeRange(
              color: Colors.yellow[600]!,
              start: 25,
              end: 29.9,
              label: 'Sobrepeso',
            ),
            ImcGaugeRange(
              color: Colors.red[500]!,
              start: 29.9,
              end: 39.9,
              label: 'Obesidade',
            ),
            ImcGaugeRange(
              color: Colors.red[900]!,
              start: 39.9,
              end: 47.9,
              label: 'Obesidade grave',
            ),
          ],
          pointers: [
            NeedlePointer(
              value: imc,
              enableAnimation: true,
            )
          ],
        ),
      ],
    );
  }
}
