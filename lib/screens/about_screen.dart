import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/bloc/about_bloc/about_bloc.dart';
import 'package:running_services_monitor/core/constants.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/contributor_info.dart';
import 'package:running_services_monitor/utils/url_launcher_helper.dart';
import 'widgets/about_info_tile.dart';
import 'widgets/about_header.dart';
import 'widgets/contributor_list_tile.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AboutBloc>()..add(const AboutEvent.started()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.loc.about, style: TextStyle(fontSize: 20.sp)),
        ),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.all(16.0.w),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  BlocSelector<AboutBloc, AboutState, String>(
                    selector: (state) => state.version,
                    builder: (context, version) {
                      return AboutHeader(version: version.isEmpty ? context.loc.loading : version);
                    },
                  ),
                  SizedBox(height: 32.h),
                  AboutInfoTile(icon: Icons.person, title: context.loc.developer, subtitle: AppConstants.developerName),
                  AboutInfoTile(
                    icon: Icons.email,
                    title: context.loc.email,
                    subtitle: AppConstants.developerEmail,
                    onTap: () => UrlLauncherHelper.launchExternalUrl('mailto:${AppConstants.developerEmail}'),
                  ),
                  AboutInfoTile(
                    icon: Icons.code,
                    title: context.loc.sourceCode,
                    subtitle: AppConstants.sourceCodeUrl,
                    onTap: () => UrlLauncherHelper.launchExternalUrl(AppConstants.sourceCodeUrl),
                  ),
                  BlocSelector<AboutBloc, AboutState, List<ContributorInfo>>(
                    selector: (state) => state.contributors,
                    builder: (context, contributors) {
                      if (contributors.isEmpty) {
                        return const SizedBox.shrink();
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Text(
                                context.loc.contributors,
                                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 8.w),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primaryContainer,
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Text(
                                  '${contributors.length}',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          ...contributors.map((contributor) => ContributorListTile(contributor: contributor)),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 24.h),
                  Center(
                    child: FilledButton.tonalIcon(
                      onPressed: () => UrlLauncherHelper.launchExternalUrl(AppConstants.buyMeCoffeeUrl),
                      icon: const Icon(Icons.coffee),
                      label: Text(context.loc.buyMeCoffee, style: TextStyle(fontSize: 14.sp)),
                    ),
                  ),
                  SizedBox(height: 5.h),
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
      ),
    );
  }
}
