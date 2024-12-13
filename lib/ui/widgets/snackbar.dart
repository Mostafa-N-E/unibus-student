

import 'package:flutter/material.dart';

class ShowSnackBar {
  void showSnackBar(
      BuildContext context,
      String title, {
        SnackBarAction? action,
        Color? background_color = Colors.white,
        Color? text_color = Colors.black,
        Duration duration = const Duration(seconds: 1),
        bool noAction = false,
      }) {
    try {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: duration,
          elevation: 6,
          backgroundColor: background_color,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            // side: BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.circular(24),
          ),
          content: Text(
            title,
            style: TextStyle(
              color: text_color,
              fontFamily: 'Sahel',
            ),
          ),
          action: noAction
              ? null
              : action ??
              SnackBarAction(
                textColor: Colors.grey[900],//Theme.of(context).colorScheme.secondary,
                label: "OK",
                onPressed: () {},
              ),
        ),
      );
    } catch (e) {
      // log('Failed to show Snackbar with title:$title');
    }
  }
}