import 'package:flutter/material.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:material_symbols_icons/symbols.dart';

class UserDropdownMenu extends StatelessWidget {
  const UserDropdownMenu({super.key});

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
          child: Row(children: [
            Icon(Symbols.person, weight: 500, size: 20),
            AppText(text: 'profile', fontWeight: FontWeight.w400, textColor: colors.primary),
          ]),
        ),
        PopupMenuItem(
          value: 'logout',
          onTap: () {
            // your logout logic here
          },
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