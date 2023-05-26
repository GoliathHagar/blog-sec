import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Color? backgroundColor;
  final void Function()? onpress;
  final String label;

  const AppButton(
      {super.key, this.backgroundColor, this.onpress, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpress,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
      ),
      child: Text(label),
    );
  }
}
