import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:wallet_wizard/di/service_locator.dart';
import 'package:wallet_wizard/navigation/routes.dart';
import 'package:wallet_wizard/navigation/routes.gr.dart';
import 'package:wallet_wizard/utils/shared_pref.dart';

@RoutePage()
class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OtpPageView();
  }
}

class OtpPageView extends StatelessWidget {
  OtpPageView({super.key});

  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
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
              GestureDetector(
                onTap: () => getIt<AppRouter>().pop(),
                child: Container(
                  height: 55.toResponsiveHeight(context),
                  width: 55.toResponsiveWidth(context),
                  margin: const EdgeInsets.only(bottom: 20).responsive(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.paleLavender,
                  ),
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    color: AppColors.lilacGray, // Arrow icon
                    size: 25,
                  ),
                ),
              ),
              SizedBox(
                height: 95.toResponsiveHeight(context),
              ),
              Text(
                'Enter the code\nWe sent to +919999999999',
                style: context.textTheme.headlineMedium
                    ?.copyWith(color: AppColors.black),
              ),
              SizedBox(
                height: 30.toResponsiveHeight(context),
              ),
              Pinput(
                onChanged: (value) {},
                controller: otpController,
                length: 6,
                defaultPinTheme: PinTheme(
                  width: 53.toResponsiveWidth(context),
                  height: 50.toResponsiveHeight(context),
                  textStyle: context.textTheme.bodySmall?.copyWith(
                    color: AppColors.black,
                    letterSpacing: 1.5,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.lavenderPink,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(
                height: 5.toResponsiveHeight(context),
              ),
              _incorrectOtpMessage(
                context,
                false,
              ),
              SizedBox(
                height: 25.toResponsiveHeight(context),
              ),
              SizedBox(
                height: 8.toResponsiveHeight(context),
              ),
              Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Prefs.setUserExists(userExists: true);
                      getIt<AppRouter>().replaceAll([const HomeRoute()]);
                    },
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

  Widget _incorrectOtpMessage(BuildContext context, bool visible) {
    return Visibility(
      visible: true,
      child: Row(
        children: [
          const Icon(
            Icons.warning_amber_rounded,
            color: AppColors.red,
            size: 13,
          ),
          SizedBox(
            width: 5.toResponsiveWidth(context),
          ),
          Text(
            'controller.otpError',
            style: context.textTheme.titleSmall?.copyWith(
              color: AppColors.red,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
