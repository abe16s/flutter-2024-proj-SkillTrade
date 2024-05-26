import 'package:flutter/material.dart';

class EditableField extends StatefulWidget {
  final String label;
  final String data;
  final TextEditingController? controller;

  EditableField({Key? key, required this.label, required this.data, required this.controller});

  @override
  State<EditableField> createState() => _EditableFieldState();
}

class _EditableFieldState extends State<EditableField> {
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 220,
                child: TextField(
                  controller: widget.controller,
                  enabled: isEditing, 
                  decoration: InputDecoration(
                    hintText: 'Editable TextField',
                  ),
                ),
              ),
              IconButton(
                icon: Icon(isEditing ? Icons.check : Icons.edit),
                onPressed: () {
                  setState(() {
                    isEditing = !isEditing;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
