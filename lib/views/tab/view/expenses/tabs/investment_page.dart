import 'package:app_ui/app_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:wallet_wizard/views/tab/view/expenses/widgets/net_balance_card.dart';
import 'package:wallet_wizard/views/tab/view/expenses/widgets/transaction_card.dart';

class InvestmentPage extends StatelessWidget {
  const InvestmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: context.screenHeight+480.toResponsiveHeight(context),
        child: Column(
          children: [
            const NetBalanceCard(),
            SizedBox(height: 20.toResponsiveHeight(context),),
            Expanded(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return const TransactionCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
