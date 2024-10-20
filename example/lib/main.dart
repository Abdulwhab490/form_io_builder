import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_io_builder/form_io_builder.dart';
import 'package:form_io_builder/utils/utils.dart';
import 'show_wedgit.dart';

import 'contacst.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
///primaryColor: Colors.amber,
       
        colorScheme: ColorScheme(brightness: Brightness.light, primary: Colors.amber,
         onPrimary:  Colors.white,//Colors.amber.shade400,
          secondary:  Color.fromARGB(255, 88, 8, 8),
           onSecondary: const Color.fromRGBO(88, 8, 8, 1),//Colors.yellow,
            error: Colors.red, 
            onError: Colors.redAccent, 
            surface: Colors.white,
             onSurface: Colors.grey,
             surfaceContainer: Colors.grey
            
            
             ),

            textTheme: TextTheme(
              bodyMedium: TextStyle(color: Colors.green,fontSize: 20),
              bodySmall: TextStyle(color: Colors.blue,fontSize: 14),
               labelMedium: TextStyle(color: Colors.purpleAccent,fontSize: 14),
               labelSmall: TextStyle(color: Colors.red,fontSize: 14),
               labelLarge: TextStyle(color: Colors.brown,fontSize: 14),
            ),
          
         elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.black),textStyle:WidgetStatePropertyAll(TextStyle(color: Colors.red)))),     
        //textTheme: TextTheme().copyWith()
      ),
      home:Home());
  }
}

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app '),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             //Expanded(child: FormIoBuilder(wizard,'wizard',map: {}).FormWedgit()),
           //   Text('Running on: $_platformVersion\n'),
          
          Spacer(),   
          ElevatedButton(child: Text('Form Wedgit'), onPressed: (){
            
                Navigator.push(context, PageRouteBuilder(pageBuilder:(context,_,__)=>ShowWedgit()));
            }
            ),
          Spacer(),
              ElevatedButton(child: Text('Form Page'), onPressed: (){
              
                  Navigator.push(context, PageRouteBuilder(pageBuilder:(context,_,__)=> PageFormBuilder(formData:form1,title:'form',mapAnswers: {}, operationType:OperationType.edit ,isShowButtonSave: true,onSubmit: (value){
                    print('===============Data SubMit ================= $value ==============');
                  },) ));
              }
              ),
           Spacer(),
          
              ElevatedButton(child: Text('wizard Pages'), onPressed: (){
                    
                  Navigator.of(context).push(MaterialPageRoute(builder:(context)=> PageFormBuilder(formData:wizard3,title:'wizard',mapAnswers: {}, operationType:OperationType.edit ,isShowButtonSave: true,onSubmit: (value){
                    print('===============Data SubMit ================= $value ==============');
                  },)  ));
              }
              ),
          
              Spacer(), 
            ],
          ),
        ),
      );
    
  }


}


class testScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Hi man'),),
      body: Container(),
    );
  }

} 
