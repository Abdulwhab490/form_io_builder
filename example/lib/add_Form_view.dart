
import 'package:flutter/material.dart';
import 'package:form_io_builder/form_io_builder.dart';
import 'package:form_io_builder/utils/utils.dart';



class AddFormView extends StatefulWidget{
  Map<String ,dynamic>? mapAnswers;
  String? title;
  ValueChanged? onSubmit;
   Map<String ,dynamic>? fromJson;
   OperationType operationType;
   AddFormView({this.fromJson,this.mapAnswers,this.title,this.onSubmit,this.operationType=OperationType.edit});
  @override
  State<AddFormView> createState() => _AddSubjectDegreeState();
}

class _AddSubjectDegreeState extends State<AddFormView> {
  Widget? formWidget;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    formWidget=formDataAdd();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
     backgroundColor: Colors.transparent,
      body:Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
         //   crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
           // mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(top: 32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey,width: 0.2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BackButton(),
                    Expanded(child: Text('${widget.title??''}',style: TextStyle(fontSize: 20,fontWeight:FontWeight.w600))),
                    CloseButton()
                  ],
                ),
              ),
          
          
              Flexible(
                fit: FlexFit.loose,
                child: 
                Container(
                  //height: 500,
                  margin: EdgeInsets.only(top: 32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey,width: 0.2),
                ),
                child: formDataAdd()
                //formWidget!
                )
              )
            ],
          ),
        ),
      ) ,
    );
  }

  
Widget formDataAdd(){

   return WidgetBuild(formData: widget.fromJson,
  // title: 'Add Subject Degree',
        mapAnswers: widget.mapAnswers,
        onSubmit: widget.onSubmit,
        operationType: widget.operationType,
   );

}
}

