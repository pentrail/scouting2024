import 'package:flutter/material.dart'; 
  
class Increment203 extends StatefulWidget { 
  Increment203({super.key, required this.counter, required this.callback}); 
  int counter;
  final Function(int) callback;

  @override
  State<Increment203> createState() => _IncrementState();
}

class _IncrementState extends State<Increment203> {
  void _incrementCounterPos() {
    setState(() {
      widget.counter++;
      widget.callback(widget.counter);
    });
  }

  void _incrementCounterNeg() {
    setState(() {
      if (widget.counter > 0) {
        widget.counter--;
        widget.callback(widget.counter);
      }
    });
  }

  @override 
  Widget build(BuildContext context) { 
    return Row(
      children: [
        Container(
            //padding: EdgeInsets.fromLTRB(100, 0, 0, 0),
            height: 50,
            width: 70,
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.redAccent,
                Colors.pinkAccent,
                //add morqe colors
              ]),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: SizedBox.expand(
              child: ElevatedButton(
                  onPressed: _incrementCounterNeg,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Colors.transparent),
                    shadowColor: MaterialStateProperty.all(
                        Colors.transparent),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ))),
                  ),
                  child: const Text('-',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16))),
            )),
        const Spacer(),
        Row(
          children: <Widget>[
            Text('${widget.counter}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  decoration: TextDecoration.none,
                ))
          ],
        ),
        const Spacer(),
        Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            height: 50,
            width: 70,
            alignment: Alignment.centerRight,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.lightBlueAccent,
                Colors.blueAccent,
                //add more colors
              ]),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: SizedBox.expand(
              child: ElevatedButton(
                  onPressed: _incrementCounterPos,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Colors.transparent),
                    shadowColor: MaterialStateProperty.all(
                        Colors.transparent),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ))),
                  ),
                  child: const Text('+',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16))),
            )),
      ],
    );
  } 
}
