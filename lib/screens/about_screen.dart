import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/core/constants.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'widgets/about_info_tile.dart';
import 'widgets/about_header.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {

  String version = '';

  @override
  void initState() {
    super.initState();

    _loadPackageInfo();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (version.isEmpty) {
      version = context.loc.loading;
    }
  }

  Future<void> _loadPackageInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      version = 'v${packageInfo.version}';
    });
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {

      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.loc.about, style: TextStyle(fontSize: 20.sp))),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(16.0.w),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                AboutHeader(version: version),
                SizedBox(height: 32.h),
                AboutInfoTile(
                  icon: Icons.person,
                  title: context.loc.developer,
                  subtitle: AppConstants.developerName,
                ),
                AboutInfoTile(
                  icon: Icons.email,
                  title: context.loc.email,
                  subtitle: AppConstants.developerEmail,
                  onTap: () => _launchUrl('mailto:${AppConstants.developerEmail}'),
                ),
                AboutInfoTile(
                  icon: Icons.code,
                  title: context.loc.sourceCode,
                  subtitle: AppConstants.sourceCodeDisplayUrl,
                  onTap: () => _launchUrl(AppConstants.sourceCodeUrl),
                ),
                AboutInfoTile(
                  icon: Icons.web,
                  title: context.loc.blogs,
                  subtitle: AppConstants.blogsDisplayUrl,
                  onTap: () => _launchUrl(AppConstants.blogsUrl),
                ),
                SizedBox(height: 24.h),
                Center(
                  child: FilledButton.icon(
                    onPressed: () => _launchUrl(AppConstants.buyMeCoffeeUrl),
                    icon: const Icon(Icons.coffee),
                    label: Text(context.loc.buyMeCoffee, style: TextStyle(fontSize: 14.sp)),
                    style: FilledButton.styleFrom(backgroundColor: Colors.amber[800], foregroundColor: Colors.white),
                  ),
                ),
                SizedBox(height: 24.h),
                Center(
                  child: Text(
                    context.loc.madeInBangladesh,
                    style: TextStyle(fontSize: 14.sp, color: Theme.of(context).colorScheme.onSurfaceVariant),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
