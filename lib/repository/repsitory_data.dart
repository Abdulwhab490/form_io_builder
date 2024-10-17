
import 'dart:convert';
import 'dart:io';

import '../utils/utils.dart';
import 'package:http/http.dart' as http;
class RepsitoryData{

Stream<dynamic> getList({url}) async*{
printO("Url : $url");
  String? reply;
  final response = await http.get(
          Uri.parse(url),headers: {HttpHeaders.contentTypeHeader: 'application/json'
         // ,'Authorization': "Bearer  ${userRep.currentUser.value.apiToken}",
         // 'tenant':'${userRep.currentUser.value.tenantId}'
          }).timeout(Duration(seconds: 20));
   reply=response.body;
  printO(reply);
  if (response.statusCode == 200) {
    var data = json.decode(reply);

    yield data;//data.map((e) => delmonTasks.fromJson(e)).toList();
    // data.forEach((value) {
    //
    // });

  }
  else
    yield reply;

}


Future<dynamic> getListFutuer({url}) async{

  //printO("Url : $url, token ${userRep.currentUser.value.apiToken}");

  String reply;

  final response = await http.get(
          Uri.parse(url),headers: {HttpHeaders.contentTypeHeader: 'application/json'
        //  ,'Authorization':"Bearer ${userRep.currentUser.value.apiToken}",
        //  'tenant':'${userRep.currentUser.value.tenantId}'
          }).timeout(Duration(seconds: 20));
   reply=response.body;
  printO(reply);
  if (response.statusCode == 200 || response.statusCode == 201) {
    var data = json.decode(reply);

    return data;

  }
  else
    return reply;

}

}
