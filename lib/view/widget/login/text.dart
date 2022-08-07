import 'package:flutter/material.dart';

class FormText extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData iconData;
  final IconData? scdIcon;
  final TextEditingController? mycontroller;
  final String? Function(String?)? valid;
  final bool isNumber;
  final void Function()? onPressed;
  final bool? isObscure;

  const FormText({Key? key,
    required this.hintText,
    required this.labelText,
    required this.iconData,
    this.mycontroller,
    this.scdIcon,
    this.valid, 
    required this.isNumber, this.onPressed,
     this.isObscure,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: isNumber ? TextInputType.number:TextInputType.text,
      obscureText:isObscure==null || isObscure==false ?false:true,
      decoration: InputDecoration(
                    hintText: hintText,
                    label: Text(labelText),
                    prefixIcon: Icon(iconData),
                    suffixIcon: IconButton(onPressed: onPressed, icon: Icon(scdIcon),)
                    ),
                    controller: mycontroller,
                    validator: valid,
                    );
  }
}