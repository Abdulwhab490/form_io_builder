


import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
enum OperationType{edit,show}

class Utils {
  Utils._privateConstructor();
  static final Utils _instance = Utils._privateConstructor();
  static Utils get instance => _instance;
  static List<Map<String,dynamic>> listMenu=[];
  static GlobalKey<NavigatorState>? navigatorKey;
  static Future<bool> isConnected() async {
    try {
      List<InternetAddress> result = await InternetAddress.lookup('example.com')
          .timeout(const Duration(seconds: 5));

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  static bool isBase64(String value) {
    String pattern =
        r'^([A-Za-z0-9+/]{4})*([A-Za-z0-9+/]{3}=|[A-Za-z0-9+/]{2}==)?$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  setUrlValue(url,list){
    if(listMenu!=null  && (list!=null ) ) {
        bool es = listMenu.any((element) => element.containsKey(url));
        printO("is found $es");
        if(es) {
          printO("is found $es");
          return;
        }
        listMenu.add({url:list});
      }
    return;
    }

  getUrlValue({url}) {

    printO(" start getUrlvalue $url");
    if(listMenu!=null && listMenu.length>0)
      {
      var sds= listMenu.where((element) => element[url]!=null);
      if(sds!=null&&sds.length>0) {
        printO(" end  getUrlvalue ${sds.first[url]}");
        return sds.first[url];
      }
    }
    printO(" end  getUrlvalue $url");
      return null;
  }

Color dynamicColor(String color) {
    // TODO test if brightness is dark or not
    try {
      return Color(int.parse(color.replaceAll("#", "0xFF")));
    } catch (e) {
      return Color(0xFFCCCCCC);
    }
  }

}

  printO(String? message){

    debugPrint(message);
  }

fileDirectory()async{
  final tempDir = await getTemporaryDirectory();

  return tempDir.path;
}
Future<void> openBase64File(String base64String, String fileName) async {
  // Decode Base64 string to bytes
  final bytes = base64Decode(base64String);

  // Get the temporary directory
  final directory = await getTemporaryDirectory();
  
  // Create a file in the temporary directory
  final file = File('${directory.path}/$fileName');

  // Write the bytes to the file
  await file.writeAsBytes(bytes);

  // Open the file using open_file package
  await OpenFile.open(file.path);
}  
