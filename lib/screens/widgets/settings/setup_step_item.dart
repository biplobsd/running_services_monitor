import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';


class SetupStepItem extends StatelessWidget {
  final String number;
  final String text;

  const SetupStepItem({super.key, required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(12.rSafe),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            child: Center(
              child: Text(
                number,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Padding(padding: EdgeInsets.only(top: 2.h), child: Text(text, style: TextStyle(fontSize: 14.sp))),
          ),
        ],
      ),
    );
  }
}
