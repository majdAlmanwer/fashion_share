// import 'package:flutter/material.dart';

// class TextFormAuth extends StatelessWidget {
//   TextFormAuth(
//       {super.key,
//       this.keyboardType,
//       this.hint,
//       this.controller,
//       this.validator,
//       this.focusNode,
//       this.onChange,
//       this.suffixIcon,
//       this.obscureText = false});
//   TextEditingController? controller = TextEditingController();
//   TextInputType? keyboardType;
//   String? hint;
//   FocusNode? focusNode;
//   Widget? suffixIcon;
//   bool obscureText = false;
//   // final _formKey = GlobalKey<FormState>();
//   final String? Function(String?)? validator;
//   Function(String)? onChange;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       validator: validator,
//       controller: controller,
//       focusNode: focusNode,
//       onChanged: onChange,
//       obscureText: obscureText,
//       textInputAction: TextInputAction.next,

//       //  style: TextStyle,
//       keyboardType: keyboardType,

//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Colors.white,
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(25),
//             borderSide: BorderSide(color: Colors.black26)),
//         hintText: hint,
//         hintStyle: TextStyle(
//           color: Colors.black,
//           fontSize: 14,
//         ),
//         suffixIcon: suffixIcon,
//       ),
//     );
//   }
// }
