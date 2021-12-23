import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomData extends StatelessWidget {
  final String datakey;
  final String datavalue;

  CustomData({required this.datakey, required this.datavalue});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 35.0.w,
          child: Text(
            datakey + ":",
            style: TextStyle(fontSize: 11.0.sp, color: Colors.black54),
          ),
        ),
        SizedBox(
          width: 4.0.w,
        ),
        Container(
          width: 52.0.w,
          child: Text(
            datavalue,
            style: TextStyle(fontSize: 11.0.sp, color: Colors.black54),
          ),
        )
      ],
    );
  }
}
