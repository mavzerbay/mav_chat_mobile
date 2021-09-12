import 'package:flutter/material.dart';

import '../../core/constants/app/app_constants.dart';
import '../../core/extensions/context_extension.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.labelText,
    this.prefixIconData,
    this.suffixIconData,
    this.obscureText = false,
    this.onChanged,
    this.prefixIconPressed,
    this.suffixIconPressed,
    required this.textEditingController,
    this.errorText,
    this.validator,
    this.keyboardType = TextInputType.name,
    this.textInputAction,
    this.currentNode,
    this.onFieldSubmitted,
  }) : super(key: key);

  final String labelText;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final bool obscureText;
  final Function(String)? onChanged;
  final Function()? prefixIconPressed;
  final Function()? suffixIconPressed;
  final TextEditingController textEditingController;
  final String? errorText;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? currentNode;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: validator,
      onChanged: onChanged,
      textInputAction: textInputAction,
      focusNode: currentNode,
      onFieldSubmitted: onFieldSubmitted,
      style: TextStyle(
        color: ApplicationConstants.kPrimaryColor,
        fontSize: context.size18,
      ),
      cursorColor: ApplicationConstants.kPrimaryColor,
      cursorHeight: context.size24,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: IconButton(
          icon: Icon(
            prefixIconData,
            size: context.size20,
            color: ApplicationConstants.kPrimaryColor,
          ),
          onPressed: prefixIconPressed,
        ),
        errorMaxLines: 2,
        errorStyle: TextStyle(
          color: ApplicationConstants.kErrorColor,
        ),
        errorText: errorText,
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: ApplicationConstants.kPrimaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: ApplicationConstants.kErrorColor),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            suffixIconData,
            size: context.size20,
            color: ApplicationConstants.kPrimaryColor,
          ),
          onPressed: suffixIconPressed,
        ),
        labelStyle: TextStyle(color: ApplicationConstants.kPrimaryColor),
        focusColor: ApplicationConstants.kPrimaryColor,
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
    );
  }
}
