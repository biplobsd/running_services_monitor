import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:running_services_monitor/models/changelog_info.dart';

@lazySingleton
class ChangelogService {
  Future<List<ChangelogInfo>> getChangelogs() async {
    try {
      final jsonString = await rootBundle.loadString('assets/changelog.json');
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((e) => ChangelogInfo.fromJson(e)).toList();
    } catch (_) {
      return const [];
    }
  }
}
