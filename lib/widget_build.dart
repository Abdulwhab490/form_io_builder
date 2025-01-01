import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:form_io_builder/styles/theme_app.dart';

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
  ThemeModel?themeModel;
  WidgetBuild({super.key,this.formData,this.title,this.mapAnswers,this.isShowButtonSave,this.operationType,this.onSubmit,this.themeModel});

  @override
  Widget build(BuildContext context) {
    ThemeApp=themeModel??ThemeModel(primaryColor: Theme.of(context).primaryColor,
     onPrimaryColor: Theme.of(context).colorScheme.onPrimary, secondaryColor: Theme.of(context).colorScheme.secondary,
      errorColor:  Theme.of(context).colorScheme.error, borderColor:  Theme.of(context).colorScheme.outline, 
      buttonTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color:Theme.of(context).colorScheme.onPrimary), 
      headline1: Theme.of(context).textTheme.bodyLarge!,
      headline2: Theme.of(context).textTheme.bodyMedium!, 
       hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color:Theme.of(context).hintColor));
   return FormWidget();
 
  }

   Widget FormWidget(){
     if(formData!=null)
        {

          switch(formData!['display']){

            case 'wizard':
            return WizardWedgit(title: title,pages:formData!['components'],mapAnswers: mapAnswers,operationType: operationType,onSubmit:onSubmit);

            case 'form':
            return FormScreenWedgit(title: title,formdata: formData!['components'],mapAnswers: mapAnswers,onSubmit:onSubmit,operationType: operationType);
          }
        }
        return const SizedBox(child: Text('Not Found Form Type'),);
  }


}