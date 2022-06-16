import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveElevatedButton extends StatelessWidget {
  final String text;
  final Function handler;

  const AdaptiveElevatedButton(this.text, this.handler);

  @override
  Widget build(BuildContext context) {
    return /*Platform.isIOS
        ? CupertinoButton(
         
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              handler;
            },
          )
        :*/
      ElevatedButton(
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed:() {
        handler();
      },
    );
  }
}
