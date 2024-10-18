import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:form_io_builder/styles/theme_app.dart';
import 'package:form_io_builder/widgets/textFieldwithlabel.dart';
import '../utils/iterable_extension.dart';


class SearchFieldSelect extends StatefulWidget {
  const SearchFieldSelect(
      {Key? key,
      required this.items,
      this.readOnly = false,
      this.hint,
      this.labelText,
      this.isMultiple=false,
      this.onChanged,
      this.onChangedMulti,
      this.suffixIcon,
      this.values,
      this.validator,
      this.value})
      : super(key: key);
  final List<DropItem> items;
  final Object? value;
  final String? hint;
  final String? labelText;
  final bool? isMultiple;
  final bool readOnly;
  final ValueChanged<DropItem>? onChanged;
  final ValueChanged<List<DropItem>>? onChangedMulti;
  final Widget? suffixIcon;
  final List<Object?>? values;
  final FormFieldValidator<String>? validator;

  @override
  State<SearchFieldSelect> createState() => _SearchFieldSelectState();
}

class _SearchFieldSelectState extends State<SearchFieldSelect> {
  DropItem? value;
  List<DropItem> values = [];
   initial(){
     if(widget.isMultiple!)
      values = widget.values!=null?widget.items.where((e)=> widget.values?.contains(e.value)??false).toList(): [];
     else
        value= widget.items.firstWhereOrNull((e)=>e.value==widget.value);
   }
 @override
  void initState() {
   // values = widget.values ?? [];
    initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
 
    String? title ;
    if (value?.text != null) {
      title =value?.text;
    } else if (widget.values?.isNotEmpty == true) {
      title = "${widget.values?.length} من: ${widget.items.length}";
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(widget.labelText!,
                  style: ThemeApp.headline2)),
        FormField(
          // placeHolder: widget.hint,
          // readOnly: true,
          // suffixIcon: widget.suffixIcon,
          key: Key(title??""),
          initialValue: title,
          validator: widget.validator,
          //onSaved: (value)=>,
          builder: (formFieldState) {
            return Column(
              children: [
                InkWell(
                  child: Container(
                  //  height: 50,
                    //padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:widget.isMultiple!?
                      ListTile(
                      title:  Wrap(
                        spacing: 0.0,
                        crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      verticalDirection: VerticalDirection.down,
                      alignment: WrapAlignment.start,
                      runAlignment: WrapAlignment.start,
                      runSpacing: 1.0,
                      children: [
                           for(var item in values??[])
                             ChoiceChip(label: Text('${item.text}'), selected: true)
                      ]),
                      trailing: widget.suffixIcon??SizedBox(),
                     
                    ):ListTile(
                      title:  Text('${title?? widget.hint}'),
                      trailing: widget.suffixIcon??SizedBox(),
                      
                    ) ,
                  ),
                           
                          onTap: () => showBottomSheet(context,
                    height: MediaQuery.sizeOf(context).height * 0.75,
                    child: Expanded(
                  child: Builder(builder: (context) {
                    List<DropItem> list = widget.items;
                    return StatefulBuilder(builder: (context, setStateWidget) {
                      return Column(
                        children: [
                          textFieldWithOnChange(
                              onChanged: (value) => setStateWidget(() => list =
                                  widget.items
                                      .where(
                                          (element) => element.text!.contains(value))
                                      .toList()),
                              linemax: 1,
                              suffixIcon: const Icon(Icons.search)),
                          Expanded(
                            child: ListView(
                              children: [
                                for (DropItem item in list)
                                  if (widget.isMultiple == true)
                                    CheckboxListTile(
                                      title: Text(
                                        item.text!,
                                        style:
                                            ThemeApp.headline2,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      value: values.firstWhereOrNull(
                                              (element) => element.value == item.value) !=
                                          null,
                                      onChanged: widget.readOnly
                                          ? null
                                          : (value) {
                
                                               print('============== select check item ${item.text} ============ ${values.map((e)=>e.text)} ==== bool $value===========');
                                              setStateWidget(() {
                                                if (value == true) {
                                                  values.add(item);
                                                } else {
                                                  values.removeWhere((e)=>e.value==item.value);
                                                }
                                                if (widget.onChangedMulti != null) {
                                                  widget.onChangedMulti!(values);
                                                }
                                              });
                                            },
                                      checkColor: Theme.of(context).primaryColor,
                                    )
                                  else
                                    RadioListTile<DropItem?>(
                                      groupValue: value,
                                      title: Text(
                                        item.text!,
                                        style:
                                            ThemeApp.headline2,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      value: item,
                                      onChanged: (DropItem? value) {
                                        setStateWidget(() {
                                          if (widget.onChanged != null) {
                                            this.value = value;
                                            widget.onChanged!(value!);
                                          }
                                        });
                                      },
                                      activeColor: Theme.of(context).primaryColor,
                                    )
                              ],
                            ),
                          )
                        ],
                      );
                    });
                  }),
                )),
                         ),
              
                if (formFieldState.hasError) ...[
            Container(
              color: ThemeApp.errorColor,
              height: 1,
              margin:
                  const EdgeInsets.symmetric(horizontal: 16),
            ),
            Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 16 * 1.5,
                    vertical: 16 * 0.5),
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        formFieldState.errorText!,
                        style: TextStyle(color: ThemeApp.errorColor, fontSize: 12),
                      )),
                ],
              ],
            );
         
          
          },
        )
      ],
    );
  }

  static Future<dynamic> showBottomSheet(BuildContext context,
      {double? height, Widget? child}) {
    return showModalBottomSheet(
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: context,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: height,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                color: Theme.of(context).colorScheme.onPrimary),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                        color: Theme.of(context).dividerColor,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                child ?? const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DropItem {
  String? text;
  Object? value;

  DropItem({this.text,this.value});
}
