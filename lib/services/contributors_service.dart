import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:running_services_monitor/models/contributor_info.dart';

@lazySingleton
class ContributorsService {
  Future<List<ContributorInfo>> getContributors() async {
    try {
      final jsonString = await rootBundle.loadString('assets/contributors.json');
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((e) => ContributorInfo.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }
}
