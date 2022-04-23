import 'package:bmi_calculator/local/cache/cache_helper.dart';
import 'package:flutter/material.dart';
import 'src/app_root.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(AppRoot());
}