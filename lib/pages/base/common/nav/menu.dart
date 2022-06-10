import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood/common/dialog/alert_dialog.dart';
import 'package:mood/utils/auth/auth_bloc.dart';

class Menu {
  static PopupMenuButton buildMenu(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.menu), //don't specify icon if you want 3 dot menu
      offset: const Offset(0, 45),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      itemBuilder: (context) => [
        _buildMenuItem(
            value: 0,
            text: 'Settings',
            icon: const Icon(Icons.settings, color: Colors.black54)),
        _buildMenuItem(
            value: 1,
            text: 'Configuration',
            icon: const Icon(Icons.build, color: Colors.black54)),
        _buildMenuItem(
            value: 2,
            text: 'Logout',
            icon: const Icon(Icons.logout, color: Colors.black54)),
      ],
      onSelected: (item) => _selectedItem(context, item),
    );
  }

  static PopupMenuItem<int> _buildMenuItem(
      {required int value, required String text, Icon? icon}) {
    return PopupMenuItem<int>(
        value: value,
        child: Row(
          children: [
            icon ?? const Icon(Icons.clear, color: Colors.red),
            const SizedBox(
              width: 7,
            ),
            Text(text)
          ],
        ));
  }

  static void _selectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        // TODO: add navigation to settings
        break;
      case 1:
        // TODO: add navigation to configuration
        break;
      case 2:
        _confirmSignOut(context);
        break;
    }
  }

  static Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await showAlertDialog(
      context,
      title: 'Logout',
      content: 'Are you sure that you want to logout?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    );
    if (didRequestSignOut == true) {
      context.read<AuthBloc>().add(SignoutRequestedEvent());
    }
  }
}
