import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showErrorSnackBar(String text,
    {required BuildContext context,
    GlobalKey<ScaffoldState>? key,
    SnackBarAction? action}) {
  final snackBar = SnackBar(
    content: Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    duration: const Duration(milliseconds: 1700),
    backgroundColor: Colors.red,
    action: action,
  );
  if (key != null) {
    key.currentState!.showSnackBar(snackBar);
  } else {
    Scaffold.of(context).showSnackBar(snackBar);
  }
}

Future<void> showSnackBar(String text, BuildContext? context,
    {GlobalKey<ScaffoldState>? key,
    SnackBarAction? action,
    Color? textColor,
    Color? backgroundColor,
    hide = true,
    Duration? duration,
    String? actionText,
    VoidCallback? callback}) async {
  final snackBar = SnackBar(
    content: Row(
      children: [
        Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const Spacer(),
        const SizedBox(
          width: 10,
        )
      ],
    ),
    duration: duration ?? const Duration(milliseconds: 2000),
    backgroundColor: CupertinoColors.activeBlue,
    action: action,
  );
  if (key != null) {
    key.currentState!.showSnackBar(snackBar);
  } else {
    Scaffold.of(context!).showSnackBar(snackBar);
  }
}
