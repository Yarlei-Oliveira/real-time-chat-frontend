import 'package:flutter/material.dart';

class FormFieldModel extends StatefulWidget {
  String hint;
  void Function(String?) onSaved;
  IconData icon;
  bool? obscure;
  String? Function(String?)? validator;
  FormFieldModel({
    this.validator,
    this.obscure,
    required this.hint,
    required this.onSaved,
    required this.icon,
    super.key,
  });

  @override
  State<FormFieldModel> createState() => _FormFieldModelState();
}

class _FormFieldModelState extends State<FormFieldModel> {
  bool obscure = false;

  @override
  void initState() {
    super.initState();
    if (widget.obscure != null) {
      obscure = true;
    }
  }

  void changeObscureText() {
    setState(() {
      obscure = !obscure;
    });
  }

  final borderStyle = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.grey,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(15),
  );

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width * .85,
      child: TextFormField(
        validator: widget.validator,
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: widget.hint,
          enabledBorder: borderStyle,
          border: borderStyle,
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.obscure == null
              ? null
              : IconButton(
                  onPressed: () => changeObscureText(),
                  icon: obscure
                      ? const Icon(Icons.remove_red_eye_outlined)
                      : const Icon(Icons.remove_red_eye)),
        ),
        onSaved: (widget.onSaved),
      ),
    );
  }
}
