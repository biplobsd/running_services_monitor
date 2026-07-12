import '../../services/shizuku_api.g.dart';
import 'theme_bloc.dart';

class NativeThemeSync {
  const NativeThemeSync._();

  static final ShizukuHostApi _api = ShizukuHostApi();

  static Future<void> apply(AppThemeMode mode) async {
    try {
      await _api.applyThemeMode(mode.index);
    } catch (_) {}
  }
}
