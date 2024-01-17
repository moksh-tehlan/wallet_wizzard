import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:wallet_wizard/views/tab/view/expenses/tabs/expenses_page.dart';
import 'package:wallet_wizard/views/tab/view/expenses/tabs/income_page.dart';

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
        backgroundColor: context.appColorScheme.background,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: context.appColorScheme.appBar,
          bottom: PreferredSize(
            preferredSize:
            Size(context.screenWidth, 20.toResponsiveHeight(context)),
            child: Center(
              child: Theme(
                data: ThemeData(
                  splashColor: Colors.transparent,
                ),
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  labelStyle: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                  labelColor: Colors.white,
                  unselectedLabelStyle: context.textTheme.titleLarge?.copyWith(
                    fontWeight: AppFontWeight.bold,
                  ),
                  unselectedLabelColor: Colors.white.withOpacity(0.5),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 34),
                  // indicatorPadding: EdgeInsets.only(right: 52),
                  tabs: const [
                    Tab(
                      child: Text(
                        'Credits',
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Debts',
                      ),
                    ),
                  ],
                ),
              ),
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
