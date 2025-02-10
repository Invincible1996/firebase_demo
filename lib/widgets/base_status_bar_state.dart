import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class BaseStatusBarState<T extends StatefulWidget> extends State<T> {
  SystemUiOverlayStyle get statusBarStyle;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: statusBarStyle,
      child: buildContent(context),
    );
  }

  Widget buildContent(BuildContext context);
}
