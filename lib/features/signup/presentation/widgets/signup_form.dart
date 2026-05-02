import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/routes/routes.dart';
import 'package:makanek/core/utils/responisve_utils.dart';
import 'package:makanek/core/utils/shared/Inpages/lib1.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:makanek/features/signup/presentation/bloc/signup_bloc.dart';
import 'package:makanek/features/signup/presentation/widgets/validation.dart';


class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  void _onSubmit() {
     if (_formKey.currentState!.validate()) {
    context.read<SignUpBloc>().add(SignupSubmit(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
      username: _nameController.text.trim(),
    ));
  }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.horizontal,
          vertical: context.vertical,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(
              size: 35,
              title: 'Create\nyour account',
              weight: FontWeight.bold,
              titleColor: colors.onSurface,
              textAlign: TextAlign.start,
            ),
            SizedBox(height:context.spacer),
            InputFeild(
              controller: _nameController,
              text: 'Your Name',
              keyboardType: TextInputType.text,
              action: TextInputAction.next,
              validator: (value) => Validators.validateUsername(value),
            ),
            InputFeild(
              controller: _emailController,
              text: 'Email',
              keyboardType: TextInputType.emailAddress,
              action: TextInputAction.next,
            ),
            SizedBox(height: context.screenHeight * 0.002),
            InputFeild(
              controller: _passwordController,
              text: 'Password',
              keyboardType: TextInputType.text,
              obscureText: true,
              action: TextInputAction.next,
            ),
            SizedBox(height: context.screenHeight * 0.002),
            InputFeild(
              controller: _passwordConfirmController,
              text: 'Confirm your Password',
              keyboardType: TextInputType.text,
              obscureText: true,
              action: TextInputAction.next,
              validator: (value) => Validators.validatePassword(_passwordController.text, value),
            ),
            SizedBox(height: context.spacer),
            Button(
              onPressed: _onSubmit,
              buttonColor: colors.primary,
              textColor: colors.onPrimary,
              borderRadius: 24,
              fontSize: 14,
              text: 'Sign Up',
              buttonWidth: context.buttonSize,
              fontWeight: FontWeight.bold,
              elevation: 6,
              buttonHeight: context.buttonSizeH*0.8
            ),
            SizedBox(height: context.spacer * 0.5),
            Button(
              onPressed: () {},
              buttonColor: colors.secondary,
              textColor: colors.onSecondary,
              borderRadius: 24,
              fontSize: 14,
              text: 'SignUp with Google',
              iconPath: 'assets/images/google.png',
              buttonWidth: context.buttonSize,
              fontWeight: FontWeight.bold,
              elevation: 6,
              buttonHeight: context.buttonSizeH*0.8
            ),
            SizedBox(height: context.spacer * 2),
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  AppText(
                    text: 'Already have an account?',
                    textColor: colors.onSurface,
                    textSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushReplacementNamed(context,AppRoutes.logIn),
                    child: AppText(
                      text: 'Login',
                      textColor: colors.onSurface,
                      textSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}