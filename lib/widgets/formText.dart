import 'package:flutter/material.dart'; 
  
class FormText203 extends StatelessWidget { 
  FormText203({super.key, required this.text}); 
  String text;

  @override 
  Widget build(BuildContext context) { 
    return Container(
      alignment: Alignment.centerLeft,
      child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Text(text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                decoration: TextDecoration.none,
    ))));
  } 
}
