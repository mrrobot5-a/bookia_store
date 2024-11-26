import 'package:flutter/material.dart';

pushTo(BuildContext context, Widget newScreen) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return newScreen;
  }));
}

pushWithReplacment(BuildContext context, Widget newScreen) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
    return newScreen;
  }));
}
