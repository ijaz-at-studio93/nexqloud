import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  UrlLauncher._();
  static Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication, // Ensures it opens in a new tab
      );
    } else {
      throw "Could not launch $url";
    }
  }

  static Future<void> openViewName(String url) async {
    final uri = Uri.parse('https://nexqloud.io/$url');

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication, // Ensures it opens in a new tab
      );
    } else {
      throw "Could not launch $url";
    }
  }
}
