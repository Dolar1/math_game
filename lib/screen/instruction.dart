import 'package:flutter/material.dart';
import 'package:easy_dialog/easy_dialog.dart';

Widget instrtuctionWidget(BuildContext context) {
  return EasyDialog(
    title: Text("Basic Easy Dialog Title"),
    description: Text("This is a basic dialog"),
  ).show(context);
}
