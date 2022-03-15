import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../models/bmi_status.dart';

class BMIChart extends StatelessWidget {
  double bmi;

  BMIChart({required this.bmi});
  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: [
        RadialAxis(
          minimum: 0,
          maximum: 50,
          showAxisLine: false,
          showTicks: false,
          showLabels: false,
          axisLineStyle: const AxisLineStyle(
            thickness: 15,
            cornerStyle: CornerStyle.bothCurve,
            color: Color(0xffAFEAE8),
          ),
          ranges: List.generate(bmiStatus.length, (index) {
            bool pointed = false;
            if (bmi >= bmiStatus[index].start && bmi <= bmiStatus[index].end)
              pointed = true;
            return GaugeRange(
              startValue: bmiStatus[index].start,
              endValue: bmiStatus[index].end,
              label: bmiStatus[index].status,
              color:
                  pointed ? const Color(0xff89ffc8) : const Color(0xffc4c4c4),
              labelStyle: const GaugeTextStyle(
                color: Colors.white,
                fontFamily: "Cairo",
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
              startWidth: 50,
              endWidth: 50,
            );
          }),
          pointers: [
            NeedlePointer(
                value: bmi,
                tailStyle: const TailStyle(
                  width: 8,
                  length: 0.15,
                ))
          ],
          annotations: [
            GaugeAnnotation(
              angle: 90,
              positionFactor: 0.5,
              widget: Text(
                bmi.toStringAsFixed(2),
                style: TextStyle(
                    color: Colors.blueGrey.shade800,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Tajawal",
                    fontSize: 20),
              ),
            )
          ],
        )
      ],
    );
  }
}
