import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app2/features/splashFeature/models/splash_model.dart';
import 'package:todo_app2/features/splashFeature/views/widgets/splash_app_info_body.dart';

class SplashAppInfo extends StatelessWidget {
  final SplashModel _splashModel;
  const SplashAppInfo({super.key, required SplashModel splashModel})
      : _splashModel = splashModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SplashAppInfoBody(
          splashModel: _splashModel,
        ),
      ),
    );
  }
}
