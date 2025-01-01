import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../styles/theme_app.dart';
import '../utils/utils.dart';


class textFieldWithOnChange extends StatelessWidget{

   String? lable;
   String? IKey;
   ValueChanged? onChanged;
   var validmessage;
   var enable;
  var formFieldState;
   var InputType; 
  var linemax; //keynote=GlobalKey<FormFieldState>();
  var validator;
  Widget? prefixIcon;
  Widget? suffixIcon;
  
   textFieldWithOnChange({this.lable,this.IKey,this.validmessage,this.enable=true,this.formFieldState,this.linemax,this.InputType= TextInputType.text,this.validator,this.onChanged,this.prefixIcon,this.suffixIcon});
   
    
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [


                         Padding(
                           padding: const EdgeInsets.only(left:8.0,right: 8.0),
                           child: TextFormField(
                            maxLines:linemax!=null?linemax+1:1 ,
                            minLines:linemax??1 ,
                            key: formFieldState,
                            enabled: enable,
                             keyboardType:InputType,
                            // enabled: _con.loading.,
                             // controller: _con!.userName,
                             style: ThemeApp?.headline2,
                            
                             textAlign: TextAlign.right,
                             onChanged: onChanged??null,
                             validator:validator==null? (input) => (input==null || input.isEmpty)? validmessage: null:validator,
                             decoration: InputDecoration(
                               hintText: lable,
                               hintStyle: ThemeApp!.hintStyle,
                               suffixIcon:suffixIcon ,
                               prefixIcon:prefixIcon ,
                               border: OutlineInputBorder(borderSide: BorderSide(color: ThemeApp!.borderColor,width: 1),borderRadius: BorderRadius.all(Radius.circular(12))),
                               focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5),width: 1),borderRadius: BorderRadius.all(Radius.circular(12))),
                               // enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                             ),
                           ),
                         ),
                       
                        SizedBox(height: 20),

      ],
    );
  }



}



class textFieldWithLable extends StatelessWidget{

   String? lable;
   String? IKey;
   var map;
   var validmessage;
   var enable;
  var formFieldState;
   var InputType; 
  var linemax; //keynote=GlobalKey<FormFieldState>();
  var validator;
   textFieldWithLable({this.lable,this.map,this.IKey,this.validmessage,this.enable=true,this.formFieldState,this.linemax,this.InputType= TextInputType.text,this.validator});
   
    
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [


                Text(lable!, style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 16,
                          color: const Color(0xff000000),
                        ),
                          textAlign: TextAlign.right,),
                        SizedBox(height: 12,),

                         Padding(
                           padding: const EdgeInsets.only(left:8.0,right: 8.0),
                           child: TextFormField(
                            maxLines:linemax!=null?linemax+1:1 ,
                            minLines:linemax??1 ,
                            key: formFieldState,
                            enabled: enable,
                             keyboardType:InputType,
                            // enabled: _con.loading.,
                             // controller: _con!.userName,
                             style: ThemeApp?.headline2,
                            initialValue: map[IKey] ,
                             textAlign: TextAlign.right,
                             onSaved: (input) {
                             if (input != null)
                             map[IKey]= input;
                             },
                             validator:validator==null? (input) => (input==null || input.isEmpty)? validmessage: null:validator,
                             decoration: InputDecoration(
                               hintText: lable,
                               hintStyle: ThemeApp!.hintStyle,
                               border: OutlineInputBorder(borderSide: BorderSide(color: ThemeApp!.borderColor,width: 1),borderRadius: BorderRadius.all(Radius.circular(12))),
                               focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5),width: 1),borderRadius: BorderRadius.all(Radius.circular(12))),
                               // enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                             ),
                           ),
                         ),
                       
                        SizedBox(height: 20),

      ],
    );
  }



}



class textFieldNumWithLable extends StatelessWidget{

   String? lable;
   String? IKey;
   var map;
   var validmessage;
   var enable;

   textFieldNumWithLable({this.lable,this.map,this.IKey,this.validmessage,this.enable=true});
   
    
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [


                Text(lable!, style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 16,
                          color: const Color(0xff000000),
                        ),
                          textAlign: TextAlign.right,),
                        SizedBox(height: 12,),

                         Padding(
                           padding: const EdgeInsets.only(left:8.0,right: 8.0),
                           child: TextFormField(
                            enabled: enable,
                             keyboardType: TextInputType.number,
                            // enabled: _con.loading.,
                             // controller: _con!.userName,
                             style: ThemeApp?.headline2,
                            initialValue: map[IKey]!=null?map[IKey].toString():null ,
                             textAlign: TextAlign.right,
                             onSaved: (input){

                              if (input != null)
                                map[IKey]= input;
                             
                             },
                             validator: (input) => (input==null || input.isEmpty)? validmessage: null,
                             decoration: InputDecoration(
                               hintText: lable,
                               hintStyle: ThemeApp!.hintStyle,
                               border: OutlineInputBorder(borderSide: BorderSide(color: ThemeApp!.borderColor,width: 1),borderRadius: BorderRadius.all(Radius.circular(12))),
                               focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5),width: 1),borderRadius: BorderRadius.all(Radius.circular(12))),
                               // enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                             ),
                           ),
                         ),
                       
                        SizedBox(height: 20),

      ],
    );
  }



}

Widget Htmlelement(Item, pType) {
  if (pType == 2)
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8,top: 16,bottom: 8),
      child: Text(
        "${Item['content']}",
        style:  TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 16,
            //color: const Color(0xff42487e),
            height: 1

        ),
      ),
    );
  else
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8,top: 16,bottom: 5),
      child: Text(
        "${Item['content']}",
        style:  TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 16,
            //color: const Color(0xff42487e),
            height: 1

        ),
      ),
    );
}


Widget textField(Item, Map<String, dynamic> map, pType, {row,minLines=1,show=false}) {
  printO("Contains  ${Item["key"]}  ${map.containsKey(Item["key"])}");
  TextEditingController _texteditController=new TextEditingController(text: map[Item["key"]]);
    return 
         Padding(
      
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [

          Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Text(Item["label"])),
                  const SizedBox(height: 5),

          TextFormField(
           // name: Item["key"],
           // initialValue: map.containsKey(Item["key"]) ? map[Item["key"]].toString(): null,
           readOnly: show,
          controller: _texteditController,
            keyboardType: checkFieldType(Item["type"]),
            maxLines: 100,
            minLines: minLines??1,
            style:  ThemeApp!.headline2,
            onSaved: (value) {
              if(value!=null)
              map[Item["key"]] = value;
            },
            decoration: InputDecoration(
                hintText: Item['hideLabel'] != null && Item['hideLabel']
                    ? ''
                    : Item["label"],
                hintStyle:  ThemeApp!.hintStyle,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: ThemeApp!.borderColor, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10)))
          
                // ,fillColor: Color(0xfff0f0f5),
                ),
         
            validator: FormBuilderValidators.compose([
              if (Item['validate'] != null &&
                  Item['validate']['required'] != null &&
                  Item['validate']['required'])
                 FormBuilderValidators.required(errorText: Item['validate']['customMessage']??'Field is Required'),
          
             if(Item['validate'] != null && Item['validate']['minLength']!=null)
               FormBuilderValidators.minLength(Item['validate']['minLength'] ,errorText: 'error min Length is ${Item['validate']['minLength']}'),
             if(Item['validate'] != null && Item['validate']['maxLength']!=null)
               FormBuilderValidators.minLength(Item['validate']['maxLength'] ,errorText: 'error max Length is ${Item['validate']['maxLength']}'),

             if(Item['validate'] != null && Item['validate']['pattern']!=null)
               FormBuilderValidators.match(RegExp(Item['validate']['pattern']) ,errorText: 'error max Words is ${Item['validate']['pattern']}'),   
            
           
            if(Item['validate'] != null && Item['validate']['minWords']!=null)
               FormBuilderValidators.minWordsCount(Item['validate']['minWords'] ,errorText: 'error min Words is ${Item['validate']['minWords']}'),   
            

            if(Item['validate'] != null && Item['validate']['maxWords']!=null)
               FormBuilderValidators.minWordsCount(Item['validate']['maxWords'] ,errorText: 'error max Words is ${Item['validate']['maxWords']}'),   
            
              // FormBuilderValidators.max(context, 70),
              //     (val){
              //   if(val < 0)
              //     return 'We cannot have a negative age';
              //   return null;
              // }
            ]),
          ),
        ],
      ),
    //)
    );
    
}


Widget textFieldNum(Item, Map<String, dynamic> map, pType, {row,minLines=1,show=false}) {
  printO(" textFieldNum Contains  ${Item["key"]}  ${map.containsKey(Item["key"])}");
  TextEditingController _texteditController= TextEditingController(text: map[Item["key"]]);
    return 
         Padding(
      
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [

          Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Text(Item["label"])),
                  const SizedBox(height: 5),
          TextFormField(
            //name: Item["key"],
            readOnly: show,
            controller: _texteditController,
            //initialValue: map.containsKey(Item["key"]) ? map[Item["key"]].toString(): null,
           keyboardType: TextInputType.number,
           
            //maxLines: 100,
            minLines: 1,
            style: ThemeApp!.headline2,
            // onChanged: (value){
            //    map[Item["key"]] = value;
            // },
            onSaved: (value) {
              if(value!=null)
              map[Item["key"]] = value;
            },
            decoration: InputDecoration(
                hintText: Item['hideLabel'] != null && Item['hideLabel']
                    ? ''
                    : Item["label"],
                hintStyle:  ThemeApp!.hintStyle,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: ThemeApp!.borderColor, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10)))
          
                // ,fillColor: Color(0xfff0f0f5),
                ),
            validator: FormBuilderValidators.compose([
              if (Item['validate'] != null &&
                  Item['validate']['required'] != null &&
                  Item['validate']['required'])
                 FormBuilderValidators.required(errorText: Item['validate']['customMessage']??'Field is Required'),
                 FormBuilderValidators.numeric( errorText: 'Number Field '),

                  if(Item['validate'] != null && Item['validate']['minLength']!=null)
                  FormBuilderValidators.minLength(Item['validate']['minLength'] ,errorText: 'error min Length is ${Item['validate']['minLength']}'),
                    if(Item['validate'] != null && Item['validate']['maxLength']!=null)
                  FormBuilderValidators.minLength(Item['validate']['maxLength'] ,errorText: 'error max Length is ${Item['validate']['maxLength']}'),

                if(Item['validate'] != null && Item['validate']['pattern']!=null)
                  FormBuilderValidators.match(RegExp(Item['validate']['pattern']) ,errorText: 'error patternis ${Item['validate']['pattern']}'),   
         
              // FormBuilderValidators.numeric(context, errorText: 'La edad debe ser numérica.'),
              // FormBuilderValidators.max(context, 70),
              //     (val){
              //   if(val < 0)
              //     return 'We cannot have a negative age';
              //   return null;
              // }
            ]),
          ),
        ],
      ),
    //)
    );
    
}


Widget textFieldPhone(Item, Map<String, dynamic> map, pType, {row,minLines=1,show=false}) {
  printO("Contains  ${Item["key"]}  ${map.containsKey(Item["key"])}");
  TextEditingController _texteditController=new TextEditingController(text: map[Item["key"]]);
    return 
         Padding(
      
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [

          Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Text(Item["label"])),
                  const SizedBox(height: 5),
          TextFormField(
            readOnly: show,
           // name: Item["key"],
            //initialValue: map.containsKey(Item["key"]) ? map[Item["key"]].toString(): null,
            controller: _texteditController,
            keyboardType: TextInputType.phone,
            maxLines: 100,
            minLines: 1,
            style:  ThemeApp!.headline2,
            onSaved: (value) {
              if(value!=null)
              map[Item["key"]] = value;
            },
            decoration: InputDecoration(
                hintText: Item['hideLabel'] != null && Item['hideLabel']
                    ? ''
                    : Item["label"],
                hintStyle:  ThemeApp!.hintStyle,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: ThemeApp!.borderColor, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10)))
          
                // ,fillColor: Color(0xfff0f0f5),
                ),
            validator: FormBuilderValidators.compose([
              if (Item['validate'] != null &&
                  Item['validate']['required'] != null &&
                  Item['validate']['required'])
                 FormBuilderValidators.required(errorText: Item['validate']['customMessage']??'Field is Required'),
                 FormBuilderValidators.phoneNumber(errorText: 'Phone Number '),

                if(Item['validate'] != null && Item['validate']['minLength']!=null)
                  FormBuilderValidators.minLength(Item['validate']['minLength'] ,errorText: 'error min Length is ${Item['validate']['minLength']}'),
                if(Item['validate'] != null && Item['validate']['maxLength']!=null)
                  FormBuilderValidators.minLength(Item['validate']['maxLength'] ,errorText: 'error max Length is ${Item['validate']['maxLength']}'),

                if(Item['validate'] != null && Item['validate']['pattern']!=null)
                  FormBuilderValidators.match(RegExp(Item['validate']['pattern']) ,errorText: 'error match pattern is ${Item['validate']['pattern']}'),   
         
              // FormBuilderValidators.numeric(context, errorText: 'La edad debe ser numérica.'),
              // FormBuilderValidators.max(context, 70),
              //     (val){
              //   if(val < 0)
              //     return 'We cannot have a negative age';
              //   return null;
              // }
            ]),
          ),
        ],
      ),
    //)
    );
    
}



Widget textFieldPassword(Item, Map<String, dynamic> map, pType, {row,minLines=1,show=false}) {

  StreamController<bool> _controller= StreamController.broadcast();
  TextEditingController _texteditController=new TextEditingController(text: map[Item["key"]]);
  printO("Contains  ${Item["key"]}  ${map.containsKey(Item["key"])}");
  
    return 
         StreamBuilder<bool>(
           stream: _controller.stream,
           initialData: true,
           builder: (context, snapshot) {
             return Padding(
                   
                   padding: const EdgeInsets.only(left: 8, right: 8),
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                     children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.loose,
                        child: Text(Item["label"])),
                        const SizedBox(height: 5),
                       TextFormField(
                       //  name: Item["key"],
                        // initialValue: map.containsKey(Item["key"]) ? map[Item["key"]].toString(): null,
                         //keyboardType: TextInputType.
                         readOnly: show,
                        controller: _texteditController,
                         //maxLines: 100,
                        // minLines: 1,
                         style:  ThemeApp!.headline2,
                        obscureText: snapshot.data??true,
                       
                         onSaved: (value) {
                               if(value!=null)
                                   map[Item["key"]] = value;
                         },
                         decoration: InputDecoration(
                       
                          suffixIcon: InkWell(
                            child: Icon(snapshot.data!?Icons.visibility : Icons.visibility_off),
                            onTap: (){
                              _controller.add(!snapshot.data!);
                            },
                          ),
                                     
                                       hintText: Item['hideLabel'] != null && Item['hideLabel']
                        ? ''
                        : Item["label"],
                                       hintStyle:  ThemeApp!.hintStyle,
                                       border: OutlineInputBorder(
                        borderSide: BorderSide(color: ThemeApp!.borderColor, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(10)))
                                    
                                       // ,fillColor: Color(0xfff0f0f5),
                                       ),
                         validator: FormBuilderValidators.compose([
                                     if (Item['validate'] != null &&
                                         Item['validate']['required'] != null &&
                                         Item['validate']['required'])
                                        FormBuilderValidators.required(errorText: Item['validate']['customMessage']??'Field is Required'),
                                      
                                      if(Item['validate'] != null && Item['validate']['minLength']!=null)
                                          FormBuilderValidators.minLength(Item['validate']['minLength'] ,errorText: 'error min Length is ${Item['validate']['minLength']}'),
                                        if(Item['validate'] != null && Item['validate']['maxLength']!=null)
                                          FormBuilderValidators.minLength(Item['validate']['maxLength'] ,errorText: 'error max Length is ${Item['validate']['maxLength']}'),

                                        if(Item['validate'] != null && Item['validate']['pattern']!=null)
                                          FormBuilderValidators.match(RegExp(Item['validate']['pattern']) ,errorText: 'error match Words is ${Item['validate']['pattern']}'),   
                                      
                                     
                                     // FormBuilderValidators.max(context, 70),
                                     //     (val){
                                     //   if(val < 0)
                                     //     return 'We cannot have a negative age';
                                     //   return null;
                                     // }
                         ]),
                       ),
                     ],
                   ),
                 //)
                 );
           }
         );
    
}

Widget textFieldEmail(Item, Map<String, dynamic> map, pType, {row,minLines=1,show=false}) {
  printO("Contains  ${Item["key"]}  ${map.containsKey(Item["key"])}");
  TextEditingController _texteditController=new TextEditingController(text: map[Item["key"]]);
    return 
         Padding(
      
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Text(Item["label"])),
                  const SizedBox(height: 5),
          TextFormField(
           // name: Item["key"],
           // initialValue: map.containsKey(Item["key"]) ? map[Item["key"]].toString(): null,
           readOnly: show,
            keyboardType: TextInputType.emailAddress,
            maxLines: 100,
            minLines: 1,
            controller: _texteditController,
            style:  ThemeApp!.headline2,
            onSaved: (value) {
              if (value != null)
              map[Item["key"]] = value;
            },
            decoration: InputDecoration(
                hintText: Item['hideLabel'] != null && Item['hideLabel']
                    ? ''
                    : Item["label"],
                hintStyle:  ThemeApp!.hintStyle,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: ThemeApp!.borderColor, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10)))
          
                // ,fillColor: Color(0xfff0f0f5),
                ),
            validator: FormBuilderValidators.compose([
              if (Item['validate'] != null &&
                  Item['validate']['required'] != null &&
                  Item['validate']['required'])

                 FormBuilderValidators.required(errorText: Item['validate']['customMessage']??'Field is Required'),
                FormBuilderValidators.email(errorText: 'Not  Email ')
              // FormBuilderValidators.numeric(context, errorText: 'La edad debe ser numérica.'),
              // FormBuilderValidators.max(context, 70),
              //     (val){
              //   if(val < 0)
              //     return 'We cannot have a negative age';
              //   return null;
              // }
            ]),
          ),
        ],
      ),
    //)
    );
    
}



checkFieldType(type) {
  switch (type) {
    case "number":
      return TextInputType.number;

    case "email":
      return TextInputType.emailAddress;

    case "password":
      return TextInputType.visiblePassword;

    case "url":
      return TextInputType.url;

    case "textfield":
      return TextInputType.text;

    case "textarea":
      return TextInputType.multiline;

    default:
      return TextInputType.text;
  }
}