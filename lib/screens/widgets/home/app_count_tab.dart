import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/app_info_bloc/app_info_bloc.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/models/app_info_state_model.dart';
import 'package:running_services_monitor/models/service_info.dart';

class AppCountTab extends StatelessWidget {
  final String label;
  final bool Function(AppProcessInfo app, CachedAppInfo? cachedApp) filter;

  const AppCountTab({super.key, required this.label, required this.filter});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: BlocSelector<AppInfoBloc, AppInfoState, Map<String, CachedAppInfo>>(
        bloc: getIt<AppInfoBloc>(),
        selector: (state) => state.value.cachedApps,
        builder: (context, cachedApps) {
          return BlocSelector<HomeBloc, HomeState, int>(
            selector: (state) {
              return state.value.allApps.where((app) {
                final cached = cachedApps[app.packageName];
                return filter(app, cached);
              }).length;
            },
            builder: (context, count) {
              return Text('$label ($count)', style: AppStyles.bodyStyle);
            },
          );
        },
      ),
    );
  }
}
