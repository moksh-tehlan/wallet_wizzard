import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class NetBalanceCard extends StatelessWidget {
  const NetBalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10).responsive(context),
      child: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.surfaceVariant,
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20)
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
    );
  }
}
