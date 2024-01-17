import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class NetBalanceCard extends StatelessWidget {
  const NetBalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: context.screenWidth,
          height: 80.toResponsiveHeight(context),
          color: context.appColorScheme.appBar,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 15, right: 15)
              .responsive(context),
          child: Container(
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
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20)
                .responsive(context),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Net Balance',
                      style: context.textTheme.titleLarge,
                    ),
                    Text(
                      '3,200',
                      style: context.textTheme.titleLarge,
                    ),
                  ],
                ),
                const Divider(
                  height: 30,
                  thickness: 0.25,
                  color: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Budget', style: context.textTheme.bodyLarge),
                    Text('20,000',
                        style: context.textTheme.bodyLarge
                            ?.copyWith(color: Colors.green)),
                  ],
                ),
                SizedBox(
                  height: 8.toResponsiveHeight(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Expenses', style: context.textTheme.bodyLarge),
                    Text('-16,000', style: context.textTheme.bodyLarge),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 40,
          top: 18,
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
                'Overview',
                style: context.textTheme.bodyMedium,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
