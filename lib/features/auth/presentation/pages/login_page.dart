import 'package:flutter/material.dart';

import '../../../../core/ui/widgets/text/app_text.dart';
import '../../../../core/ui/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Spacer(),

              /// Title
              const AppText('Welcome Back', style: AppTextStyle.displayLarge),

              const SizedBox(height: 32),

              /// Email
              AppTextField(hint: 'Email', controller: emailController),

              const SizedBox(height: 16),

              /// Password
              AppTextField(
                hint: 'Password',
                controller: passwordController,
                obscureText: obscurePassword,
                suffix: IconButton(
                  icon: Icon(
                    obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                ),
              ),

              const SizedBox(height: 8),

              /// Forgot password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              /// Login button
              PrimaryButton(
                label: 'Login',
                onPressed: () {
                  // Bloc event will go here
                },
              ),

              const SizedBox(height: 24),

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

              const SizedBox(height: 24),

              const SizedBox(height: 16),

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
                    child: const AppText(
                      'Sign Up',
                      style: AppTextStyle.bodySmall,
                    ),
                  ),
                ],
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
