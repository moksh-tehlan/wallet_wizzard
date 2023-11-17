import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
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
  const OtpPage({
    required this.phoneNumber,
    required this.verificationId,
    super.key,
  });

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
          getIt<AppRouter>().replaceAll([const TabRoute()]);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ).responsive(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                      const Size(60, 60),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.zero,
                    ),
                  ),
                  onPressed: () => getIt<AppRouter>().pop(),
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    size: 25,
                  ),
                ),
                SizedBox(
                  height: 95.toResponsiveHeight(context),
                ),
                Text(
                  '${context.l10n.enterYourOtp} $phoneNumber',
                  style: context.textTheme.headlineMedium,
                ),
                SizedBox(
                  height: 30.toResponsiveHeight(context),
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return Pinput(
                      onChanged: (value) {
                        context.read<AuthBloc>().add(const InitialEvent());
                      },
                      controller: otpController,
                      length: 6,
                      errorText: context.l10n.wrongOtp,
                      forceErrorState: state is Error,
                      errorPinTheme: PinTheme(
                        width: 53.toResponsiveWidth(context),
                        height: 50.toResponsiveHeight(context),
                        textStyle: context.textTheme.titleLarge,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: context.isDarkMode
                                ? AppColors.darkColorScheme.error
                                : AppColors.lightColorScheme.error,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      focusedPinTheme: PinTheme(
                        width: 53.toResponsiveWidth(context),
                        height: 50.toResponsiveHeight(context),
                        textStyle: context.textTheme.titleLarge,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: context.isDarkMode
                                ? AppColors.darkColorScheme.primaryContainer
                                : AppColors.lightColorScheme.primaryContainer,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      defaultPinTheme: PinTheme(
                        width: 53.toResponsiveWidth(context),
                        height: 50.toResponsiveHeight(context),
                        textStyle: context.textTheme.titleLarge,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: context.isDarkMode
                                ? AppColors.darkColorScheme.outline
                                : AppColors.lightColorScheme.outline,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 25.toResponsiveHeight(context),
                ),
                Row(
                  children: [
                    const Spacer(),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all<Size>(
                              const Size(170, 60),
                            ),
                          ),
                          onPressed: () {
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
                                  size: 40,
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
