import 'package:flutter/material.dart'; 
  
class Checkbox203 extends StatefulWidget { 
  Checkbox203({super.key, required this.text, required this.field, required this.callback}); 
  String text;
  bool field;
  final Function(bool) callback;

  @override
  State<Checkbox203> createState() => _Checkbox203State();
}

class _Checkbox203State extends State<Checkbox203> {
  @override 
  Widget build(BuildContext context) { 
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(widget.text, style: const TextStyle(color: Colors.white, fontSize: 16),),
      checkColor: Colors.white,
      side: const BorderSide(color: Colors.white, width: 2),
      value: widget.field,
      onChanged: (bool? value) {
        setState(() {
          widget.field = value!;
          widget.callback(widget.field);
        });
      },
    );
  } 
}
