import 'package:covid19_app/Widgets/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class textField extends StatelessWidget {
  const textField({
    Key key,
    @required this.icon,
    this.hint,
    this.inputAction,
    this.inputType,
    this.textEdit,
    this.istrue,
  });

  final bool istrue;
  final IconData icon;
  final String hint;
  final TextInputAction inputAction;
  final TextInputType inputType;
  final TextEditingController textEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        color: Colors.grey[600].withOpacity(0.5),
        borderRadius: BorderRadius.circular(16.2),
      ),
      child: TextField(
        controller: textEdit,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 17),
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              icon,
              size: 25,
            ),
          ),
          hintText: hint,
          hintStyle: kLabelStyle,
        ),
        obscureText: istrue,
        style: kTextForm,
        keyboardType: inputType,
        textInputAction: inputAction,
      ),
    );
  }
}

class textField2 extends StatelessWidget {
  const textField2({
    Key key,
    @required this.icon,
    this.hint,
    this.inputAction,
    this.inputType,
    this.textEdit,
    this.istrue,
  });

  final bool istrue;
  final IconData icon;
  final String hint;
  final TextInputAction inputAction;
  final TextInputType inputType;
  final TextEditingController textEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16.2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
           scrollPhysics: ClampingScrollPhysics(),
          minLines: null,
          maxLines: null,
          controller: textEdit,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 17),
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                icon,
                size: 20,
              ),
            ),
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[700]),
          ),
          obscureText: istrue,
          style: TextStyle(
              fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
          keyboardType: inputType,
          textInputAction: inputAction,
        ),
      ),
    );
  }
}
