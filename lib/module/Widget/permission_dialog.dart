import 'package:flutter/material.dart';

class PermissionDialog extends StatelessWidget {
  final bool isDenied;
  final Function onPressed;
  PermissionDialog({required this.isDenied, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('alert'),
      content: Text(isDenied ? 'you_denied' : 'you_denied_forever'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      actions: [
        ElevatedButton(
          onPressed: onPressed as void Function()?,
          child: Text(isDenied ? 'ok' : 'settings'),
        )
      ],
    );
  }
}
