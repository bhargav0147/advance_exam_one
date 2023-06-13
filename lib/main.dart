import 'package:advance_exam_one/app/controller/app_controller.dart';
import 'package:advance_exam_one/app/view/dash_screen.dart';
import 'package:advance_exam_one/app/view/info_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(DevicePreview(
    builder: (context) => Sizer(
      builder: (context, orientation, deviceType) => ChangeNotifierProvider(
        create: (context) => AppProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (p0) => DashScreen(),
            'info': (p0) => InfoScreen(),
          },
        ),
      ),
    ),
  ));
}
