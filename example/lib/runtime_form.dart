import 'package:flutter/material.dart';
import 'package:form_io_builder/form_io_builder.dart';
import 'package:form_io_builder/utils/utils.dart';
import 'package:form_io_builder_example/add_Form_view.dart';
import 'package:form_io_builder_example/contacst.dart';

import 'storeData.dart';

class RunTimeForm extends StatefulWidget{
  @override
  State<RunTimeForm> createState() => _RunTimeFormState();


}

class _RunTimeFormState extends State<RunTimeForm> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
       appBar: AppBar(
        title: Text('Run Time Form'),

       ),
       body: 
       StoreData.infoTableData.isEmpty?const Center(child: Text('Empty Item'),)
       :Column(
        children: [

            Text('Form User Info'),

            Flexible(child: ListView(
              children: [
                 for(var info in StoreData.infoTableData)
                 Card( 
                  child: ListTile(title: Text('${info['whatIsYourName']}'), 
                  trailing: InkWell(child: Icon(Icons.edit),onTap: ()=>  displayDialog(context ,AddFormView(fromJson: wizard3,mapAnswers: info,title: 'Edit info', onSubmit: (value){
                print('===============Data SubMit ================= $value ==============');
                if(value !=null && value is Map<String,dynamic>)
                 {
                      
                          Navigator.pop(context);

                          setState(() {
                            
                          });

                 }

         },))

      ,),
                  leading: InkWell(child: Icon(Icons.delete),),
                  ),
                 )
              ],
            )
        
            
            )
        ],
       ),
    
      floatingActionButton: FloatingActionButton(onPressed: (){

        displayDialog(context ,AddFormView(fromJson: wizard3,mapAnswers: {},title: 'New', onSubmit: (value){
                print('===============Data SubMit ================= $value ==============');
                if(value !=null && value is Map<String,dynamic>)
                 {
                           StoreData.infoTableData.add(value);
                          Navigator.pop(context);

                          setState(() {
                            
                          });

                 }

         },));

      }),
    );
  }

 displayDialog(BuildContext context,Form, {barrierDismissible=false}) async {
      return showGeneralDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        barrierLabel: 'kgg',

        transitionDuration: Duration(milliseconds: 200),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: animation,
              child: child,
            ),
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return Form;
        },
      );
}


}