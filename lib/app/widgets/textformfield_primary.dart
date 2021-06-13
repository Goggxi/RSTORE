import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextfieldPrimary extends StatelessWidget {
  final String? perfix;
  final String? label;
  final String? hint;
  final FormFieldSetter<String>? onSave;
  final ValueChanged<String>? onChanged;
  final IconButton? surfixicon;
  final bool? obscureText;
  final TextInputType? inputType;
  final TextInputAction? inputAction;

  TextfieldPrimary({
    this.perfix = '',
    this.label = '',
    this.hint,
    this.onSave,
    this.onChanged,
    this.surfixicon,
    this.obscureText = false,
    required this.inputType,
    required this.inputAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      style: GoogleFonts.fjallaOne(fontSize: 18, letterSpacing: 0),
      decoration: InputDecoration(
        suffixIcon: surfixicon,
        prefix: Text(perfix!),
        prefixStyle: GoogleFonts.fjallaOne(fontSize: 18, letterSpacing: 0),
        errorStyle: GoogleFonts.fjallaOne(color: Colors.red, fontSize: 10),
        labelStyle: GoogleFonts.fjallaOne(fontSize: 16),
        labelText: label,
        hintText: hint,
        hintStyle: GoogleFonts.fjallaOne(color: Colors.grey),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      ),
      keyboardType: inputType,
      textInputAction: inputAction,
      obscureText: obscureText!,
      onSaved: onSave,
      onChanged: onChanged,
      validator: (value) {
        if (inputType == TextInputType.emailAddress) {
          bool emailValid = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value!);
          if (!emailValid) {
            return "Email not valid.";
          }
          return null;
        } else if (inputType == TextInputType.visiblePassword) {
          if (value!.length <= 7) {
            return "password must 8 character.";
          }
        } else {
          if (value!.isEmpty) {
            return "$label required.";
          }
        }
        return null;
      },
    );
  }
}
