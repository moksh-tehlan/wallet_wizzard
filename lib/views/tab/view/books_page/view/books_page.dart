import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:wallet_wizard/views/tab/view/expenses/tabs/expenses_page.dart';
import 'package:wallet_wizard/views/tab/view/expenses/tabs/income_page.dart';
import 'package:wallet_wizard/views/tab/view/expenses/tabs/investment_page.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize:
                Size(context.screenWidth, 20.toResponsiveHeight(context)),
            child: TabBar(
              padding: EdgeInsets.zero,
              tabAlignment: TabAlignment.fill,
              controller: _tabController,
              tabs: const [
                Tab(
                  icon: Icon(Icons.download),
                  iconMargin: EdgeInsets.only(bottom: 1),
                  child: Text(
                    'Credits',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Tab(
                  icon: Icon(Icons.upload),
                  iconMargin: EdgeInsets.only(bottom: 1),
                  child: Text(
                    'Debts',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            IncomePage(),
            ExpensesPage(),
          ],
        ),
      ),
    );
  }
}
