import 'package:flutter/material.dart';

class EditableField extends StatefulWidget {
  final String label;
  final String data;
  const EditableField({super.key, required this.label, required this.data});

  @override
  State<EditableField> createState() => _EditableFieldState(label: this.label, data: this.data, );
}

class _EditableFieldState extends State<EditableField> {
  final String label;
  final String data;
  _EditableFieldState({required this.label, required this.data});

  // final TextEditingController _controller = ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            this.label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          TextField(
              enabled: false, // Toggle the editable state
              controller: TextEditingController(text: this.data),
              decoration: InputDecoration(
                hintText: 'Editable TextField',
              ),
            ),
        ],
      ),
    );
  }
}