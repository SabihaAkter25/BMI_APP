import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your BMI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink.shade200),
        useMaterial3: true,
      ),
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
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor = Colors.indigo.shade200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your BMI'),
        ),
        body: Container(
            color:bgColor,
        child:Center(
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('BMI', style: TextStyle(
                    fontSize: 34, fontWeight: FontWeight.w700,
                  )),
                  const SizedBox(height: 21),
                  TextField(
                    controller: wtController,
                    decoration: const InputDecoration(
                        label: Text('Enter your weight (in kgs)'),
                        prefixIcon: Icon(Icons.line_weight)
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 21),
                  TextField(
                    controller: ftController,
                    decoration: const InputDecoration(
                        label: Text('Enter your Height (in feet)'),
                        prefixIcon: Icon(Icons.height)
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 21),
                  TextField(
                    controller: inController,
                    decoration: const InputDecoration(
                        label: Text('Enter you Height(in inch)'),
                        prefixIcon: Icon(Icons.height)
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  ElevatedButton(onPressed:(){
              var wt = wtController.text.toString();
              var ft = ftController.text.toString();
              var inch = inController.text.toString();

         if(wt!="" && ft!="" && inch!=""){

           var iWt = int.parse(wt);
           var iFt = int.parse(ft);
           var iInch = int.parse(inch);
           var tInch = (iFt*12) + iInch;
           var tCm = tInch*2.54;
           var tM= tCm/100;
           var bmi = iWt/(tM*tM);
           var msg ="";

           if(bmi>25){
msg= "You're OverWeight";
bgColor= Colors.red.shade300;}
           else if(bmi<18){
msg = " You're underWeight";
bgColor = Colors.grey.shade200;
           }else{
msg = "You're Healthy";
bgColor=Colors.green.shade200;
           }
           setState(() {
             result = '$msg \n Your BMI is : $bmi';
           });
         }else{
setState(() {
  result= 'Please Fill all the Requirements';
});
         }
                  },child:const Text('Calculate')),
const SizedBox(height:11),
Text(result,style:const TextStyle(fontSize: 20)),

                ]
              ),
            ))
    ),
    );
  }

}