import 'package:flutter/material.dart';

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
              const Text(
                'Welcome Back',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

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
                    child: Text('OR'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),

              const SizedBox(height: 24),

              /// Google login
              // OutlinedButton.icon(
              //   onPressed: () {},
              //   icon: Image.network(
              //     'https://upload.wikimedia.org/wikipedia/commons/0/09/IOS_Google_icon.png',
              //     height: 18,
              //   ),
              //   label: const Text('Login with Google'),
              //   style: OutlinedButton.styleFrom(
              //     minimumSize: const Size(double.infinity, 52),
              //   ),
              // ),
              const SizedBox(height: 16),

              /// Sign up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Don't have an account? "),
                  GestureDetector(onTap: () {}, child: const Text('Sign Up')),
                ],
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
