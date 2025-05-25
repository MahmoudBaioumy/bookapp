import 'package:flutter/material.dart';

import '../utils/assets_manager.dart';

Future<bool> showConfirmationDialog({
  required BuildContext context,
  required String title,
  required String content,
  required String confirmText,
  required String cancelText,
}) async {
  final result = await showDialog<bool>(
    context: context,
    barrierColor: Colors.black45,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: SizedBox(
          height: 145,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AssetsManager.donePopUp),
              SizedBox(height: 20),
              Text(content),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: Text(cancelText),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          TextButton(
            child: Text(confirmText),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );

  return result ?? false;
}
void showSuccessMessage({
required BuildContext context,
  required String titel,
  required String contant,
  required String  Ok,
}) {
  showDialog(
    context: context,
    barrierColor: Colors.black45,
    builder: (context) {
      return AlertDialog(
        title: Text(titel),
        content: Text(contant),
        actions: [
          TextButton(
            child: Text(Ok),
            onPressed: () {
              Navigator.of(context).pop(); // يقفل البوب أب
            },
          ),
        ],
      );
    },
  );
}
