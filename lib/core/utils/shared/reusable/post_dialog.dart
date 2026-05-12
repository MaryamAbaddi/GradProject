

import 'package:flutter/material.dart';
import 'package:makanek/core/utils/responisve_utils.dart';
import 'package:makanek/core/utils/shared/Inpages/lib1.dart';
import 'package:makanek/features/addpost/domain/entity/addpost_output.dart';
import 'package:makanek/features/addpost/presentation/pages/addpost_page.dart';
import 'package:makanek/features/profileavatar/presentation/widget/avatar.dart';

class PostDialog {
  static void showAddPostDialog(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) => AlertDialog(
        scrollable: true,
        titlePadding: const EdgeInsets.fromLTRB(2, 2, 2, 0),
        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        insetPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 120),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () => Navigator.of(dialogContext, rootNavigator: true).pop(),
              icon: Icon(Icons.close, color: colors.onSurface, size: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTitle(
                  size: 20,
                  title: 'Add new post',
                  weight: FontWeight.w400,
                  titleColor: colors.primary,
                  textAlign: TextAlign.left,
                ),
                SizedBox(width: context.spacer * 3.5),
                AvatarWidget(raduis: 18, fontSize: 16),
              ],
            ),
            Divider(thickness: 0.5, color: colors.onSurface.withValues(alpha: 0.1)),
          ],
        ),
        content: const SizedBox(
          height: 300,
          width: double.maxFinite,
          child: AddPostBottomSheet(),
        ),
      ),
    );
  }
  static void showEditPost(BuildContext context, OutputEntity post, Function(String) onSave) {
        final colors = Theme.of(context).colorScheme;

    final controller = TextEditingController(text: post.body);
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: colors.onPrimary,
        title: const Text('Edit Post'),
        content: TextField(
          controller: controller,
          maxLines: 4,
          decoration: const InputDecoration(hintText: 'Edit your post...'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              onSave(controller.text.trim());
              Navigator.pop(dialogContext);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
