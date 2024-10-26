import 'package:flutter/material.dart';
import 'package:form_io_builder/utils/utils.dart';

import '../styles/theme_app.dart';
import 'Form_widget.dart';

class FormScreen extends StatelessWidget{
  final title;
  final formdata;
  final mapAnswers;
  final  operationType;
  final ValueChanged?  onSubmit;
  FormScreen({this.formdata,this.title,this.mapAnswers,this.operationType=OperationType.edit,this.onSubmit});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<bool> _onWillPop(context) async {
    bool close = true;
    
      close = await showDialog(
        context: context,
        builder: (context) => Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: Text("هل تريد الرجوع؟", style: ThemeApp.headline1),
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
    return  WillPopScope(
        onWillPop: () => _onWillPop(context),
      
      child: Scaffold(
      appBar:  AppBar(
                  backgroundColor: ThemeApp.onPrimaryColor,
                  centerTitle:true ,
                  leading: BackButton(),
                  // IconButton(
                  //     onPressed: () =>Navigator.pop(context),
                  //     icon: Icon(
                  //       Icons.arrow_back_rounded,
                  //       size: 30,
                  //       color: Colors.black.withOpacity(0.7),
                  //     )),
                    
                    title: Text(title,style: ThemeApp.headline1,),
                ),
        backgroundColor: ThemeApp.onPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal:16.0),
          child: Column(
            children: [
               
              Expanded(child: Form(
                key: formKey,
                child: ListView.custom(
                  childrenDelegate: SliverChildListDelegate(
                    [ 
                      ... FormListWedgit(formdata, mapAnswers,show: operationType==OperationType.show )
                        
                         ,
                       ... [ 
                      //  const SizedBox(height: 8,),
                        ElevatedButton(
                          
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
                          
                          child:Text("حفظ",),
                        ),
                            ]
                          
                    
                    ])))) 
            ],
          ),
        ),
      ),
    );

  }

}