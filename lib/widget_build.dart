import 'package:flutter/widgets.dart';

import 'utils/utils.dart';
import 'widgets/Form_screen_wedgit.dart';
import 'widgets/wizard_wedgit.dart';

class WidgetBuild extends StatelessWidget{
  
  Map<String ,dynamic>? formData;
  OperationType? operationType;
  Map<String ,dynamic>? mapAnswers;
  String? title;
  bool? isShowButtonSave;
  ValueChanged?  onSubmit;
  WidgetBuild({super.key,this.formData,this.title,this.mapAnswers,this.isShowButtonSave,this.operationType,this.onSubmit});

  @override
  Widget build(BuildContext context) {

   return FormWidget();
 
  }

   Widget FormWidget(){
     if(formData!=null)
        {

          switch(formData!['display']){

            case 'wizard':
            return WizardWedgit(title: title,pages:formData!['components'],mapAnswers: mapAnswers,operationType: operationType,);

            case 'form':
            return FormScreenWedgit(title: title,formdata: formData!['components'],mapAnswers: mapAnswers,onSubmit:onSubmit,operationType: operationType);
          }
        }
        return const SizedBox(child: Text('Not Found Form Type'),);
  }


}