import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/about_bloc/about_bloc.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/constants.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/contributor_info.dart';
import 'package:running_services_monitor/utils/url_launcher_helper.dart';
import 'widgets/about/about_info_tile.dart';
import 'widgets/about/about_header.dart';
import 'widgets/about/contributor_list_tile.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AboutBloc>()..add(const AboutEvent.started()),
      child: Scaffold(
        appBar: AppBar(title: Text(context.loc.about, style: AppStyles.headlineStyle)),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: AppStyles.sectionPadding,
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  BlocSelector<AboutBloc, AboutState, String>(
                    selector: (state) => state.version,
                    builder: (context, version) {
                      return AboutHeader(version: version.isEmpty ? context.loc.loading : version);
                    },
                  ),
                  SizedBox(height: 32),
                  // AboutInfoTile(icon: Icons.person, title: context.loc.developer, subtitle: AppConstants.developerName),
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
                  AppStyles.spacingH16,
                  BlocSelector<AboutBloc, AboutState, List<ContributorInfo>>(
                    selector: (state) => state.contributors,
                    builder: (context, contributors) {
                      if (contributors.isEmpty) {
                        return const SizedBox.shrink();
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                context.loc.contributors,
                                style: AppStyles.titleStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              AppStyles.spacing8,
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(color: Theme.of(context).colorScheme.primaryContainer, borderRadius: BorderRadius.circular(12)),
                                child: Text(
                                  '${contributors.length}',
                                  style: AppStyles.captionStyle.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          AppStyles.spacingH8,
                          ...contributors.map((contributor) => ContributorListTile(contributor: contributor)),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 24),
                  Center(
                    child: FilledButton.tonalIcon(
                      onPressed: () => UrlLauncherHelper.launchExternalUrl(AppConstants.buyMeCoffeeUrl),
                      icon: const Icon(Icons.coffee),
                      label: Text(context.loc.buyMeCoffee, style: AppStyles.bodyStyle),
                    ),
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: Text(context.loc.madeInBangladesh, style: AppStyles.bodyStyle.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant)),
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
