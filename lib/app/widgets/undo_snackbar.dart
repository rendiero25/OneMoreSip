import 'package:flutter/material.dart';
import 'package:onemoresip/app/theme/app_dimens.dart';
import 'package:onemoresip/l10n/gen/app_localizations.dart';

/// DS-5 undo snackbar: [message] + "Undo" for 5 s. Colors (`ink` bg,
/// `onInk` text, `snackAction` action) come from the theme. With a screen
/// reader on, Flutter keeps it open until dismissed.
ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showUndoSnackbar(
  BuildContext context, {
  required String message,
  required VoidCallback onUndo,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 5),
      // Actions persist by default; DS-5 wants the 5 s timeout.
      persist: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.md)),
      ),
      action: SnackBarAction(
        label: AppLocalizations.of(context).undo,
        onPressed: onUndo,
      ),
    ),
  );
}
