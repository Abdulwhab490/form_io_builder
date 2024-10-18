import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart' as intl;

import '../styles/theme_app.dart';
import '../utils/utils.dart';

DateTimePaker(Item, Map map, inputType, {ptype= 1, row= '',height=50,show=false}) {
  // if( map.containsKey([Item["key"]])

  printO(
      "Contains  ${Item["key"]}  ${map.containsKey(Item["key"])}     ${map[Item["key"]]}");
    TextEditingController _controller=TextEditingController(text: map[Item["key"]]);
    return 
    StatefulBuilder(builder:(context, setState) => 
    Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
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
                  enabled:!show ,
                  controller: _controller,
                //   initialValue: (map[Item["key"]] is String)
                //       ? DateTime.tryParse(map[Item["key"]])!.toLocal()
                //       : map[Item[
                // "key"]], //map.containsKey(map[Item["key"]]) ?map[Item["key"]]:null,
                  // onChanged: _onChanged,
                  readOnly: true,
                  style:  ThemeApp.headline2,
                  onSaved: (value) {
                    if (value != null)
                      map[Item["key"]] = value;
                  },
                  //inputType: inputType,
                  //format:intl.DateFormat(Item['widget']['format']??'yyyy-MM-dd'),
                  // inputFormatters: [
                  //    //FilteringTextInputFormatter.allow(RegExp(r'^\d{1,10}$'))
                  //    FilteringTextInputFormatter.allow(RegExp(r'^\d{1,10}$'))
                  // ],
                  decoration: InputDecoration(
                    //  contentPadding: EdgeInsets.only(left: 10,right: 10),
                      hintText: Item['hideLabel'] != null && Item['hideLabel']
                ? ''
                : Item['label'],
                      hintStyle:  ThemeApp.headline2,
                      suffixIcon: Icon(Icons.date_range_sharp),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
               //   initialTime: TimeOfDay(hour: 8, minute: 0),
                  validator: FormBuilderValidators.compose([
                    if (Item['validate'] != null &&
              Item['validate']['required'] != null &&
              Item['validate']['required'])
                      FormBuilderValidators.required(errorText: Item['validate']['customMessage']??'Field is Required'),
                  
                   // FormBuilderValidators.date( errorText: 'is Date Field'),
                    // FormBuilderValidators.max(context, 70),
                    //     (val){
                    //   if(val < 0)
                    //     return 'We cannot have a negative age';
                    //   return null;
                    // }
                  ]),
                  // initialValue: DateTime.now(),
                  // enabled: true,
              
                onTap:() => _selectDateTime(context,_controller,Item['widget']['enableTime'],Item['widget']['format']),
                
              ),
            ],
          ),
        ));
    
}


Future<void> _selectDateTime(BuildContext context,controller,enableTime,format) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null ) {
          DateTime finalDateTime = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day);

      if(enableTime)
      {
        
        TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
        if (selectedTime != null ) {
           finalDateTime 
          = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          selectedTime.hour,
          selectedTime.minute,
        );

        }
      }
       

        // Update the TextField with the selected DateTime
        controller.text =intl.DateFormat(format).format(finalDateTime);// finalDateTime.toString(); // You can format this as needed
      
    }
  }