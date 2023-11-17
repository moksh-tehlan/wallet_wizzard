import 'package:app_ui/app_ui.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet_wizard/di/service_locator.dart';
import 'package:wallet_wizard/l10n/l10n.dart';
import 'package:wallet_wizard/navigation/routes.dart';
import 'package:wallet_wizard/navigation/routes.gr.dart';
import 'package:wallet_wizard/utils/shared_pref.dart';
import 'package:wallet_wizard/views/onboarding/bloc/on_boarding_cubit.dart';

@RoutePage()
class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: const OnBoardingView(),
    );
  }
}

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingCubit = context.read<OnBoardingCubit>()..set(3);
    final pageController = onBoardingCubit.state.pageController;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const Spacer(),
                BlocBuilder<OnBoardingCubit, OnBoardingState>(
                  builder: (context, state) {
                    return Container(
                      margin: const EdgeInsets.only(top: 20, right: 20)
                          .responsive(context),
                      height: 40.toResponsiveHeight(context),
                      child: Visibility(
                        visible: !state.isLastPage,
                        child: ElevatedButton(
                          onPressed: () {
                            pageController.animateToPage(
                              onBoardingCubit.state.maxPage - 1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Text(
                            context.l10n.skip,
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: 600.toResponsiveHeight(context),
              child: PageView(
                controller: pageController,
                onPageChanged: onBoardingCubit.navigateToPage,
                children: [
                  _OnBoardingPageContent(
                    image: Image.asset(
                      Assets.jarImage,
                      height: 400.toResponsiveHeight(context),
                      fit: BoxFit.fitHeight,
                    ),
                    headingText: context.l10n.saveForFuture,
                    subHeadingText: context.l10n.lorumIpsum,
                  ),
                  _OnBoardingPageContent(
                    image: Image.asset(
                      Assets.expensesImage,
                      height: 400.toResponsiveHeight(context),
                      fit: BoxFit.fitHeight,
                    ),
                    headingText: context.l10n.trackYourSpend,
                    subHeadingText: context.l10n.lorumIpsum,
                  ),
                  _OnBoardingPageContent(
                    image: Image.asset(
                      Assets.analysisImage,
                      height: 400.toResponsiveHeight(context),
                      fit: BoxFit.fitHeight,
                    ),
                    headingText: context.l10n.analyzeYourSpendings,
                    subHeadingText: context.l10n.lorumIpsum,
                  ),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: WormEffect(
                dotHeight: 12,
                dotWidth: 12,
                activeDotColor: context.isDarkMode
                    ? AppColors.darkColorScheme.primary
                    : AppColors.lightColorScheme.primary,
                dotColor: context.isDarkMode
                    ? AppColors.darkColorScheme.outline
                    : AppColors.lightColorScheme.outline,
              ),
              onDotClicked: (index) {
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20).responsive(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<OnBoardingCubit, OnBoardingState>(
                    builder: (context, state) {
                      return Visibility(
                        visible: state.currentPage != 0,
                        child: ElevatedButton(
                          onPressed: () {
                            pageController.animateToPage(
                              onBoardingCubit.state.currentPage - 1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all<Size>(
                              const Size(80, 60),
                            ),
                          ),
                          child: const Icon(
                            Icons.arrow_back_rounded,
                            // color: AppColors.lilacGray, // Arrow icon
                            size: 25,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  BlocBuilder<OnBoardingCubit, OnBoardingState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          if (state.isLastPage) {
                            Prefs.setOnBoardingVisited();
                            getIt<AppRouter>().replace(const LoginRoute());
                          }
                          pageController.animateToPage(
                            state.currentPage + 1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all<Size>(
                            const Size(150, 60),
                          ),
                        ),
                        child: state.isLastPage
                            ? Center(
                                child: Text(
                                  context.l10n.getStarted,
                                  style: context.textTheme.bodyLarge,
                                ),
                              )
                            : const Icon(
                                Icons.arrow_right_alt_rounded,
                                size: 40,
                              ),
                        // ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnBoardingPageContent extends StatelessWidget {
  const _OnBoardingPageContent({
    required this.image,
    required this.headingText,
    required this.subHeadingText,
  });

  final Widget image;
  final String headingText;
  final String subHeadingText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        image,
        Text(
          headingText,
          textAlign: TextAlign.center,
          style: context.textTheme.displayLarge,
        ),
        SizedBox(
          width: 250.toResponsiveWidth(context),
          child: Text(
            subHeadingText,
            style: context.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
