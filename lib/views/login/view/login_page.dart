import 'package:app_ui/app_ui.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_wizard/di/service_locator.dart';
import 'package:wallet_wizard/l10n/l10n.dart';
import 'package:wallet_wizard/navigation/routes.dart';
import 'package:wallet_wizard/navigation/routes.gr.dart';
import 'package:wallet_wizard/views/login/bloc/auth_bloc.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(authRepository: getIt()),
      child: LoginPageView(),
    );
  }
}

class LoginPageView extends StatelessWidget {
  LoginPageView({super.key});

  final textController = TextEditingController();
  final phoneRegex = RegExp(r'^[6789]\d{9}$');

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is OtpSent) {
          getIt<AppRouter>().push(
            OtpRoute(
              phoneNumber: state.phoneNumber,
              verificationId: state.verificationId,
            ),
          );
        }
      },
      child: Scaffold(
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
                  context.l10n.enterYourNumber,
                  style: context.textTheme.headlineMedium
                      ?.copyWith(color: AppColors.midnightPurple),
                ),
                SizedBox(
                  height: 35.toResponsiveHeight(context),
                ),
                Container(
                  height: 65.toResponsiveHeight(context),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.toResponsiveWidth(context),
                  ),
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
                          color: AppColors.midnightPurple,
                          fontWeight: AppFontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: textController,
                          maxLength: 10,
                          onChanged: (value) {
                            context.read<AuthBloc>().add(const InitialEvent());
                          },
                          style: context.textTheme.titleLarge?.copyWith(
                            color: AppColors.midnightPurple,
                            fontWeight: AppFontWeight.bold,
                          ),
                          keyboardType: TextInputType.number,
                          cursorColor: AppColors.lilacGray,
                          decoration: InputDecoration(
                            fillColor: AppColors.lavenderPink,
                            isDense: true,
                            counterText: '',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            hintText: context.l10n.phoneNumberHint,
                            hintStyle: context.textTheme.titleLarge
                                ?.copyWith(color: AppColors.lilacGray),
                          ),
                        ),
                      ),
                    ],
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
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            state.error,
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
                Row(
                  children: [
                    const Spacer(),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () {
                            if (state is Loading) return;
                            if (!phoneRegex
                                .hasMatch(textController.value.text)) {
                              context.read<AuthBloc>().add(
                                    ErrorEvent(
                                      message: context.l10n.invalidMobileNumber,
                                    ),
                                  );
                              return;
                            }
                            context.read<AuthBloc>().add(
                                  SendOtp(
                                    phoneNumber:
                                        '+91${textController.value.text}',
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
