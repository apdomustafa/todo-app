import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    print('Screen width: ${ScreenUtil().screenWidth}');
    print('Screen height: ${ScreenUtil().screenHeight}');
    return Container(
      color: Colors.red,
      width: 50.w,
      height: 50.h,
      child: const Text(
        'hellw ',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
