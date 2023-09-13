import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:wallet_wizard/di/service_locator.dart';
import 'package:wallet_wizard/l10n/l10n.dart';
import 'package:wallet_wizard/navigation/routes.dart';
import 'package:wallet_wizard/navigation/routes.gr.dart';
import 'package:wallet_wizard/utils/shared_pref.dart';
import 'package:wallet_wizard/views/login/bloc/auth_bloc.dart';

@RoutePage()
class OtpPage extends StatelessWidget {
  const OtpPage(
      {required this.phoneNumber, required this.verificationId, super.key});

  final String phoneNumber;
  final String verificationId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(authRepository: getIt()),
      child: OtpPageView(
        phoneNumber: phoneNumber,
        verificationId: verificationId,
      ),
    );
  }
}

class OtpPageView extends StatelessWidget {
  OtpPageView({
    required this.phoneNumber,
    required this.verificationId,
    super.key,
  });

  final otpController = TextEditingController();
  final String phoneNumber;
  final String verificationId;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is OtpVerified) {
          getIt<AppRouter>().replaceAll([const HomeRoute()]);
        }
      },
      child: Scaffold(
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
                    margin:
                        const EdgeInsets.only(bottom: 20).responsive(context),
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
                  '${context.l10n.enterYourOtp} $phoneNumber',
                  style: context.textTheme.headlineMedium
                      ?.copyWith(color: AppColors.midnightPurple),
                ),
                SizedBox(
                  height: 30.toResponsiveHeight(context),
                ),
                Pinput(
                  onChanged: (value) {
                    context.read<AuthBloc>().add(const InitialEvent());
                  },
                  controller: otpController,
                  length: 6,
                  defaultPinTheme: PinTheme(
                    width: 53.toResponsiveWidth(context),
                    height: 50.toResponsiveHeight(context),
                    textStyle: context.textTheme.titleLarge
                        ?.copyWith(color: AppColors.midnightPurple),
                    decoration: BoxDecoration(
                      color: AppColors.lavenderPink,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.toResponsiveHeight(context),
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is Error) {
                      return Row(
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
                            context.l10n.wrongOtp,
                            style: context.textTheme.titleSmall?.copyWith(
                              color: AppColors.red,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      );
                    }
                    return const SizedBox();
                  },
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
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () {
                            if (state is Loading) return;
                            if (otpController.value.text.length < 6) {
                              context.read<AuthBloc>().add(
                                    ErrorEvent(message: context.l10n.wrongOtp),
                                  );
                              return;
                            }
                            Prefs.setUserExists(userExists: true);
                            context.read<AuthBloc>().add(
                                  VerifyOtp(
                                    otp: otpController.value.text,
                                    verificationId: verificationId,
                                  ),
                                );
                          },
                          child: Container(
                            height: 55.toResponsiveHeight(context),
                            width: 170.toResponsiveWidth(context),
                            margin: const EdgeInsets.only(bottom: 20)
                                .responsive(context),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.electricPurple,
                            ),
                            child: state is Loading
                                ? Center(
                                    child: SizedBox(
                                      width: 23.toResponsiveWidth(context),
                                      height: 23.toResponsiveWidth(context),
                                      child: const CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                : const Icon(
                                    Icons.arrow_right_alt_rounded,
                                    color: AppColors.white, // Arrow icon
                                    size: 40,
                                  ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
