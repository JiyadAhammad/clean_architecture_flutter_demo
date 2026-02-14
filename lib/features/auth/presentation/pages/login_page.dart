import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/ui/commands/snackbar_command.dart';
import '../../../../core/ui/widgets/text/app_text.dart';
import '../../../../core/ui/widgets/widgets.dart';
import '../../../../core/utils/validators.dart';
import '../../domain/entities/auth_user_entity.dart';
import '../bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // bool obscurePassword = true;

  final ValueNotifier<bool> isObscurePassword = ValueNotifier<bool>(true);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Spacer(),

                /// Title
                const AppText(
                  'Welcome Back',
                  style: AppTextStyle.headlineLarge,
                ),

                const SizedBox(height: 24),

                /// Email
                AppTextField(
                  hint: 'Enter your email',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.email,
                ),

                const SizedBox(height: 16),

                /// Password
                ValueListenableBuilder<bool>(
                  valueListenable: isObscurePassword,
                  builder: (_, bool isObscure, __) {
                    return AppTextField(
                      hint: 'Enter password',
                      controller: passwordController,
                      obscureText: isObscure,
                      validator: Validators.password,
                      suffix: IconButton(
                        icon: Icon(
                          isObscure ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          isObscurePassword.value = !isObscure;
                        },
                      ),
                    );
                  },
                ),

                /// Forgot password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: AppText(
                      'Forgot Password?',
                      style: AppTextStyle.bodySmall,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                /// Login button
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (BuildContext context, AuthState state) {
                    state.whenOrNull(
                      authenticated: (AuthUserEntity user) {
                        // Navigate to dashboard
                        SnackbarCommand.show(
                          type: ToastType.success,
                          title: user.fullName,
                        );
                      },
                      error: (String message) {
                        SnackbarCommand.show(
                          type: ToastType.error,
                          title: message,
                        );
                      },
                    );
                  },
                  builder: (BuildContext context, AuthState state) {
                    final bool isLoading = state.maybeWhen(
                      loading: () => true,
                      orElse: () => false,
                    );
                    return PrimaryButton(
                      label: 'Login',
                      isLoading: isLoading,
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if (_formKey.currentState!.validate()) {
                          final String email = emailController.text.trim();
                          final String password = passwordController.text
                              .trim();
                          context.read<AuthBloc>().add(
                            AuthEvent.loginRequested(
                              username: email,
                              password: password,
                            ),
                          );
                        }
                      },
                    );
                  },
                ),

                const SizedBox(height: 16),

                /// Divider
                const Row(
                  children: <Widget>[
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: AppText('OR', style: AppTextStyle.bodySmall),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),

                const SizedBox(height: 8),

                /// Sign up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const AppText(
                      "Don't have an account? ",
                      style: AppTextStyle.bodySmall,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: AppText(
                        'Sign Up',
                        style: AppTextStyle.bodyMedium,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),

                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    isObscurePassword.dispose();
    super.dispose();
  }
}
