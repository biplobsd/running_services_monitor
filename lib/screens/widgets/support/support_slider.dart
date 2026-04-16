import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_confetti/flutter_confetti.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/constants.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'bouncing_stars.dart';
import 'tip_slide_card.dart';

class SupportSlider extends StatefulWidget {
  const SupportSlider({super.key});

  @override
  State<SupportSlider> createState() => _SupportSliderState();
}

class _SupportSliderState extends State<SupportSlider> {
  final PageController pageController = PageController();
  int currentPage = 0;
  Timer? autoScrollTimer;
  final Set<int> _visitedPages = {0};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _launchConfetti(isLongBurst: true));
    autoScrollTimer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!mounted) return;
      final nextPage = (currentPage + 1) % 3;
      pageController.animateToPage(nextPage, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    });
  }

  @override
  void dispose() {
    autoScrollTimer?.cancel();
    pageController.dispose();
    super.dispose();
  }

  void _launchConfetti({required bool isLongBurst}) {
    final random = Random();

    if (!isLongBurst) {
      Confetti.launch(
        context,
        options: ConfettiOptions(
          particleCount: 20,
          spread: 60,
          x: random.nextDouble(),
          y: random.nextDouble() - 0.2,
        ),
      );
      return;
    }

    final end = DateTime.now().add(const Duration(seconds: 3));

    Timer.periodic(const Duration(milliseconds: 250), (timer) {
      if (DateTime.now().isAfter(end) || !mounted) {
        timer.cancel();
        return;
      }

      Confetti.launch(
        context,
        options: ConfettiOptions(
          particleCount: 20,
          spread: 60,
          x: random.nextDouble(),
          y: random.nextDouble() - 0.2,
        ),
      );
    });
  }

  void _onPageChanged(int index) {
    if (currentPage == index) return;
    setState(() => currentPage = index);

    final isFirstVisit = !_visitedPages.contains(index);
    if (isFirstVisit) {
      _visitedPages.add(index);
    }

    _launchConfetti(isLongBurst: isFirstVisit);
  }

  Widget _buildSlide(Widget card) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: card,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final loc = context.loc;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 230,
          child: PageView(
            controller: pageController,
            onPageChanged: _onPageChanged,
            children: [
              _buildSlide(
                TipSlideCard(
                  icon: Icons.star_rounded,
                  iconColor: Colors.amber,
                  title: loc.tipsRateTitle,
                  description: loc.tipsRateDescription,
                  actionLabel: loc.tipsRateAction,
                  url: AppConstants.appPlayStoreUrl,
                  iconWidget: const BouncingStars(),
                ),
              ),
              _buildSlide(
                TipSlideCard(
                  icon: Icons.coffee_rounded,
                  iconColor: Colors.orange,
                  title: loc.tipsCoffeeTitle,
                  description: loc.tipsCoffeeDescription,
                  actionLabel: loc.tipsCoffeeAction,
                  url: AppConstants.buyMeCoffeeUrl,
                  iconWidget: Image.asset('assets/giphy.gif', height: 40),
                ),
              ),
              _buildSlide(
                TipSlideCard(
                  icon: Icons.code_rounded,
                  iconColor: Colors.teal,
                  title: loc.tipsContributeTitle,
                  description: loc.tipsContributeDescription,
                  actionLabel: loc.tipsContributeAction,
                  url: AppConstants.sourceCodeUrl,
                ),
              ),
            ],
          ),
        ),
        AppStyles.spacingH12,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: currentPage == index ? 24 : 8,
              height: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: currentPage == index ? colorScheme.primary : colorScheme.outlineVariant,
              ),
            );
          }),
        ),
      ],
    );
  }
}
