
import 'package:flutter/material.dart';
import 'package:form_io_builder/utils/utils.dart';
import 'package:form_io_builder/wedgits/Form_screen.dart';
import 'package:form_io_builder/wedgits/Form_screen_wedgit.dart';
import 'package:form_io_builder/wedgits/wizard.dart';
import 'package:form_io_builder/wedgits/wizard_wedgit.dart';

import 'form_io_builder_platform_interface.dart';

// class FormIoBuilder {
  Future<String?> getPlatformVersion() {
    return FormIoBuilderPlatform.instance.getPlatformVersion();
  } 



class FormIoBuilder {
  final title;
  final formData;
  final onSubmit;
  final onBack;
  Map<String ,dynamic>? map={};

  FormIoBuilder(this.formData,this.title,{this.map,this.onSubmit,this.onBack});

  Future<String?> getPlatformVersion() {
    return FormIoBuilderPlatform.instance.getPlatformVersion();
  } 

 Widget FormWedgit(){
     if(this.formData!=null)
        {

          switch(this.formData['display']){

            case 'wizard':
            return WizardWedgit(title: this.title,pages: this.formData['components'],mapAnswers: this.map,operationType: OperationType.show,);

            case 'form':
            return FormScreenWedgit(title: this.title,formdata: this.formData['components'],mapAnswers: this.map,onSubmit: (value) {
              print("================Data Submit ========= $value =========");
            },);
          }
        }
        return SizedBox(child: Text('Not Found Form Type'),);
  }


 Widget FormPage(){
     if(this.formData!=null)
        {

          switch(this.formData['display']){

            case 'wizard':
            return Wizard(title: this.title,pages: this.formData['components'],mapAnswers: this.map,operationType: OperationType.show,);

            case 'form':
            return FormScreen(title: this.title,formdata: this.formData['components'],mapAnswers: this.map,operationType: OperationType.show,onSubmit: (value) {
              print("================Data Submit ========= $value =========");
            },);
          }
        }
        return SizedBox(child: Text('Not Found Form Type'),);
  }

}