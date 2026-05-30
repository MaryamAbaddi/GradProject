import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:makanek/core/routes/routes.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:material_symbols_icons/symbols.dart';

class UserDropdownMenu extends StatelessWidget {
  const UserDropdownMenu({super.key});


  Future<void> logout(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.pushNamedAndRemoveUntil(
    context,
    AppRoutes.logIn,
    (route) => false, 
  );
}
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return PopupMenuButton<String>(
      icon: Icon(Icons.keyboard_arrow_down, color: colors.primary, weight: 400, size: 24),
      color: Colors.white,
      onSelected: (_) {},
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'profile',
          onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.editProfile),
          child: Row(children: [
            Icon(Symbols.person, weight: 500, size: 20),
            SizedBox(width: 8),
            AppText(text: 'profile', fontWeight: FontWeight.w400, textColor: colors.primary),
          ]),
        ),
        PopupMenuItem(
        value: 'my learning',
        onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.mylearning),
        child: Row(children: [
        Icon(Icons.book, weight: 500, size: 20, color: colors.primary),
        SizedBox(width: 8),
        AppText(text: 'My learning',fontWeight: FontWeight.w400, textColor: colors.primary,textSize: 14 ,),
      ])),
        PopupMenuItem(
          value: 'logout',
          onTap: () => logout(context),
          child: Row(children: [
            Icon(Symbols.logout, weight: 500, size: 20, color: colors.primary),
            SizedBox(width: 8),
            AppText(text: 'Logout', fontWeight: FontWeight.w400, textColor: colors.primary),
          ]),
        ),
      ],
    );
  }
}