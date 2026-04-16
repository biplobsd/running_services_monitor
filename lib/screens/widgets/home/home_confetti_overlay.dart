import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_confetti/flutter_confetti.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';

class HomeConfettiOverlay extends StatelessWidget {
  const HomeConfettiOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, bool>(
      selector: (state) =>
          state.value.shizukuReady &&
          !state.value.confettiShown &&
          !state.value.isLoadingRam &&
          state.value.allApps.isNotEmpty,
      builder: (context, shouldShow) {
        if (shouldShow) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<HomeBloc>().add(const HomeEvent.markConfettiShown());

            final end = DateTime.now().add(const Duration(seconds: 3));
            final random = Random();

            Timer.periodic(const Duration(milliseconds: 250), (timer) {
              if (DateTime.now().isAfter(end)) {
                timer.cancel();
                return;
              }

              Confetti.launch(
                context,
                options: ConfettiOptions(
                  particleCount: 30,
                  spread: 70,
                  x: random.nextDouble(),
                  y: random.nextDouble() - 0.2,
                ),
              );
            });
          });
        }
        return const SizedBox.shrink();
      },
    );
  }
}
