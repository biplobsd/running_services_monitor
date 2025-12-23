import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';

class AppStyles {
  AppStyles._();

  static final cardMargin = EdgeInsets.symmetric(horizontal: 15.w, vertical: 4.h);
  static final listPadding = EdgeInsets.symmetric(horizontal: 15.w);
  static final sectionPadding = EdgeInsets.all(16.w);

  static final titleStyle = TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp);
  static final subtitleStyle = TextStyle(fontSize: 12.sp);
  static final captionStyle = TextStyle(fontSize: 11.sp);
  static final smallStyle = TextStyle(fontSize: 10.sp);
  static final bodyStyle = TextStyle(fontSize: 14.sp);
  static final headlineStyle = TextStyle(fontSize: 20.sp);
  static final headerStyle = TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold);

  static final spacing4 = SizedBox(width: 4.w);
  static final paddingH4 = EdgeInsets.symmetric(horizontal: 4.w);
  static final spacing8 = SizedBox(width: 8.w);
  static final spacing10 = SizedBox(width: 10.w);
  static final spacing12 = SizedBox(width: 12.w);
  static final spacing16 = SizedBox(width: 16.w);
  static final spacingH2 = SizedBox(height: 2.h);
  static final spacingH4 = SizedBox(height: 4.h);
  static final spacingH6 = SizedBox(height: 6.h);
  static final spacingH8 = SizedBox(height: 8.h);
  static final spacingH10 = SizedBox(height: 10.h);
  static final spacingH12 = SizedBox(height: 12.h);
  static final spacingH16 = SizedBox(height: 16.h);
  static final spacingH24 = SizedBox(height: 24.h);

  static final padding6 = EdgeInsets.all(6.w);
  static final padding8 = EdgeInsets.all(8.w);
  static final padding10 = EdgeInsets.all(10.w);

  static const memoryIcon = Icon(Icons.memory, size: 12);
  static const pidIcon = Icon(Icons.numbers, size: 12);
  static const Icon refreshIcon = Icon(Icons.refresh);
  static const Icon infoIcon = Icon(Icons.info_outline);
  static const Icon playIcon = Icon(Icons.play_circle_outline);
  static const Icon stopIcon = Icon(Icons.stop_circle);
  static const Icon deleteIcon = Icon(Icons.delete_outline);
  static const Icon arrowForwardIcon = Icon(Icons.chevron_right);
  static const timerIcon = Icon(Icons.timer);
  static const timerOffIcon = Icon(Icons.timer_off);
  static const closeIcon = Icon(Icons.close, size: 24);

  static final paddingH16V8 = EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h);
  static final paddingH8 = EdgeInsets.symmetric(horizontal: 8.w);
  static final paddingH12 = EdgeInsets.symmetric(horizontal: 12.w);
  static final paddingH16 = EdgeInsets.symmetric(horizontal: 16.w);

  static final padding12 = EdgeInsets.all(12.w);
  static final padding16 = EdgeInsets.all(16.w);
  static final padding24 = EdgeInsets.all(24.w);
}
