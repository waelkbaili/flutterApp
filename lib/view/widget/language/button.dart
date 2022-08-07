import 'package:firstapp/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Button extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const Button({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: double.infinity, child: ElevatedButton(
            onPressed: onPressed,
             child: Text(text,style:Theme.of(context).textTheme.headline1))
             );
  }
}