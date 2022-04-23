import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../models/bmi_status.dart';
import '../theme/app_text_styles.dart';

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
            cornerStyle: CornerStyle.bothCurve,
            color: Color(0xff6ADDD8),
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
                  pointed ? const Color(0xff6AD8E3) :Colors.grey.shade400,
              labelStyle: GaugeTextStyle(
                color: Colors.white,
                fontFamily: "Tajawal",
                fontWeight: FontWeight.w500,
                fontSize: 10,
              ),
              startWidth: 20,
              endWidth: 20,
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
                style: AppTextStyles.title,
              ),
            )
          ],
        )
      ],
    );
  }
}
