import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form_io_builder/repository/repsitory_data.dart';

import '../utils/utils.dart';
import 'search_field_select.dart';




Widget SelectWithOnChange(Item, Map<String, dynamic> map, pType,
    {onchange, row= '', width= 400, height, firstItem,enable}) {
  StreamController selectStream = new StreamController.broadcast();
 var listMap=[];
 selectStream.stream.listen((data){
   if(data !=null)
    listMap=data;
 });
 Future.delayed(Duration(seconds: 1)).then((value){
    GetSeletItemsMap(selectStream, Item,firstItem: firstItem);
 },);
   
 
  printO("Contains  ${Item["key"]}  ${map.containsKey(Item["key"])}");
  return StreamBuilder(
      stream: selectStream.stream,
      builder: (context, AsyncSnapshot snapshot) {
        // if(firstItem!=null && !(snapshot.data as List<DropdownMenuItem>).contains(firstItem))
        //   (snapshot.data as List<DropdownMenuItem>).insert(0,firstItem);
       printO(" ==================== StreamBuilder ${Item["key"]}========  ${snapshot.data}");
      return      Padding(
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
                     
                     
                     StatefulBuilder(
                       builder: (context,setStateWidget) {
                         return SearchFieldSelect(
                          hint:Item["label"] ,//labelText: Item["label"],
                          suffixIcon: Icon(Icons.arrow_drop_down_circle),
                          items:snapshot.hasData?(snapshot.data).map<DropItem>((e)=>DropItem(text:e['text'],value: e['value'] )).toList():[],
                          isMultiple:Item["multiple"]??false,
                          onChanged: Item["multiple"]==null || Item["multiple"]==false? (value){
                          setStateWidget(() =>  map[Item["key"]]=value.value);
                          }:null,
                          onChangedMulti: Item["multiple"]!=null && Item["multiple"]==true? (values){
                           setStateWidget(() => map[Item["key"]]=values.map((e)=>e.value).toList());
                           print('=============== list select  ${map[Item["key"]]}');
                            
                          }:null,
                          value: Item["multiple"]==null || Item["multiple"]==false? map[Item["key"]]: null , 
                          values:Item["multiple"]!=null && Item["multiple"]==true? map[Item["key"]]:null ,
                           readOnly: enable,

                          validator: (v){

                               
                          if (Item['validate'] != null &&
                              Item['validate']['required'] != null &&
                              Item['validate']['required'] &&( map[Item["key"]]==null || map[Item["key"]].isEmpty ) )

                             { return Item['validate']['customMessage']??'Field is Required';}

                          return null;                   
                          }
                          
                       
                         );
                       }
                     )
                     
                  //     FormBuilderDropdown<Object?>(
                  //   //enabled: true,
                  //    enabled: !enable,  
                  //   name: Item["key"],
                  //   initialValue:
                  //       map.containsKey(Item["key"]) ? map[Item["key"]] : null,
                  //   onSaved: (value) {
                  //     if(value!=null)
                  //     map[Item["key"]] = value;
                  //   },
                    
                    
                  //   decoration: InputDecoration(
                  //       fillColor: Color(0xfff0f0f5),
                  //       suffixIcon: InkWell(
                  //         child: Icon(
                  //           Icons.refresh,
                  //           color: ThemeApp.primaryColor,
                  //         ),
                  //         onTap: () {
                  //           GetSeletItemsMap(selectStream, Item);
                  //         },
                  //       ),
                        
                  //       labelText: Item["label"],
                  //       border: OutlineInputBorder(
                  //           borderSide:
                  //               BorderSide(color: Color(0xfff0f0f5), width: .5),
                  //           borderRadius: BorderRadius.all(Radius.circular(12)))),
                  //   items: snapshot.hasData?(snapshot.data)
                  //   .map<DropdownMenuItem<Object?>>((e)=> DropdownMenuItem<Object?>(child: Text('${e['text']}'),value:e['value'] )).toList()
                  //   // [
                  //   //   //if(Item)
                  //   //   for (DropdownMenuItem<String> list in (snapshot.data as List<DropdownMenuItem<String>>))
                  //   //   //for( snapshot.data in item)
                  //   //     list,
                  //   // ]
                  //       :listMap!=null?(listMap)
                  //   .map<DropdownMenuItem<Object?>>((e)=> DropdownMenuItem<Object?>(child: Text('${e['text']}'),value:e['value'] )).toList()
                  //    :[
                  //         //  DropdownMenuItem(child: Text('tess'),value:1)
                  //       ],
                  //   validator: FormBuilderValidators.compose([
                  //     if (Item['validate'] != null &&
                  //         Item['validate']['required'] != null &&
                  //         Item['validate']['required'])
                  //        FormBuilderValidators.required(errorText: Item['validate']['customMessage']??'Field is Required'),
                  //   ]),
                  //   onChanged: onchange,
                  // ),
              
              
                ],
              ),
            
          );
          
     
      });
}

GetSeletItems(stream, Item,{firstItem}) async {
  if (Item["dataSrc"] != null &&
      Item["dataSrc"] == "url" &&
      Item["data"]["url"] != null) {
    var url = Item["data"]["url"];
    printO("test Url $url");
    List? value = await Utils.instance.getUrlValue(url: url);
    if (value != null) {
      printO("test value $value");
     // Future.delayed(Duration(milliseconds: 500), () {
      var list=<DropdownMenuItem>[];
        if(firstItem!=null)
        {

           list.add(firstItem);//=<DropdownMenuItem>[firstItem];

          list.addAll( value
              .map<DropdownMenuItem>((e) => DropdownMenuItem(
            value: e[Item['valueProperty']??Item['value']],
            child:
            Text('${Item['template']!=null?e[getNamepropertyFromTemp(Item['template'])]:e['label']}'),
          )));
         // list.inser(0,firstItem);
          stream.add(list);

          return list;

        }else
        {

            list.addAll( value
                .map<DropdownMenuItem>((e) => DropdownMenuItem(
              value: e[Item['valueProperty']??Item['value']],
              child:
                Text('${Item['template']!=null?e[getNamepropertyFromTemp(Item['template'])]:e['label']}'),
              )));
              
              stream.add(list);
              return list; 
            }
    //  });
    } else
    {
     RepsitoryData().getList(url: url).listen((event) {
        if (event is Map<String, dynamic>) {

          var list=<DropdownMenuItem>[];
          printO("${event}");
          if(firstItem!=null)
            {
               list.add(firstItem);
              list.addAll(event["value"]
                  .map<DropdownMenuItem>((e) => DropdownMenuItem(
               value: e[Item['valueProperty']??Item['value']],
               child:
               Text('${Item['template']!=null?e[getNamepropertyFromTemp(Item['template'])]:e['label']}'),
             )));
             //list.insert(0,firstItem);
             stream.add(list);
            

            }else
          {
                
                list.addAll(event["value"]
                  .map<DropdownMenuItem>((e) => DropdownMenuItem(
                    value: e[Item['valueProperty']??Item['value']],
                    child:
                    Text('${e[getNamepropertyFromTemp(Item['template'])]}'),
                  )));
                stream.add(list);

                 
              }
          Utils.instance.setUrlValue(Item["data"]["url"], event["value"]);
          //  stream.add(DelTasks);
        }else if(event is List){

          var list=<DropdownMenuItem>[];
            if(firstItem!=null)
             list.add(firstItem);

            list.addAll( event
                .map<DropdownMenuItem>((e) => DropdownMenuItem(
                    value: e[Item['valueProperty']??Item['value']],
                    child:
                    Text('${e[getNamepropertyFromTemp(Item['template'])]}'),
                  ))
            );

            //  if(skipsElem!=null && skipsElem.length>0)
            //   {
            //     list.removeWhere((element) => (skipsElem as List).contains(element["value"]));
            //   }
            stream.add(list);
               
          Utils.instance.setUrlValue(Item["data"]["url"], event);

        } 
        
        
         else {
          printO("ONEvent ${event}");
          //tasksStream.addError("Error");
          stream.addError(event);
        }
      }, onDone: (() {
        printO("ONDone IS");
        //tasksStream.done;
      }), onError: (err) {
        printO("Error $err");
        stream.addError(err);
      });
      }
  } else {
     printO("Local_data ${Item["data"]["values"]}");
     var list;
   // Future.delayed(Duration(milliseconds: 500), () {
      
      if(firstItem!=null)
      {

         list= Item["data"]["values"]
            .map<DropdownMenuItem>((e) => DropdownMenuItem(
          value: Item['valueProperty']??'value',
          child: Text('${Item['template']!=null? e[getNamepropertyFromTemp(Item['template'])]:e['label']}'),
        )).toList();
        list.insert(0,firstItem);
        stream.add(list);
        return list;

      }else
      {
        list=Item["data"]["values"]
          .map<DropdownMenuItem>((e) => DropdownMenuItem(
                value: Item['valueProperty']??'value',
                child: Text('${Item['template']!=null? e[getNamepropertyFromTemp(Item['template'])]:e['label']}'),
                  ))
              .toList();   
            stream.add(list);

            return list;
          
     }
    //});
  }
}


GetSeletItemsMap(StreamController stream, Item,{firstItem}) async {
  if (Item["dataSrc"] != null &&
      Item["dataSrc"] == "url" &&
      Item["data"]["url"] != null) {
    var url = Item["data"]["url"];
    printO("test Url $url");
    List? value = await Utils.instance.getUrlValue(url: url);
    if (value != null) {
      printO("test value $value");
     // Future.delayed(Duration(milliseconds: 500), () {
      var list=[];
        if(firstItem!=null)
        {

           list.add(firstItem);//=<DropdownMenuItem>[firstItem];

          list.addAll( value
              .map((e) =>{
            "value": e[Item['valueProperty']??'value'],
            "text":'${Item['template']!=null?e[getNamepropertyFromTemp(Item['template'])]:e['label']}'
            }
          ).toList());
         // list.inser(0,firstItem);
          stream.add(list);

          return list;

        }else
        {

            list.addAll( value
                .map((e) =>{
                    "value": e[Item['valueProperty']??'value'],
                    "text":'${Item['template']!=null?e[getNamepropertyFromTemp(Item['template'])]:e['label']}'
                    }
                  ));
              
              stream.add(list);
              return list; 
            }
    //  });
    } else
    {
     RepsitoryData().getList(url: url).listen((event) {
        if (event is Map<String, dynamic>) {

          var list=[];
          printO("${event}");
          if(firstItem!=null)
            {
               list.add(firstItem);
              list.addAll(event["value"]
                  .map((e) =>{
                    "value": e[Item['valueProperty']??'value'],
                    "text":'${Item['template']!=null?e[getNamepropertyFromTemp(Item['template'])]:e['label']}'
                    }
                  )
             );
             //list.insert(0,firstItem);
             stream.add(list);
            

            }else
          {
                
                list.addAll(event["value"]
                  .map((e) =>{
                    "value": e[Item['valueProperty']??'value'],
                    "text":'${Item['template']!=null?e[getNamepropertyFromTemp(Item['template'])]:e['label']}'
                    }
                  )
                  );
                stream.add(list);

                 
              }
          Utils.instance.setUrlValue(Item["data"]["url"], event["value"]);
          //  stream.add(DelTasks);
        }else if(event is List){

          var list=[];
            if(firstItem!=null)
             list.add(firstItem);

            list.addAll( event
                .map((e) =>{
                    "value": e[Item['valueProperty']??'value'],
                    "text":'${Item['template']!=null?e[getNamepropertyFromTemp(Item['template'])]:e['label']}'
                    }
                  ));
            

            //  if(skipsElem!=null && skipsElem.length>0)
            //   {
            //     list.removeWhere((element) => (skipsElem as List).contains(element["value"]));
            //   }
            stream.add(list);
               
          Utils.instance.setUrlValue(Item["data"]["url"], event);

        } 
        
        
         else {
          printO("ONEvent ${event}");
          //tasksStream.addError("Error");
          stream.addError(event);
        }
      }, onDone: (() {
        printO("ONDone IS");
        //tasksStream.done;
      }), onError: (err) {
        printO("Error $err");
        stream.addError(err);
      });
      }
  } else {
     printO("Local_data ${Item["data"]["values"]}");
     var list;
   // Future.delayed(Duration(milliseconds: 500), () {
      
      if(firstItem!=null)
      {

         list= Item["data"]["values"]
            .map((e) =>{
                    "value": e[Item['valueProperty']??'value'],
                    "text":'${Item['template']!=null?e[getNamepropertyFromTemp(Item['template'])]:e['label']}'
                    }
                  ).toList();
        list.insert(0,firstItem);
        stream.add(list);
        return list;

      }else
      {

        printO("======================== Local_data ${Item["data"]["values"]}");
        list=Item["data"]["values"]
         .map((e) =>{
                    "value": e[Item['valueProperty']??'value'],
                    "text":'${Item['template']!=null?e[getNamepropertyFromTemp(Item['template'])]:e['label']}'
                    }
                  )
              .toList();   
            stream.add(list);

            printO("======================== Local_data_List ${list}");

            return list;
          
     }
    //});
  }
}



getNamepropertyFromTemp(String string) {
  if (string != null) {
    return string.split('.').last.split('}').first.trim();
  }
}