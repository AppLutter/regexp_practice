import 'package:flutter/material.dart';

class UserInfoTextFormField extends StatefulWidget {
  const UserInfoTextFormField({
    Key? key,
    required this.labelText,
    required this.currentFocusNode,
    required this.autoValidateMode,
    required this.regExp,
    required this.emptyString,
    required this.notMatchString,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isLast = false,
  }) : super(key: key);
  final String labelText;
  final FocusNode currentFocusNode;
  final bool isLast;
  final AutovalidateMode autoValidateMode;
  final RegExp regExp;
  final TextInputType keyboardType;
  final String emptyString;
  final String notMatchString;
  final TextEditingController controller;


  @override
  State<UserInfoTextFormField> createState() => _UserInfoTextFormFieldState();
}

class _UserInfoTextFormFieldState extends State<UserInfoTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      autovalidateMode: widget.autoValidateMode,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        label: Text(widget.labelText),
      ),
      focusNode: widget.currentFocusNode,
      validator: (text) {
        if (text!.trim().isEmpty) {
          return widget.emptyString;
        }
        if (!(widget.regExp.hasMatch(text))) {
          return widget.notMatchString;
        }

        return null;
      },
      onEditingComplete: () {
        if (widget.isLast == true) {
          FocusScope.of(context).unfocus();
        } else {
          FocusScope.of(context).nextFocus();
        }
      },
    );
  }
}

