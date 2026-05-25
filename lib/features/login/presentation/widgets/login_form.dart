import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/routes/routes.dart';
import 'package:makanek/core/utils/responisve_utils.dart';
import 'package:makanek/core/utils/shared/Inpages/lib1.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:makanek/features/login/presentation/bloc/login_bloc.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
    child: ConstrainedBox(
    constraints: BoxConstraints(
    minHeight: MediaQuery.of(context).size.height,
    ),
    child: IntrinsicHeight( 
      child:
    Padding(
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
            title: 'log into\nyour account',
            weight: FontWeight.bold,
            titleColor: colors.onSurface,
            textAlign: TextAlign.start,
          ),
          SizedBox(height:context.spacer),
          InputFeild(
            controller: _emailController,
            text: 'Email',
            keyboardType: TextInputType.emailAddress,
            action: TextInputAction.next,
          ),
          InputFeild(
            controller: _passwordController,
            text: 'Password',
            keyboardType: TextInputType.emailAddress,
            action: TextInputAction.next,
            obscureText: true,
            suffix: TextButton(
              onPressed: () {},
              child: AppText(
                text: 'Forgot?',
                textSize: 12,
                textColor: colors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          CheckBox(),
          SizedBox(height:context.spacer),
          Button(
            onPressed: () {
              if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please fill in all fields')),
                );
                return;
              }
              context.read<LoginBloc>().add(LoginSubmit(
                username: _emailController.text,
                password: _passwordController.text,
              ));
            },
            buttonColor: colors.primary,
            textColor: colors.onPrimary,
            fontSize: 16,
            text: 'Log in',
            buttonWidth: context.buttonSize,
            fontWeight: FontWeight.bold,
            elevation: 0,
            borderRadius: 34, 
            buttonHeight: context.buttonSizeH*0.8,
          ),
          SizedBox(height:context.spacer*0.5),
          Button(
            // ignore: avoid_print
            onPressed: () => print("Google Login Tapped"),
            buttonColor: colors.secondary,
            textColor: colors.onSecondary,
            borderRadius: 34,
            fontSize: 16,
            text: 'Log in with Google',
            iconPath: 'assets/images/google.png',
            buttonWidth: context.buttonSize,
            fontWeight: FontWeight.bold,
            elevation: 0,
            buttonHeight: context.buttonSizeH*0.8
          ),
          SizedBox(height:context.spacer*2),
          Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                AppText(
                  text: "Don't have an account?",
                  fontWeight: FontWeight.w400,
                  textSize: 14,
                  textColor: colors.onSurface,
                ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacementNamed(context,AppRoutes.signUp),
                  child: AppText(
                    text: 'SignUp',
                    fontWeight: FontWeight.bold,
                    textSize: 14,
                    textColor: colors.onSurface,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    )
    )
    );
  }
}