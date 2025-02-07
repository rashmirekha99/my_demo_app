import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> dialogBox(BuildContext context)async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog.adaptive(
        title: Text('Exit from App'),
        content: Text('You want to exit from the App'),
        actions: [
          ElevatedButton(
            onPressed: () => SystemNavigator.pop(),
            child: Text('Yes'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('No'),
          ),
        ],
      );
    },
  );
}
