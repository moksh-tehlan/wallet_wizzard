import 'package:app_ui/app_ui.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePageView();
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          height: context.screenHeight + 70.toResponsiveHeight(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 275.toResponsiveHeight(context),
                child: Stack(
                  children: [
                    Container(
                      height: 200.toResponsiveHeight(context),
                      width: context.screenWidth,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 35,
                      ).responsive(context),
                      decoration: BoxDecoration(
                        color: context.appColorScheme.appBar,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi Moksh',
                            style: context.textTheme.titleLarge
                                ?.copyWith(fontWeight: AppFontWeight.bold),
                          ),
                          SizedBox(
                            height: 5.toResponsiveHeight(context),
                          ),
                          Text(
                            'Welcome to Wallet Wizzard',
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: context.colorScheme.onSurfaceVariant
                                  .withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 30,
                        ).responsive(context),
                        height: 150.toResponsiveHeight(context),
                        width:
                            context.screenWidth - 35.toResponsiveWidth(context),
                        decoration: BoxDecoration(
                          color: context.appColorScheme.secondaryAppBar,
                          boxShadow: [
                            BoxShadow(
                              color: context.colorScheme.surface,
                              spreadRadius: 2,
                              blurRadius: 12,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi Moksh',
                              style: context.textTheme.titleLarge,
                            ),
                            SizedBox(
                              height: 10.toResponsiveHeight(context),
                            ),
                            Text(
                              'Welcome to Wallet Wizzard',
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: context.colorScheme.onSurfaceVariant
                                    .withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 35.toResponsiveWidth(context),
                      top: 115.toResponsiveHeight(context),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.toResponsiveWidth(context),
                          vertical: 2.toResponsiveHeight(context),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: context.appColorScheme.onAppBarLabel,
                        ),
                        child: Center(
                          child: Text(
                            'Balance',
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.toResponsiveHeight(context),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.5)
                    .responsive(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Saving Pocket',
                      style: context.textTheme.titleLarge,
                    ),
                    const CircleAvatar(
                      radius: 15,
                      child: Icon(
                        Icons.add,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.toResponsiveHeight(context),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 6,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (
                    context,
                    _,
                  ) {
                    return const _SavingPocketCard();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SavingPocketCard extends StatelessWidget {
  const _SavingPocketCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 17.5, right: 17.5)
          .responsive(context),
      child: SizedBox(
        height: 80.toResponsiveHeight(context),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  color: context.colorScheme.onPrimary,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Iphone 14 Pro Max'),
                    Text('82% of 1,40,000'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: context.colorScheme.errorContainer,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Today'),
                    Text('+8,700'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
