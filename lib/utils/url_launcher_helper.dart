import 'package:running_services_monitor/core/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherHelper {
  static Future<void> launchExternalUrl(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  static Future<void> openShizukuOrPlayStore() async {
    final marketUri = Uri.parse('market://details?id=${AppConstants.shizukuPackageName}');
    final playStoreUri = Uri.parse(AppConstants.shizukuPlayStoreUrl);

    try {
      final canLaunchMarket = await canLaunchUrl(marketUri);
      if (canLaunchMarket) {
        await launchUrl(marketUri, mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(playStoreUri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      try {
        await launchUrl(playStoreUri, mode: LaunchMode.externalApplication);
      } catch (_) {}
    }
  }
}
