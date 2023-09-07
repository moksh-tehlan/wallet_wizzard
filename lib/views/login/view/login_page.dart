import 'package:app_ui/app_ui.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wallet_wizard/di/service_locator.dart';
import 'package:wallet_wizard/navigation/routes.dart';
import 'package:wallet_wizard/navigation/routes.gr.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginPageView();
  }
}

class LoginPageView extends StatelessWidget {
  const LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(20).responsive(context),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.lavenderPink,
              Colors.white,
              AppColors.lavenderPink,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 150.toResponsiveHeight(context),
              ),
              Text(
                'Please enter your\nMobile number to continue',
                style: context.textTheme.headlineMedium
                    ?.copyWith(color: Colors.black),
              ),
              SizedBox(
                height: 35.toResponsiveHeight(context),
              ),
              Container(
                height: 65.toResponsiveHeight(context),
                padding: EdgeInsets.symmetric(
                    horizontal: 20.toResponsiveWidth(context)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.lavenderPink,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '+91 | ',
                      style: context.textTheme.headlineSmall?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        maxLength: 10,
                        onChanged: (value) {
                          if (value.length == 10) {
                            final indianMobileRegex = RegExp(r'^[6789]\d{9}$');
                          } else {}
                        },
                        style: context.textTheme.titleLarge?.copyWith(
                          color: Colors.black,
                        ),
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.blue,
                        decoration: InputDecoration(
                          fillColor: AppColors.lavenderPink,
                          isDense: true,
                          counterText: '',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: 'Phone number',
                          hintStyle: context.textTheme.titleLarge
                              ?.copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.toResponsiveHeight(context),
              ),
              _incorrectMobileNumberText(context, false),
              SizedBox(
                height: 25.toResponsiveHeight(context),
              ),
              Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () => getIt<AppRouter>().push(const OtpRoute()),
                    child: Container(
                      height: 55.toResponsiveHeight(context),
                      width: 170.toResponsiveWidth(context),
                      margin:
                          const EdgeInsets.only(bottom: 20).responsive(context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.electricPurple,
                      ),
                      child: const Icon(
                        Icons.arrow_right_alt_rounded,
                        color: AppColors.white, // Arrow icon
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _incorrectMobileNumberText(BuildContext context, bool visible) =>
      Visibility(
        visible: true,
        child: Row(
          children: [
            const Icon(
              Icons.warning_amber_rounded,
              color: AppColors.red,
              size: 13,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              'controller.phoneNumberError',
              style: context.textTheme.titleSmall?.copyWith(
                color: AppColors.red,
                fontSize: 13,
              ),
            ),
          ],
        ),
      );
}
