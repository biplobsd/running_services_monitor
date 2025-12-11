import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/contributor_info.dart';

class ContributorListTile extends StatelessWidget {
  final ContributorInfo contributor;

  const ContributorListTile({super.key, required this.contributor});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      margin: EdgeInsets.symmetric(vertical: 4.h),
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        leading: Icon(Icons.person, size: 24.w, color: colorScheme.primary),
        title: Text(
          contributor.name ?? contributor.login,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '@${contributor.login}',
              style: TextStyle(fontSize: 12.sp, color: colorScheme.primary),
            ),
            Text(
              context.loc.contributionsCount(contributor.contributions),
              style: TextStyle(fontSize: 11.sp, color: colorScheme.onSurfaceVariant),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (contributor.pullRequests.isNotEmpty)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  '${contributor.pullRequests.length} PRs',
                  style: TextStyle(fontSize: 11.sp, color: colorScheme.onPrimaryContainer),
                ),
              ),
            SizedBox(width: 8.w),
            IconButton(
              icon: Icon(Icons.open_in_new, size: 18.w),
              onPressed: () => _launchUrl(contributor.profileUrl),
              tooltip: context.loc.openGithubProfile,
              visualDensity: VisualDensity.compact,
            ),
          ],
        ),
        children: [
          if (contributor.pullRequests.isNotEmpty)
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: contributor.pullRequests.map((pr) {
                  return ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.merge, size: 18.w, color: colorScheme.primary),
                    title: Text(
                      pr.title,
                      style: TextStyle(fontSize: 13.sp),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Text(
                      '#${pr.number}',
                      style: TextStyle(fontSize: 12.sp, color: colorScheme.onSurfaceVariant),
                    ),
                    onTap: () => _launchUrl(pr.prUrl),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
