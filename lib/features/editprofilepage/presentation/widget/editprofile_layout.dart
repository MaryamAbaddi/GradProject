import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/routes/routes.dart';
import 'package:makanek/core/utils/responisve_utils.dart';
import 'package:makanek/core/utils/shared/Inpages/lib1.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:makanek/features/editprofilepage/presentation/bloc/editpage_bloc.dart';
import 'package:makanek/features/editprofilepage/presentation/bloc/editprofile_events.dart';
import 'package:makanek/features/profileavatar/presentation/widget/avatar.dart';

class EditprofileLayout extends StatefulWidget {
  final String name;
  final String email;
  const EditprofileLayout({super.key, required this.name, required this.email});

  @override
  State<EditprofileLayout> createState() => _EditprofileLayoutState();
}

class _EditprofileLayoutState extends State<EditprofileLayout> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final FocusNode _nameFocus;
  late final FocusNode _emailFocus;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _emailController = TextEditingController(text: widget.email);
    _nameFocus = FocusNode();
    _emailFocus = FocusNode();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _nameFocus.dispose();
    _emailFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 90,
        titleSpacing: 50,
        title: AppText(text: 'Edit profile', fontWeight: FontWeight.bold, textSize: 16),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: GestureDetector(
            onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.main),
            child: Row(children: [
              Icon(Icons.arrow_back_ios, color: colors.primary),
              AppText(text: 'Back', fontWeight: FontWeight.bold, textColor: colors.primary, textSize: 16),
            ]),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Button(
              isText: true,
              onPressed: () => context.read<EditProfilePageBloc>().add(
                EditProfileSubmitted(name: _nameController.text, email: _emailController.text),
              ),
              textColor: colors.primary,
              fontSize: 16,
              text: 'Done',
              borderRadius: 0,
              buttonWidth: 0,
              buttonHeight: 0,
              fontWeight: FontWeight.bold,
              elevation: 0,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Divider(thickness: 0.5, color: colors.onSurface.withValues(alpha: 0.1)),
            AvatarWidget(raduis: 60, fontSize: 40),
            Divider(thickness: 0.5, color: colors.onSurface.withValues(alpha: 0.1)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppText(text: 'Name', textSize: 16),
                SizedBox(width: context.horizontal),
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: InputFeild(
                      controller: _nameController,
                      focusNode: _nameFocus,
                      keyboardType: TextInputType.name,
                      action: TextInputAction.done,
                      text: '',
                      readOnly: !_isEditing,
                      suffix: IconButton(
                        icon: Icon(Icons.edit, color: colors.primary),
                        onPressed: () {
                          setState(() => _isEditing = true);
                          _nameFocus.requestFocus();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppText(text: 'Email', textSize: 16),
                SizedBox(width: context.horizontal),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: InputFeild(
                      controller: _emailController,
                      focusNode: _emailFocus,
                      keyboardType: TextInputType.emailAddress,
                      action: TextInputAction.done,
                      text: '',
                      readOnly: !_isEditing,
                      suffix: IconButton(
                        icon: Icon(Icons.edit, color: colors.primary),
                        onPressed: () {
                          setState(() => _isEditing = true);
                          _emailFocus.requestFocus();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}