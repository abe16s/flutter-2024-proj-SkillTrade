import 'package:flutter/material.dart';


class MyTextField extends StatefulWidget {
  final String labelText;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final bool obscureText;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final bool toggleText;

  const MyTextField({
    Key? key,
    required this.labelText,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.controller,
    required this.toggleText,
    this.obscureText = false,
    this.onChanged,
  }) : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
 
  bool _obscure = false;
  @override
  void initState() {
    _obscure = widget.obscureText;
  }
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscure,
      onChanged: widget.onChanged,
      style: TextStyle(
        color: Colors.black87,
        fontSize: 16.0,
      ),
      decoration: InputDecoration(
        labelText: widget.labelText,
        prefixIcon: Icon(
          widget.prefixIcon,
          color: Colors.grey[600],
          size: 25,
        ),
        suffixIcon: IconButton(
          icon: Icon(widget.suffixIcon,
          color: Colors.grey[600],
          size: 25,),
          onPressed: (){ 
            if (widget.toggleText){
              setState(() { 
                _obscure = !_obscure;

              });
            }
          },

        ),
        filled: true,
        fillColor: Colors.grey[200],

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.red),
        ),
        labelStyle: TextStyle(color: Colors.grey[600]),
      ),
    );
  }
}



