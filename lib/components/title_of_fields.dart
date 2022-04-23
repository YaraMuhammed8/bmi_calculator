import 'package:flutter/material.dart';

import '../theme/app_text_styles.dart';

class TitleOfFields extends StatelessWidget {
  String title;
  TitleOfFields({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
     style: AppTextStyles.title,
    );
  }
}
