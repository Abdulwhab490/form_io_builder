import 'package:flutter/widgets.dart';
import 'utils/utils.dart';
import 'widgets/Form_screen.dart';
import 'widgets/wizard.dart';


class PageFormBuilder extends StatelessWidget{
  
  Map<String ,dynamic>? formData;
  OperationType? operationType;
  Map<String ,dynamic>? mapAnswers;
  String? title;
  bool? isShowButtonSave;
  ValueChanged?  onSubmit;
  PageFormBuilder({super.key, this.formData,this.title,this.mapAnswers,this.isShowButtonSave,this.operationType,this.onSubmit});

  @override
  Widget build(BuildContext context) {
    
   return formPage();
 
  }

   Widget formPage(){
     if(formData!=null)
        {

          switch(formData?['display']){

            case 'wizard':
            return Wizard(title: title,pages: formData!['components'],mapAnswers: mapAnswers,operationType: operationType,);

            case 'form':
            return FormScreen(title: title,formdata: formData!['components'],mapAnswers: mapAnswers,onSubmit:onSubmit,operationType: operationType);
          }
        }
        return const SizedBox(child: Text('Not Found Form Type'),);
  }


}