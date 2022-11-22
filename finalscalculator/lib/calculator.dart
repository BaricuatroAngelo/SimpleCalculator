import 'package:flutter/material.dart';

class Calculator extends StatefulWidget{
  const Calculator({super.key});

  @override
  Calc createState()=>Calc();
}

class Calc extends State<Calculator> {

  String text = "";
  String result = "0";
  String op = "";
  late int first;
  late int second;

  btnClick(String btnText){
      if(btnText=="C"){
        text="0";
        result="0";
        first=0;
        second=0;
      }else if(btnText=='+'||btnText=='-'||btnText=='*'||btnText=='/'){
        first=int.parse(text);
        op=btnText;
        result="0";
      }
      else if(btnText=='='){
        second=int.parse(text);
        if(op=='+'){
          result=(first+second).toString();
        }else if(op=='-'){
          result=(first-second).toString();
        }else if(op=='*'){
          result=(first*second).toString();
        }else if (op=='/'){
          result=(first~/second).toString();
        }
      }else{
        result=int.parse(text+btnText).toString();
      }
      setState(() {
        text=result;
      });
  }

  Widget button(String value){
    return Expanded(
      child: OutlinedButton(
          onPressed: ()=>btnClick(value),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.all(25)
          ),
          child: Text(
            value,
            style: const TextStyle(fontSize: 25),
          ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(child: Container(
            padding: const EdgeInsets.all(30),
            alignment: Alignment.bottomRight,
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w600,
                color: Colors.red,
              ),
            ),
          )),
          Row(
            children: [
              button("9"),
              button("8"),
              button("7"),
              button("+"),
            ],
          ),
          Row(
            children: [
              button("6"),
              button("5"),
              button("4"),
              button("-"),
            ],
          ),
          Row(
            children: [
              button("3"),
              button("2"),
              button("1"),
              button("*"),
            ],
          ),
          Row(
            children: [
              button("C"),
              button("0"),
              button("="),
              button("/"),
            ],
          ),
        ],
      )

    );
  }
}
