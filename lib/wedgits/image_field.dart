import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:form_io_builder/styles/theme_app.dart';
import 'package:form_io_builder/wedgits/multi_file_uploader.dart';

import '../utils/utils.dart';
import 'multi_Bease64_uploader.dart';

Widget image_wedgit(Item, Map<String, dynamic> map, pType, {row,minLines=1,show=false}) {
  printO("Contains  ${Item["key"]}  ${map.containsKey(Item["key"])}");
  //TextEditingController _texteditController=new TextEditingController(text: map[Item["key"]]);

       if(Item['storage']=='url')
                  {
                    List<FileUplaod> images=[];
                       images.addAll(map[Item['key']]?.map((e)=>FileUplaod(onlinePath: e,status: statusUpload.uploaded))??[]);
                    return  Container(
                                margin: const EdgeInsets.only(left: 8, right: 8),
                                decoration: BoxDecoration(
                                  border: Border.all(color: ThemeApp.borderColor,width: 0.5),
                                  borderRadius: BorderRadius.circular(12)
                                ),child: MultiFileUploader(Item,map,images,show: show,));
                  }
       if(Item['storage']=='base64')
                  {
                    List<String> image=[];
                    image.addAll(map[Item['key']]?.map((e)=>e)??[]);
                    return Container(
                                margin: const EdgeInsets.only(left: 8, right: 8),
                                decoration: BoxDecoration(
                                  border: Border.all(color: ThemeApp.borderColor,width: 0.5),
                                  borderRadius: BorderRadius.circular(12)),
                                  child: MultiBase64Uploader(Item,map,image,show: show,));
                  } 
        return SizedBox();                    

       
    //      Padding(
      
    //   padding: const EdgeInsets.only(left: 8, right: 8),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Flexible(
    //               flex: 1,
    //               fit: FlexFit.loose,
    //               child: Text(Item["label"])),
    //               const SizedBox(height: 5),
    //       Container(
    //         decoration: BoxDecoration(
    //           border: Border.all(color: ThemeApp.borderColor,width: 0.5),
    //           borderRadius: BorderRadius.circular(12)
    //         ),
    //         child: FormField(
    //          // name: Item["key"],
    //          // initialValue: map.containsKey(Item["key"]) ? map[Item["key"]].toString(): null,
             
    //           onSaved: (value) {
    //             map[Item["key"]] = value;
    //           },
              
    //           validator: FormBuilderValidators.compose([
    //             if (Item['validate'] != null &&
    //                 Item['validate']['required'] != null &&
    //                 Item['validate']['required'])
            
    //               FormBuilderValidators.required(errorText: Item['validate']['customMessage']??'Field is Required'),
    //               // FormBuilderValidators.email(errorText: 'Not  Email ')
    //             // FormBuilderValidators.numeric(context, errorText: 'La edad debe ser numérica.'),
    //             // FormBuilderValidators.max(context, 70),
    //             //     (val){
    //             //   if(val < 0)
    //             //     return 'We cannot have a negative age';
    //             //   return null;
    //             // }
    //           ]),
                     
    //           builder: (formfieldstate){
    //              if(Item['storage']=='url')
    //               {
    //                 return MultiFileUploader(Item,map,);
    //               }
             
    //             if(Item['storage']=='base64')
    //             return MultiFileUploader(Item,map);
            
    //           return SizedBox();  
    //           },
    //         ),
    //       ),
    //     ],
    //   ),
    // //)
    // );
    

}

