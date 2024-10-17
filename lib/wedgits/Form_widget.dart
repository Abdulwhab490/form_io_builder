
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_io_builder/utils/utils.dart';
import 'package:form_io_builder/wedgits/check_widget.dart';
import 'package:form_io_builder/wedgits/date_time_paker.dart';
import 'package:form_io_builder/wedgits/image_field.dart';
import 'package:form_io_builder/wedgits/layout_widget.dart';
import 'package:form_io_builder/wedgits/selectfield.dart';
import 'package:form_io_builder/wedgits/table_widget.dart';
import 'package:form_io_builder/wedgits/textFieldwithlabel.dart';

List<Widget> FormListWedgit( Jsons, Map<String, dynamic> map, {pType = 1,show=false}) {
  List<Widget> listD = [];
    printO("=====================FormListWedgit========List Json  ${Jsons}");
  if (Jsons != null && Jsons.length > 0) {
    printO("List Json length ${Jsons.length}");
    Jsons.forEach((element) {
      listD.add(Padding(
        padding:  EdgeInsets.only(top: 8.0,bottom: 8.0),
        child: FormWedgit(element, map, pType,show: show),
      ));
    });
  }else{
    listD.add(SizedBox());
  }

  return listD;
}

Widget FormWedgit(ItemJson, Map<String, dynamic> map, pType, {row,show=false}) {
  var widget;

  printO("Widegt Type ${ItemJson['type']}  && Label ${ItemJson['label']}");
  switch (ItemJson['type']) {
    case "columns":
      widget = Columns(ItemJson, map,show: show);
      break;

    case "table":
      // if(settingRes.formTypeShow.value)
      //   widget = tableShow(ItemJson, map);
      // else
      widget = tableShow(ItemJson, map);
      break;

    case "panel":
      widget = panel(ItemJson, map,show: show);
      break;

    case "htmlelement":
      widget = Htmlelement(ItemJson, pType);
      break;

    case "tabs":
      widget = taps(ItemJson, map,show: show);

      break;

    case "fieldset":
      widget = fieldSet(ItemJson, map,show: show);
      break;

    case "well":
      widget = panel(ItemJson, map,show: show);
      break;

    case "content":
      widget = SizedBox();
      break;

    case "textfield":
      // if(settingRes.formTypeShow.value)
      //    widget =HtmlField(ItemJson, map, pType, row: row);
      //   else
      widget = textField(ItemJson, map, pType, row: row,show: show);
      break;

    case "textarea":
      // if(settingRes.formTypeShow.value)
      //   widget =HtmlField(ItemJson, map, pType, row: row);
      // else
      widget = textField(ItemJson, map, pType,minLines: 5,show: show);
      break;

    case "number":
      // if(settingRes.formTypeShow.value)
      //   widget =HtmlField(ItemJson, map, pType, row: row);
      // else
      widget = textFieldNum(ItemJson, map, pType,show: show);
      break;

    case "password":
      // if(settingRes.formTypeShow.value)
      //   widget =HtmlField(ItemJson, map, pType, row: row);
      // else
      widget = textFieldPassword(ItemJson, map, pType,show: show);
      break;

    case "checkbox":
      widget = CheckWidget(ItemJson, map, pType,show: show);
      break;

    case "selectboxes":
      widget = formBuilderCheckboxGroup(ItemJson, map, pType,show: show);
      break;

    case "select":
      // if(settingRes.formTypeShow.value)
      //   widget =HtmlField(ItemJson, map, pType, row: row);
      // else
        widget = SelectWithOnChange(ItemJson, map, pType,enable: show);

      break;

    case "radio":
      widget = formBuilderRadioGroup(ItemJson, map, pType,show: show);
      break;

    case "button":
      widget = SizedBox();
      break;

    case "email":
      // if(settingRes.formTypeShow.value)
      //   widget = HtmlField(ItemJson, map, pType);
      // else
      widget = textFieldEmail(ItemJson, map, pType,show: show);
      break;

    case "url":
      // if(settingRes.formTypeShow.value)
      //   widget = HtmlField(ItemJson, map, pType);
      // else
      widget = textField(ItemJson, map, pType,show: show);
      break;

    case "phoneNumber":
      // if(settingRes.formTypeShow.value)
      //   widget = HtmlField(ItemJson, map, pType);
      // else
      widget = textFieldPhone(ItemJson, map, pType,show: show);
      break;

    case "tags":
      widget=SizedBox();
      break;

    case "datetime":
      // if(settingRes.formTypeShow.value)
      //   widget = HtmlFieldDate(ItemJson, map, pType);
      // else
      widget = DateTimePaker(ItemJson, map, InputType.both, ptype: pType,show: show);
      break;

    case "day":
      // if(settingRes.formTypeShow.value)
      //   widget = HtmlFieldDate(ItemJson, map, pType);
      // else
      widget = DateTimePaker(ItemJson, map, InputType.both, ptype: pType,show: show);
      break;

    case "time":
      // if(settingRes.formTypeShow.value)
      //   widget = HtmlFieldDate(ItemJson, map, pType);
      // else
      widget = DateTimePaker(ItemJson, map, InputType.time, ptype: pType,show: show);

      break;

    case "currency":
      // if(settingRes.formTypeShow.value)
      //   widget = HtmlField(ItemJson, map, pType);
      // else
      widget = textField(ItemJson, map, pType,show: show);
      break;

    case "survey":
      widget = SizedBox();
      break;

    case "hidden":
      widget = textField(ItemJson, map, pType,show: show);
      break;

    case "container":
      widget = panel(ItemJson, map,show: show);
      break;

    case "datamap":
      widget = SizedBox();
      break;

    case "datagrid":
      widget = GridDataW(ItemJson, map,show: show);
      break;

    case "editgrid":
      widget = panel(ItemJson, map,show: show);
      break;


    case 'file':
    widget = image_wedgit(ItemJson, map, pType,show: show);
    break;

    default:
      widget = SizedBox();
      break;
  }
  return widget;
}