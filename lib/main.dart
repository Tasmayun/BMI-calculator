import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController=TextEditingController();
  var ftController=TextEditingController();
  var inController=TextEditingController();
  var result="";
  var bgc=Colors.pinkAccent.shade400;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Container(
        color:bgc,
        child: Center(
          child: Container(
            width:300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI',style:TextStyle(
                  fontSize:34,fontWeight: FontWeight.w700
                )),
                SizedBox(height:21,),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label:Text('Enter your weight in kgs'),
                        prefixIcon:Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height:11,),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                      label:Text('Enter your height in feet'),
                      prefixIcon:Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
               SizedBox(height:11,),
                TextField(
                  controller: inController,
                  decoration:InputDecoration(
                    label:Text("enter your height in inch"),
                     prefixIcon:Icon(Icons.height)
                  ),
                  keyboardType:TextInputType.number,
                ),
                SizedBox(height:11),
                ElevatedButton(onPressed:(){
                  var wt=wtController.text.toString();
                  var ft=ftController.text.toString();
                  var inch=inController.text.toString();
                  if(wt!="" && ft!="" && inch!="")
                    {
                       var iwt=int.parse(wt);
                       var ift=int.parse(ft);
                       var iInch=int.parse(inch);
                       var tInch=(ift+12)+iInch;
                       var tCm=tInch*2.54;
                       var tM=tCm/100;
                       var bmi=iwt/(tM*tM);
                       var msg="";
                       if(bmi>25){
                          msg="you are overweight";
                          bgc=Colors.orange.shade200;
                       }else if(bmi<18){
                           msg="you are underweight";
                           bgc=Colors.red.shade200;
                       }else{
                          msg="you are healthy!";
                          bgc=Colors.green.shade200;
                       }
                       setState((){
                         result="$msg \n your BMI is :${bmi.toStringAsFixed(2)}";
                       });
                    }
                  else{
                    setState((){
                       result="please fill all the required blanks";
                    });
                  }
                },child:Text('calculate')),
                SizedBox(height:11,),
                Text(result,style:TextStyle(fontSize:19),)
              ],
            ),
          ),
        ),
      )
    );
  }
}
