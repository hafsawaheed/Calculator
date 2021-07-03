import 'dart:html';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
 
 var result="";

 Widget btn(textt){
   return ElevatedButton(onPressed: (){
     setState(() {
       result= result + textt;
     });
   },
   style: ElevatedButton.styleFrom(
                primary: Colors.pink[300]),
                child: Text(textt),);
 }

clear(){
  setState(() {
    result="";
  });
}

output(){

  Parser p = Parser();
  Expression exp = p.parse(result);
  ContextModel cm = ContextModel();
  double eval = exp.evaluate(EvaluationType.REAL,cm);

  setState(() {
    result = eval.toString();
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            
            color:Colors.pink[100],
            child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Calculator",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.pink[400],decoration: TextDecoration.underline),),
              Text(result,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height:50,),
                     btn("1"),            
                     btn("2"),            
                     btn("3"),             
                     btn("4"),
                  SizedBox(height:50,), 
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   SizedBox(height:50,),
                     btn("5"),             
                     btn("6"),               
                     btn("7"),                   
                     btn("8"),
                   SizedBox(height:50,), 
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   SizedBox(height:50,),
                     btn("9"),           
                     btn("0"),                
                     btn("+"), 
                     btn("-"),
                   SizedBox(height:50,), 
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [   
                   SizedBox(height:50,),    
                     btn("*"),
                     btn("/"),
                     ElevatedButton(onPressed: clear,style: ElevatedButton.styleFrom(primary: Colors.pink[300]), child: Text("Clear")),
                     ElevatedButton(onPressed: output,style: ElevatedButton.styleFrom(primary: Colors.pink[300]), child: Text("=")),
                   SizedBox(height:50,),    
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}