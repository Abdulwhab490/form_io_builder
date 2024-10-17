import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:form_io_builder/form_io_builder.dart';
import 'package:form_io_builder_example/show_wedgit.dart';

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
  String _platformVersion = 'Unknown';
  final _formIoBuilderPlugin = FormIoBuilder('','');

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await _formIoBuilderPlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
///primaryColor: Colors.amber,
       
        colorScheme: ColorScheme(brightness: Brightness.light, primary: Colors.amber,
         onPrimary: Colors.amber.shade400,
          secondary: const Color.fromARGB(255, 88, 8, 8),
           onSecondary: const Color.fromRGBO(88, 8, 8, 1),//Colors.yellow,
            error: Colors.red, 
            onError: Colors.redAccent, 
            surface: Colors.white,
             onSurface: Colors.grey,
            
            
             ),
          
         elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.amber),textStyle:WidgetStatePropertyAll(TextStyle(color: Colors.red)))),     
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
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child:  
          
          
          Column(
            children: [
             //Expanded(child: FormIoBuilder(wizard,'wizard',map: {}).FormWedgit()),
           //   Text('Running on: $_platformVersion\n'),


            ElevatedButton(child: Text('Form Wedgit'), onPressed: (){
              
                  Navigator.push(context, PageRouteBuilder(pageBuilder:(context,_,__)=>ShowWedgit()));
              }
              ),

              ElevatedButton(child: Text('Form'), onPressed: (){
              
                  Navigator.push(context, PageRouteBuilder(pageBuilder:(context,_,__)=> FormIoBuilder(form1,'form',map: {}).FormWedgit() ));
              }
              ),


              ElevatedButton(child: Text('wizard2'), onPressed: (){
      
                  Navigator.of(context).push(MaterialPageRoute(builder:(context)=> FormIoBuilder(wizard3,'wizard',map: {}).FormWedgit() ));
              }
              )
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
