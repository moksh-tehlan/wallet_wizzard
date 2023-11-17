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
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20).responsive(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150.toResponsiveHeight(context),
                ),
                Text(
                  context.l10n.enterYourNumber,
                  style: context.textTheme.headlineMedium,
                ),
                SizedBox(
                  height: 35.toResponsiveHeight(context),
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    final errorText = (state is Error) ? state.error : null;
                    return TextField(
                      controller: textController,
                      maxLength: 10,
                      onChanged: (value) {
                        context.read<AuthBloc>().add(const InitialEvent());
                      },
                      style: Theme.of(context).textTheme.titleLarge,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixText: '+91 | ',
                        suffixIcon:
                            state is Error ? const Icon(Icons.error) : null,
                        border: const OutlineInputBorder(),
                        errorText: errorText,
                        isDense: true,
                        counterText: '',
                        labelText: context.l10n.phoneNumberHint,
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
                          child: state is Loading
                              ? Center(
                                  child: SizedBox(
                                    width: 23.toResponsiveWidth(context),
                                    height: 23.toResponsiveWidth(context),
                                    child: const CircularProgressIndicator(),
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
