import 'package:injectable/injectable.dart';
import 'package:running_services_monitor/services/shizuku_api.g.dart' as gen;

@module
abstract class DependencyModule {
  gen.ShizukuHostApi get api => gen.ShizukuHostApi();
}
