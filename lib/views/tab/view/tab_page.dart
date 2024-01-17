import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_wizard/views/tab/view/books_page/view/books_page.dart';
import 'package:wallet_wizard/views/tab/view/expenses/view/passbook.dart';
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
    const PassbookPage(),
    const BooksPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColorScheme.background,
      body: list[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: context.appColorScheme.background,
        indicatorColor: context.appColorScheme.primaryColor.withOpacity(0.1),
        surfaceTintColor: Colors.white,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
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
              color: Colors.white,
              height: 22.toResponsiveWidth(context),
              width: 22.toResponsiveWidth(context),
            ),
            selectedIcon: SvgPicture.asset(
              Assets.savingsFilledIcon,
              color: context.appColorScheme.primaryColor,
              height: 22.toResponsiveWidth(context),
              width: 22.toResponsiveWidth(context),
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              Assets.expensesIcon,
              color: Colors.white,
              height: 22.toResponsiveWidth(context),
              width: 22.toResponsiveWidth(context),
            ),
            selectedIcon: SvgPicture.asset(
              Assets.expensesFilledIcon,
              color: context.appColorScheme.primaryColor,
              height: 22.toResponsiveWidth(context),
              width: 22.toResponsiveWidth(context),
            ),
            label: 'Passbook',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              Assets.booksIcon,
              color: Colors.white,
              height: 22.toResponsiveWidth(context),
              width: 22.toResponsiveWidth(context),
            ),
            selectedIcon: SvgPicture.asset(
              Assets.booksFilledIcon,
              color: context.appColorScheme.primaryColor,
              height: 22.toResponsiveWidth(context),
              width: 22.toResponsiveWidth(context),
            ),
            label: 'Books',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              Assets.profileIcon,
              color: Colors.white,
              height: 22.toResponsiveWidth(context),
              width: 22.toResponsiveWidth(context),
            ),
            selectedIcon: SvgPicture.asset(
              Assets.profileFilledIcon,
              color: context.appColorScheme.primaryColor,
              height: 22.toResponsiveWidth(context),
              width: 22.toResponsiveWidth(context),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
