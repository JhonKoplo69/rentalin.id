import 'package:flutter/material.dart';
import 'package:rentalin_id/app/data/constant/color.dart';

class InputTextNoIcon extends StatelessWidget {
  final String labelText; // Label text
  final String hintText; // Hint text
  final Function(String)? onChanged;
  final TextEditingController? controller; // Add controller parameter

  const InputTextNoIcon({
    super.key,
    required this.labelText,
    required this.hintText,
    this.onChanged,
    this.controller, // Initialize the controller parameter
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            color: tdBlue,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextField(
          controller: controller, // Assign the controller to TextField
          onChanged: onChanged,
          cursorColor: tdSecBlue,
          style: const TextStyle(color: tdBlue, fontSize: 16),
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: tdSecBlue),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: tdSecBlue),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: tdSecBlue),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            fillColor: tdWhite,
            hoverColor: tdSecBlue,
            filled: true,
            alignLabelWithHint: false,
            hintText: hintText,
            hintStyle: const TextStyle(color: tdSecBlue),
          ),
        ),
      ],
    );
  }
}
