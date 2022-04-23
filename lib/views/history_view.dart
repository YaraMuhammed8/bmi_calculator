import 'package:bmi_calculator/components/bmi_chart.dart';
import 'package:bmi_calculator/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../local/cache/cache_helper.dart';

class HistoryView extends StatelessWidget {
  HistoryView({Key? key}) : super(key: key);
  double? lastBMI = CacheHelper.getDouble(key: "lastBMIResult");

  @override
  Widget build(BuildContext context) {
    return Center(
        child: (lastBMI == null)
            ? Text(
                "No last results",
                style: AppTextStyles.title,
              )
            : SizedBox(
                height: 250, width: 250, child: BMIChart(bmi: lastBMI!)));
  }
}
