import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isDarkTheme = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30)
              .responsive(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Account',
                style: context.textTheme.headlineLarge,
              ),
              SizedBox(
                height: 40.toResponsiveHeight(context),
              ),
              Row(
                children: [
                  Image.asset(
                    Assets.womanAvatar,
                    width: 60,
                    height: 60,
                  ),
                  SizedBox(
                    width: 40.toResponsiveWidth(context),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Moksh Tehlan',
                        style: context.textTheme.headlineMedium,
                      ),
                      SizedBox(
                        height: 8.toResponsiveHeight(context),
                      ),
                      Text(
                        '+91 7015472985',
                        style: context.textTheme.titleLarge,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 40.toResponsiveHeight(context),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 15)
                        .responsive(context),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Assets.profileIcon,
                      width: 35,
                      height: 35,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10.toResponsiveWidth(context),
                    ),
                    Text(
                      'Profile',
                      style: context.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 5,
                thickness: 0.25,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 15)
                        .responsive(context),
                child: Row(
                  children: [
                    const Icon(
                      Icons.dark_mode_outlined,
                      size: 35,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10.toResponsiveWidth(context),
                    ),
                    Text(
                      'Dark theme',
                      style: context.textTheme.titleLarge,
                    ),
                    SizedBox(
                      width: 40.toResponsiveWidth(context),
                    ),
                    Switch(
                      value: isDarkTheme,
                      onChanged: (value) {
                        setState(() {
                          isDarkTheme = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 5,
                thickness: 0.25,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 15)
                        .responsive(context),
                child: Row(
                  children: [
                    const Icon(
                      Icons.support_agent_rounded,
                      size: 35,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10.toResponsiveWidth(context),
                    ),
                    Text(
                      'Support ',
                      style: context.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 5,
                thickness: 0.25,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 15)
                        .responsive(context),
                child: Row(
                  children: [
                    const Icon(
                      Icons.error_outline_rounded,
                      size: 35,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10.toResponsiveWidth(context),
                    ),
                    Text(
                      'Terms and Conditions',
                      style: context.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 5,
                thickness: 0.25,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 15)
                        .responsive(context),
                child: Row(
                  children: [
                    const Icon(
                      Icons.power_settings_new_rounded,
                      size: 35,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10.toResponsiveWidth(context),
                    ),
                    Text(
                      'Log out',
                      style: context.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
