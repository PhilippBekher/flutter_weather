import 'package:flutter/material.dart';
import 'package:flutter_application_1/packages.dart';

class Show_dialogue {
  static Future<void> showMyDialog(value, context) async {
    if (value == 'date/time') {
      return showDialog<void>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          final now = DateTime.now();
          String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);

          print(now.year);
          return AlertDialog(
            title: const Text('Current date and time'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('This is the current date and time : ${formattedDate}')
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Close the popup'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      return showDialog<void>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          final now = DateTime.now();
          String formattedDate = DateFormat('EEEE').format(now);

          return AlertDialog(
            title: const Text('Current date and time'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('This is the current date and time : ${formattedDate}')
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Close the popup'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
