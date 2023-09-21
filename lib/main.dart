import 'dart:math';

import 'package:flutter/material.dart';
import 'package:bmi/main.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
var  wtcontroller=TextEditingController();
var ftcontroller=TextEditingController();
var incontroller=TextEditingController();
var result="";
var msg="";
var bgcolor=Colors.blue[100];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: const Text("YOUR_BGI"),
      ),
      body:Container(
        color: bgcolor,
        child: Center(
          child:SizedBox(width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   // Container(color: Colors.red,
                   //     alignment: Alignment.center,
                   //     width:70,height: 50,
                   //     child: const Text("BMI",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)
                   //   ),
                  const Text("BMI",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                  TextField(
                    controller: wtcontroller,
                    decoration: const InputDecoration(
                      prefixIcon:Icon(Icons.line_weight,color: Colors.blueAccent,),
                      hintText: "Enter The Weight In Kg",
                    ),
                    keyboardType: TextInputType.number,
                  ),
                 const SizedBox(height: 5),
                 TextField(
                   controller: ftcontroller,
                   decoration: const InputDecoration(
                     prefixIcon: Icon(Icons.height,color: Colors.blueAccent,),
                     hintText: "Enter The Height In Feet"
                   ),
                   keyboardType: TextInputType.number,
                 ),
                  const SizedBox(height: 5,),
                  TextField(
                    controller: incontroller,
                    decoration:const InputDecoration(
                      prefixIcon: Icon(Icons.height),
                      hintText: "Enter The Height In Inch"
                    ),keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(onPressed: (){
                    var wt=wtcontroller.text.toString();
                    var ft=ftcontroller.text.toString();
                    var inch=incontroller.text.toString();
                    if(ft!="" && wt!="" && inch!=""){
                      var iWt=int.parse(wt);
                      var iFt=int.parse(ft);
                      var iInch=int.parse(inch);

                      var tInch=(iFt*12)+iInch;
                      var tcm=tInch*2.54;
                      var tM=tcm/100;
                      var bmi=iWt/(tM*tM);
                      if(bmi>25){
                        msg="You're OverWeighted!";
                        bgcolor=Colors.orange;
                      }else if(
                      bmi<18
                       ){
                          msg=("You're UnderWeighted!");
                         bgcolor=Colors.red[100];
                      }
                      else{
                        msg="You're Healthy!!";
                        bgcolor=Colors.green[100];
                      }
                      setState(() {
                        result="$msg \n Your BMI is : ${bmi.toStringAsFixed(4)}";
                      });
                    }else {
                      setState(() {
                        result="Please Filled The Required Blank!";
                      });
                    }
                  }, child: const Text("Calculate",style: TextStyle(color: Colors.black),)),
                  const SizedBox(height: 15),
                  Text(result,style: const TextStyle(fontSize: 20,color: Colors.blueAccent,fontWeight: FontWeight.bold),)
                ],
              ),
          ),
        ),
      ),
      );
  }
}
