import 'package:flutter/material.dart';
class ButtonItem extends StatelessWidget {
  final onPressed;
  final IconData iconData;
  final String textButton;
  final Color buttonColor;
  const ButtonItem({Key? key, this.onPressed, required this.iconData, required this.textButton, required this.buttonColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Column(
          children: [
            Icon(iconData, color: buttonColor,),
            const SizedBox(height: 5,),
            Text(textButton.toUpperCase(), style: TextStyle(color: buttonColor, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
