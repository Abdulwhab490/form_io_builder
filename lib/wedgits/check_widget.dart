import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:form_io_builder/styles/theme_app.dart';

import '../utils/utils.dart';

Widget CheckWidget(Item, map, pType,{show=false}) {
 
     return FormBuilderCheckbox(
           enabled: !show,
           name:Item["key"],
           title: Item['hideLabel'] ? Text('') : Text("${Item['label']}",style: ThemeApp.headline2 ,),
           initialValue: false,
           activeColor: Colors.lightBlueAccent,
           onSaved: (value) {
            if(value!=null)
     map[Item["key"]] = value;
           },
         );
   
}



formBuilderCheckboxGroup(Item, map, pType,{show=false}) {
   //Map<String,dynamic> das;
   //das.values.toList()
  printO("Contains  ${Item["key"]}  ${map.containsKey(Item["key"])}  , ${Item['values'] }");
  
     return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Text(Item["label"])),
                  const SizedBox(height: 5),
         FormBuilderCheckboxGroup<String>(
          enabled: !show,
           name: Item['key'],
         
           initialValue:
               map.containsKey(map[Item["key"]]) ? map[Item["key"]] : null,
           onSaved: (value) {
            if(value!=null)
             map[Item["key"]] = value;
           },
         
         
           decoration: InputDecoration(
             labelText: Item['label'],
             labelStyle:  TextStyle(
                 fontFamily: 'Tajawal',
                 fontSize: 14,
                 //color: const Color(0xff42487e),
                 height: 1
         
             )
           ),
           activeColor: Colors.lightBlue,
           options: Item['values'].length > 0
               ? Item['values']
                   .map<FormBuilderFieldOption<String>>((e) =>
                       FormBuilderFieldOption(
                           value: e['value'].toString(),
                           child: Text('${e['label']}',style:  TextStyle(
                               fontFamily: 'Tajawal',
                               fontSize: 14,
                               //color: const Color(0xff42487e),
                               height: 1
         
                           ),)))
                   .toList()
               : [],
           validator: FormBuilderValidators.compose([
             if (Item['validate'] != null &&
                 Item['validate']['required'] != null &&
                 Item['validate']['required'])
                FormBuilderValidators.required(errorText: Item['validate']['customMessage']??'Field is Required'),
         
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
     );
    
}



formBuilderRadioGroup(Item, map, pType,{show=false}) {
  printO("Contains  ${Item["key"]}  ${map.containsKey(Item["key"])}");
 
    return Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8, left: 8),
      child:  Column(
         crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Text(Item["label"])),
                  const SizedBox(height: 5),
          FormBuilderRadioGroup<String>(
            enabled: !show,
          initialValue:
              map[Item["key"]] != null ? map[Item["key"]].toString() : null,
          name: Item['key'],
          activeColor: Colors.lightBlue,
          decoration: InputDecoration(
            labelText: Item['label'],
            labelStyle:  TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 16,
                //color: const Color(0xff42487e),
                height: 1
              
            ),border: InputBorder.none
              
          ),
          onSaved: (value) {
            if(value!=null)
            map[Item["key"]] = value;
          },
          options: Item['values'].length > 0
              ? Item['values']
                  .map<FormBuilderFieldOption<String>>((e) =>
                      FormBuilderFieldOption(
                          value: e['value'].toString(),
                          child: Text('${e['label']}',style:  TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14,
                              //color: const Color(0xff42487e),
                              height: 1
              
                          ),)))
                  .toList()
              : [],
          validator: FormBuilderValidators.compose([
            if (Item['validate'] != null &&
                Item['validate']['required'] != null &&
                Item['validate']['required'])
               FormBuilderValidators.required(errorText: Item['validate']['customMessage']??'Field is Required'),
              
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
      ));
    
}


trueList(list) {
  var items=<String>[];
    try{ 
      
      if(list is Map<String,dynamic>)
        list.forEach((key, value) {
          if(value==true)
            items.add(key);

      });

      else {printO("ListCheck ${list.runtimeType}");
      if(list!=null && list.length>0)
      list.forEach(( value) {
          
          printO("ItemCheck@ ${value}");
            items.add(value.toString());

      });}
    }catch(e){
       printO("Error $e");
    };
  return items; 
  
  

   
}