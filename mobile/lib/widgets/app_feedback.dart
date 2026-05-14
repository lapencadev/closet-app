import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:mobile/utils/app_colors.dart';

// ─────────────────────────────────────────────────────────────
//  AppFeedback — centralised snackbar feedback
//
//  Usage:
//    AppFeedback.success(context, 'Item saved');
//    AppFeedback.error(context, 'Could not save. Try again.');
//    AppFeedback.info(context, 'Changes discarded');
//    AppFeedback.success(context, 'Deleted', action: ('Undo', onUndo));
// ─────────────────────────────────────────────────────────────

class AppFeedback {
  AppFeedback._();

  static void success(
    BuildContext context,
    String message, {
    (String label, VoidCallback onPressed)? action,
    Duration duration = const Duration(seconds: 3),
  }) {
    _show(
      context,
      message: message,
      backgroundColor: AppColors.success,
      icon: Icons.check_circle_outline_rounded,
      action: action,
      duration: duration,
    );
  }

  static void error(
    BuildContext context,
    String message, {
    (String label, VoidCallback onPressed)? action,
    Duration duration = const Duration(seconds: 4),
  }) {
    _show(
      context,
      message: message,
      backgroundColor: AppColors.error,
      icon: Icons.error_outline_rounded,
      action: action,
      duration: duration,
    );
  }

  static void info(
    BuildContext context,
    String message, {
    (String label, VoidCallback onPressed)? action,
    Duration duration = const Duration(seconds: 3),
  }) {
    _show(
      context,
      message: message,
      backgroundColor: AppColors.primary,
      icon: Icons.info_outline_rounded,
      action: action,
      duration: duration,
    );
  }

  static void _show(
    BuildContext context, {
    required String message,
    required Color backgroundColor,
    required IconData icon,
    (String label, VoidCallback onPressed)? action,
    required Duration duration,
  }) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(icon, color: Colors.white, size: 18),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          backgroundColor: backgroundColor,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
          duration: duration,
          action: action != null
              ? SnackBarAction(
                  label: action.$1,
                  textColor: Colors.white,
                  onPressed: action.$2,
                )
              : null,
        ),
      );
  }
}

// ─────────────────────────────────────────────────────────────
//  ConfirmDialog — platform-aware destructive action dialog
//
//  Usage:
//    final confirmed = await ConfirmDialog.show(
//      context,
//      title: 'Delete item',
//      message: 'This action cannot be undone.',
//      confirmLabel: 'Delete',
//      isDestructive: true,
//    );
//    if (confirmed == true) { ... }
// ─────────────────────────────────────────────────────────────

class ConfirmDialog {
  ConfirmDialog._();

  static Future<bool> show(
    BuildContext context, {
    required String title,
    required String message,
    String confirmLabel = 'Confirm',
    String cancelLabel = 'Cancel',
    bool isDestructive = false,
  }) async {
    final result = await showPlatformDialog<bool>(
      context: context,
      builder: (ctx) => PlatformAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          PlatformDialogAction(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(cancelLabel),
          ),
          PlatformDialogAction(
            onPressed: () => Navigator.of(ctx).pop(true),
            cupertino: (_, __) =>
                CupertinoDialogActionData(isDestructiveAction: isDestructive),
            material: (_, __) => MaterialDialogActionData(
              style: isDestructive
                  ? TextButton.styleFrom(foregroundColor: AppColors.error)
                  : null,
            ),
            child: Text(confirmLabel),
          ),
        ],
      ),
    );
    return result ?? false;
  }
}
