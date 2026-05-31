import 'package:flutter/material.dart';
import 'package:makanek/core/routes/routes.dart';
import 'package:makanek/core/utils/responisve_utils.dart';
import 'package:makanek/core/utils/shared/reusable/lib1.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:makanek/features/getname/presentation/pages/getname.dart';
import 'package:makanek/features/profileavatar/presentation/widget/avatar.dart';

class SettingsDrawer {
  static void show(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Settings',
      barrierColor: Colors.black.withValues(alpha: 0.3),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, anim1, anim2) => const _SettingsContent(),
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: anim1, curve: Curves.easeOut)),
          child: child,
        );
      },
    );
  }
}

class _SettingsContent extends StatefulWidget {
  const _SettingsContent();

  @override
  State<_SettingsContent> createState() => _SettingsContentState();
}

class _SettingsContentState extends State<_SettingsContent> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Align(
      alignment: Alignment.centerLeft,
      child: Material(
        color: Colors.white,
        child: SizedBox(
          width: context.screenWidth * 0.75,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(16, context.vertical, 16, context.vertical / 2),
                color: colors.primary.withValues(alpha: 0.15),
                child: Row(
                  children: [
                    AvatarWidget(raduis: 28, fontSize: 20),
                    SizedBox(width: context.horizontal / 2),
                    Getname(
                      showHi: false,
                      fontWeight: FontWeight.bold,
                      textSize: 18,
                      textColor: colors.primary,
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.spacer),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.horizontal / 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: 'Notifications',
                      fontWeight: FontWeight.w500,
                      textSize: 16,
                      textColor: colors.primary,
                    ),
                    Switch(
                      value: _notificationsEnabled,
                      onChanged: (value) {
                        setState(() => _notificationsEnabled = value);
                      },
                      activeColor: Colors.green,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: 
              Button(
                  onPressed: () => Navigator.pushNamed(context, AppRoutes.mylearning),
                  isText: true,
                  text: 'My learning',
                  textColor: colors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  borderRadius: 0,
                  elevation: 0,
                  buttonWidth: 0,
                  buttonHeight: 0,
                )),
              const Spacer(),
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: 'About us',
                        fontWeight: FontWeight.w500,
                        textSize: 16,
                        textColor: colors.primary,
                      ),
                      IconButton(icon: Icon(Icons.arrow_forward_ios), color: colors.onSurface, onPressed: () { 
                        Navigator.pushReplacementNamed(context, AppRoutes.aboutus);
                       },),
                    ],
                  ),
                ),
              ])
          ),
        ),
      );
  }
}