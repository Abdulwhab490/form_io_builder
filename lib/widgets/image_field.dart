import 'package:flutter/material.dart';
import 'package:form_io_builder/styles/theme_app.dart';
import 'package:form_io_builder/widgets/multi_file_uploader.dart';

import '../utils/utils.dart';
import '../widgets/multi_Bease64_uploader.dart';

Widget image_wedgit(Item, Map<String, dynamic> map, pType, {row,minLines=1,show=false}) {
  printO("Contains  ${Item["key"]}  ${map.containsKey(Item["key"])}");
  //TextEditingController _texteditController=new TextEditingController(text: map[Item["key"]]);

       if(Item['storage']=='url')
                  {
                    List<FileUplaod> images=[];
                      if(map[Item['key']] is List )
                       images.addAll(map[Item['key']]?.map<FileUplaod>((e)=>FileUplaod(onlinePath: e,status: statusUpload.uploaded))!.toList()??[]);
                      else if(map[Item['key']] is String )
                       images.add(FileUplaod(onlinePath: map[Item['key']],status: statusUpload.uploaded));
                    return  Container(
                                margin: const EdgeInsets.only(left: 8, right: 8),
                                decoration: BoxDecoration(
                                  border: Border.all(color: ThemeApp!.borderColor,width: 0.5),
                                  borderRadius: BorderRadius.circular(12)
                                ),child: MultiFileUploader(Item,map,images,show: show,));
                  }
       if(Item['storage']=='base64')
                  {
                    List<String> image=[];
                    if(map[Item['key']] is List )
                    image.addAll(map[Item['key']]??[]);
                    else if(map[Item['key']] is String )
                       image.add(map[Item['key']]);
                    return Container(
                                margin: const EdgeInsets.only(left: 8, right: 8),
                                decoration: BoxDecoration(
                                  border: Border.all(color: ThemeApp!.borderColor,width: 0.5),
                                  borderRadius: BorderRadius.circular(12)),
                                  child: MultiBase64Uploader(Item,map,image,show: show,));
                  } 
        return SizedBox();                    
}

