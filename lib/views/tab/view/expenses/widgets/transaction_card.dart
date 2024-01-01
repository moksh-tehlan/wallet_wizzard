import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10).responsive(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10)
            .responsive(context),
        color: context.colorScheme.surfaceVariant.withOpacity(0.5),
        height: 120.toResponsiveHeight(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            categoryCard(
                              context,
                              'Food',
                              context.colorScheme.primary,
                            ),
                            categoryCard(
                              context,
                              'Cash',
                              context.colorScheme.tertiary,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          'Remark for payment',
                          style: context.textTheme.bodyMedium
                              ?.copyWith(fontWeight: AppFontWeight.bold),
                        ),
                        SizedBox(height: 5.toResponsiveHeight(context)),
                      ],
                    ),
                  ),
                  Text(
                    '2,000',
                    style: context.textTheme.titleLarge
                        ?.copyWith(color: context.colorScheme.error),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 0.25,
              color: Colors.white,
            ),
            Text(
              'Entry at 12:09 AM',
              style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant.withOpacity(0.8)),
            ),
          ],
        ),
      ),
    );
  }

  Padding categoryCard(
      BuildContext context, String categoryName, Color categoryColor) {
    return Padding(
      padding: const EdgeInsets.only(right: 5).responsive(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3)
            .responsive(context),
        decoration: BoxDecoration(
          color: categoryColor.withOpacity(0.15),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          categoryName,
          style: context.textTheme.bodySmall?.copyWith(color: categoryColor),
        ),
      ),
    );
  }
}
