import 'package:flutter/material.dart'; 
  
class Dropdown203 extends StatefulWidget { 
  Dropdown203({super.key, required this.options, required this.selected, required this.hintText, required this.callback}); 
  List<String> options;
  String? selected;
  final Function(String?) callback;
  String hintText;

  @override
  State<Dropdown203> createState() => _Checkbox203State();
}

class _Checkbox203State extends State<Dropdown203> {

  @override 
  Widget build(BuildContext context) { 
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          Colors.redAccent,
          Colors.blueAccent,
          //add more colors
        ]),
        borderRadius: BorderRadius.circular(5),
        boxShadow: const <BoxShadow>[
          BoxShadow(
              color: Color.fromRGBO(
                  0, 0, 0, 0.57), //shadow for button
              blurRadius: 5) //blur radius of shadow
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: DropdownButtonFormField<String>(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          value: widget.selected,
          icon: const Icon(Icons.arrow_downward),
          isExpanded: true,
          iconEnabledColor: Colors.white,
          dropdownColor: Colors.red,
          // underline: Container(),
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          hint: Text(widget.hintText, style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)),
          
          onChanged: (String? value) {
            setState(() {
              widget.selected = value!;
              widget.callback(widget.selected);
            });
          },
          decoration: const InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
            errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white))
          ),
          validator: (String? value) {
            return value == null ? "Choose an item" : null;
          },
          items: widget.options.map<DropdownMenuItem<String>>(
              (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )));
  } 
}
