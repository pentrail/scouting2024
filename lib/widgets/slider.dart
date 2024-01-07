import 'package:flutter/material.dart'; 
  
class Slider203 extends StatefulWidget { 
  Slider203({super.key, required this.max, required this.divisions, required this.value, required this.callback}); 

  double max;
  int divisions;
  double value;
  final Function(double) callback;

  @override
  State<Slider203> createState() => _Checkbox203State();
}

class _Checkbox203State extends State<Slider203> {
  @override 
  Widget build(BuildContext context) { 
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 15, vertical: 0),
      child: Slider(
        value: widget.value,
        max: widget.max,
        divisions: widget.divisions,
        label: widget.value.round().toString(),
        onChanged: (double value) {
          setState(() {
            widget.value = value;
            widget.callback(widget.value);
          });
        },
      )
    );
  } 
}
