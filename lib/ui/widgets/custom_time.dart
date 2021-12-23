import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTime extends StatelessWidget {
  final IconData iconData;
  final title;
  final time;
  CustomTime({required this.iconData, required this.title, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.0.w),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              iconData,
              size: 8.0.w,
              color: Color.fromRGBO(92, 111, 192, 1),
            ),
            SizedBox(
              width: 2.0.w,
            ),
            Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Color.fromRGBO(92, 111, 192, 1),
                      fontSize: 10.0.sp),
                ),
                Text(
                  time,
                  style: TextStyle(fontSize: 10.0.sp),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
