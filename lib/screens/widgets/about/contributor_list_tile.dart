import 'package:flutter/material.dart';
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
      margin: EdgeInsets.symmetric(vertical: 4),
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        leading: Icon(Icons.person, size: 24, color: colorScheme.primary),
        title: Text(
          contributor.name ?? contributor.login,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '@${contributor.login}',
              style: TextStyle(fontSize: 12, color: colorScheme.primary),
            ),
            Text(
              context.loc.contributionsCount(contributor.contributions),
              style: TextStyle(fontSize: 11, color: colorScheme.onSurfaceVariant),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (contributor.pullRequests.isNotEmpty)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${contributor.pullRequests.length} PRs',
                  style: TextStyle(fontSize: 11, color: colorScheme.onPrimaryContainer),
                ),
              ),
            SizedBox(width: 8),
            IconButton(
              icon: Icon(Icons.open_in_new, size: 18),
              onPressed: () => _launchUrl(contributor.profileUrl),
              tooltip: context.loc.openGithubProfile,
              visualDensity: VisualDensity.compact,
            ),
          ],
        ),
        children: [
          if (contributor.pullRequests.isNotEmpty)
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: contributor.pullRequests.map((pr) {
                  return ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.merge, size: 18, color: colorScheme.primary),
                    title: Text(
                      pr.title,
                      style: TextStyle(fontSize: 13),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Text(
                      '#${pr.number}',
                      style: TextStyle(fontSize: 12, color: colorScheme.onSurfaceVariant),
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
