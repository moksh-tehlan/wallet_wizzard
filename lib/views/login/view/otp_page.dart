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
        backgroundColor: context.appColorScheme.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ).responsive(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () => getIt<AppRouter>().pop(),
                  child: Container(
                    alignment: Alignment.center,
                    width: 40,
                    height: 40,
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      size: 35,
                    ),
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
                            color: context.colorScheme.error,
                            width: 2.5,
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
                            color: context.appColorScheme.inputBorderColor,
                            width: 2.5,
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
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return InkWell(
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
                        width: context.screenWidth,
                        height: 60.toResponsiveHeight(context),
                        decoration: BoxDecoration(
                          color: context.appColorScheme.primaryColor,
                          borderRadius: BorderRadius.circular(5),
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
                                color: Colors.white,
                                size: 40,
                              ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
