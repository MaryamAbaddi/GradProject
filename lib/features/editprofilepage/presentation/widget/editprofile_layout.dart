import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colors.onSurface,
      appBar: AppBar(
        title: AppText(text: 'Edit profile'),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Row(children: [
            AppText(text: 'Back', fontWeight: FontWeight.bold, textColor: colors.primary, textSize: 16),
            Icon(Icons.arrow_back_ios),
          ]),
        ),
        actions: [
          Button(
            onPressed: () => context.read<EditProfilePageBloc>().add(
              EditProfileSubmitted(name: _nameController.text),
            ),
            textColor: colors.primary,
            borderRadius: 0,
            fontSize: 16,
            text: 'Done',
            buttonWidth: context.buttonSize,
            buttonHeight: context.buttonSizeH,
            fontWeight: FontWeight.bold,
            elevation: 0,
          ),
        ],
      ),
      body: Column(
        children: [
          Divider(thickness: 0.5, color: colors.onSurface.withValues(alpha: 0.1)),
          AvatarWidget(raduis: 12, fontSize: 24),
          Divider(thickness: 0.5, color: colors.onSurface.withValues(alpha: 0.1)),
          Row(
            children: [
              AppText(text: 'Name'),
              SizedBox(width: 16),
              Expanded(
                child: InputFeild(
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  action: TextInputAction.done,
                  text: '',
                  readOnly: !_isEditing,
                  suffix: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => setState(() => _isEditing = true)
                ),
              ),
            )
          ],
        ),
            Row(
              children: [
                AppText(text: 'Email'),
                SizedBox(width: 16),
                AppText(text: widget.email),
              ],
            ),
          ],
        ),
    );
  }
}