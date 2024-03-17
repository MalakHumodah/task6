import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback onPressed;
  final AlignmentGeometry? alignment;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.topRight,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
