import 'package:flutter/material.dart'; 
  
class FormTitle203 extends StatelessWidget { 
  FormTitle203({super.key, required this.text}); 
  String text;

  @override 
  Widget build(BuildContext context) { 
    return Padding(
      padding: const EdgeInsets.only(left: 15, bottom: 10, right: 20, top: 20),
      child: Text(text,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
        )
      )
    );
  } 
}
