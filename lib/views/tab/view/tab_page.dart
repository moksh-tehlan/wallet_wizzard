import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_wizard/views/tab/view/books_page/view/books_page.dart';
import 'package:wallet_wizard/views/tab/view/expenses/view/expenses_page.dart';
import 'package:wallet_wizard/views/tab/view/home/view/home_page.dart';
import 'package:wallet_wizard/views/tab/view/profile/view/profile_page.dart';

@RoutePage()
class TabPage extends StatelessWidget {
  const TabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabPageView();
  }
}

class TabPageView extends StatefulWidget {
  const TabPageView({super.key});

  @override
  State<TabPageView> createState() => _TabPageViewState();
}

class _TabPageViewState extends State<TabPageView> {
  int currentPageIndex = 0;
  final list = [
    const HomePage(),
    const ProfilePage(),
    const ExpensesPage(),
    const BooksPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: list[currentPageIndex]),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            icon: SvgPicture.asset(
              Assets.savingsIcon,
              color: context.isDarkMode
                  ? AppColors.darkColorScheme.onSurfaceVariant
                  : AppColors.lightColorScheme.onSurfaceVariant,
              height: 22.toResponsiveWidth(context),
              width: 22.toResponsiveWidth(context),
            ),
            selectedIcon: SvgPicture.asset(
              Assets.savingsFilledIcon,
              color: context.isDarkMode
                  ? AppColors.darkColorScheme.onSecondaryContainer
                  : AppColors.lightColorScheme.onSecondaryContainer,
              height: 22.toResponsiveWidth(context),
              width: 22.toResponsiveWidth(context),
            ),
            label: 'Savings',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              Assets.incomeIcon,
              color: context.isDarkMode
                  ? AppColors.darkColorScheme.onSurfaceVariant
                  : AppColors.lightColorScheme.onSurfaceVariant,
              height: 22.toResponsiveWidth(context),
              width: 22.toResponsiveWidth(context),
            ),
            selectedIcon: SvgPicture.asset(
              Assets.incomeFilledIcon,
              color: context.isDarkMode
                  ? AppColors.darkColorScheme.onSecondaryContainer
                  : AppColors.lightColorScheme.onSecondaryContainer,
              height: 22.toResponsiveWidth(context),
              width: 22.toResponsiveWidth(context),
            ),
            label: 'Income',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              Assets.expensesIcon,
              color: context.isDarkMode
                  ? AppColors.darkColorScheme.onSurfaceVariant
                  : AppColors.lightColorScheme.onSurfaceVariant,
              height: 22.toResponsiveWidth(context),
              width: 22.toResponsiveWidth(context),
            ),
            selectedIcon: SvgPicture.asset(
              Assets.expensesFilledIcon,
              color: context.isDarkMode
                  ? AppColors.darkColorScheme.onSecondaryContainer
                  : AppColors.lightColorScheme.onSecondaryContainer,
              height: 22.toResponsiveWidth(context),
              width: 22.toResponsiveWidth(context),
            ),
            label: 'Expenses',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              Assets.debtIcon,
              color: context.isDarkMode
                  ? AppColors.darkColorScheme.onSurfaceVariant
                  : AppColors.lightColorScheme.onSurfaceVariant,
              height: 22.toResponsiveWidth(context),
              width: 22.toResponsiveWidth(context),
            ),
            selectedIcon: SvgPicture.asset(
              Assets.debtFilledIcon,
              color: context.isDarkMode
                  ? AppColors.darkColorScheme.onSecondaryContainer
                  : AppColors.lightColorScheme.onSecondaryContainer,
              height: 22.toResponsiveWidth(context),
              width: 22.toResponsiveWidth(context),
            ),
            label: 'Debt',
          ),
        ],
      ),
    );
  }
}
