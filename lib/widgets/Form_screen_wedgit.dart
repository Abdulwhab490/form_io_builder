import 'package:flutter/material.dart';
import 'package:form_io_builder/utils/utils.dart';

import '../styles/theme_app.dart';
import 'Form_widget.dart';

class FormScreenWedgit extends StatelessWidget{
  final title;
  final formdata;
  final mapAnswers;
  final  operationType;
  final ValueChanged?  onSubmit;
  FormScreenWedgit({this.formdata,this.title,this.mapAnswers,this.operationType=OperationType.edit,this.onSubmit});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<bool> _onWillPop(context) async {
    bool close = true;
    
      close = await showDialog(
        context: context,
        builder: (context) => Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: Text("هل تريد الرجوع؟", style: ThemeApp!.headline1),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('لا'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('نعم'),
              ),
            ],
          ),
        ),
      );
    
    return close;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Padding(
     padding: const EdgeInsets.symmetric(horizontal:16.0),
     child: Column(
       mainAxisSize: MainAxisSize.min,
       children: [
          
         Flexible(
          fit: FlexFit.loose,
          child: Form(
           key: formKey,
           onWillPop: () => _onWillPop(context),
           child: ListView.custom(
             childrenDelegate: SliverChildListDelegate(
               [ 
                 ... FormListWedgit(formdata, mapAnswers,show: operationType==OperationType.show )
                   
                    ,
                  ... [ 
                 //  const SizedBox(height: 8,),
                   ElevatedButton(
                     style:ButtonStyle(backgroundColor: WidgetStatePropertyAll(ThemeApp!.primaryColor)),
                     onPressed: () {
                           if (operationType ==
                               OperationType.show ||
                           formKey.currentState!.validate()) {
                             formKey.currentState!.save();
                           printO('================ Pref ====== map====== ${mapAnswers}');
                           if(onSubmit!=null)
                             onSubmit!(mapAnswers);
                           }
                           
                     },
                     
                     child:Text("حفظ",style: ThemeApp!.buttonTextStyle,),
                   ),
                       ]
                     
               
               ])))) 
       ],
     ),
            );

  }

}