import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      this.keyboardType,
      this.hint,
      this.controller,
      this.validator,
      this.focusNode,
      this.onChange,
      this.suffixIcon,
      this.obscureText = false,
      this.onTap});
  TextEditingController? controller = TextEditingController();
  TextInputType? keyboardType;
  String? hint;
  FocusNode? focusNode;
  Widget? suffixIcon;
  bool obscureText = false;
  // final _formKey = GlobalKey<FormState>();
  final String? Function(String?)? validator;
  Function(String)? onChange;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      focusNode: focusNode,
      onChanged: onChange,
      obscureText: obscureText,
      textInputAction: TextInputAction.next,
      onTap: onTap,

      //  style: TextStyle,
      keyboardType: keyboardType,

      decoration: InputDecoration(
        // filled: true,
        // fillColor: Colors.grey.withOpacity(0.9),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.white)),
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontSize: 14,
          fontFamily: 'ArLang',
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
