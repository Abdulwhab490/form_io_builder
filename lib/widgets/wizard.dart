import 'package:flutter/material.dart';
import 'package:form_io_builder/widgets/Form_widget.dart';

import '../styles/theme_app.dart';
import '../utils/utils.dart';

class Wizard extends StatefulWidget{
  final pages;
  final  operationType;
  final mapAnswers;
  final title;
  ValueChanged?  onSubmit;
   Wizard({this.pages,this.operationType,this.mapAnswers,this.title,this.onSubmit});
  @override
  State<Wizard> createState() => _WizardState();
}

class _WizardState extends State<Wizard> {
  String? currentPageId;

  final ScrollController customScrollController = ScrollController();

  Future<bool> _onWillPop() async {
 //   bool close = true;
    
      return await showDialog(
        context: context,
        builder: (context) => Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: Text("هل تريد الرجوع؟", style: ThemeApp.headline1),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('لا'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('نعم'),
              ),
            ],
          ),
        ),
      );
    
   // return close;
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<dynamic> pages = [];
 double padding=16.0;

  @override
  void initState() {
    if (widget.pages?.isNotEmpty ?? false) {
      pages = widget.pages!;
      currentPageId = widget.pages?.first['key'] ?? '0';
    }

     for (final  fields in pages){

       fields['wedgits']=FormListWedgit(fields?['components']??[], widget.mapAnswers,show: widget.operationType==OperationType.show);
                                          }
                        
                    
    super.initState();
  }

  void changePage( id) {
    setState(() {
      currentPageId = id;
      FocusScope.of(context).unfocus();
      customScrollController.animateTo(
        customScrollController.position.minScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 500),
      );
      // formKey.currentState?.
    });
  }

final GlobalKey key=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () => _onWillPop(),
        child: Scaffold(
          appBar:  AppBar(
                 centerTitle:true ,
                  backgroundColor: ThemeApp.onPrimaryColor,
                  leading: BackButton(),
                  // IconButton(
                  //     onPressed: () =>Navigator.pop(context),
                  //     icon: Icon(
                  //       Icons.arrow_back_rounded,
                  //       size: 30,
                  //       color: Colors.black.withOpacity(0.7),
                  //     )),
                    
                    title: Text(widget.title,style: ThemeApp.headline1,),
                ),
           
          backgroundColor: ThemeApp.onPrimaryColor,
          body: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomScrollView(
                controller: customScrollController,
                slivers: [
                  SliverAppBar(
                    expandedHeight: pages.length > 1 ? 120 : 60,
                    backgroundColor: ThemeApp.onPrimaryColor,
                    leading: const SizedBox.shrink(),
                    flexibleSpace: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (pages.length > 1)
                          Expanded(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: pages.map((page) {
                                return Padding(
                                  padding:
                                       EdgeInsets.all(padding),
                                  child: InkWell(
                                    onTap: () {
                                      if (pages.indexOf(pages.firstWhere(
                                              (element) =>
                                                  element['key'] == currentPageId)) >=
                                          pages.indexOf(pages.firstWhere(
                                              (element) =>
                                                  element['key'] == page['key']))) {
                                        changePage(page['key']);
                                      } else if (widget.operationType ==
                                              OperationType.show ||
                                          formKey.currentState!.validate()) {
                                        changePage(page['key']);
                                      }
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: page['key'] == currentPageId
                                          ? ThemeApp.secondaryColor
                                          : ThemeApp.primaryColor,
                                      child: Text(
                                        "${pages.indexOf(page) + 1}",
                                        style: ThemeApp.headline1.copyWith(
                                            color: ThemeApp.onPrimaryColor),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        if (pages
                            .where((element) => element['key'] == currentPageId)
                            .isNotEmpty)
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 100),
                              child: Text(
                                pages.where((element) =>
                                            element['key'] == currentPageId).firstOrNull
                                        ?['title'] ??
                                    "",
                                style: ThemeApp.headline1,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(
                        // bottom: 0),
                        bottom: MediaQuery.of(context).viewInsets.bottom * 0.5),
                    sliver: SliverList(
                        delegate: SliverChildListDelegate([
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (final  fields in pages.where((element) =>
                                            element['key'] == currentPageId))
                         ... fields['wedgits'] //FormListWedgit(fields?['components']??[], widget.map)
                        ],
                      ),
                      Row(
                        children: [
                          if (pages.where((element) =>
                                            element['key'] == currentPageId).firstOrNull !=
                                  null &&
                              pages.indexOf(pages.firstWhere(
                                      (element) => element['key'] == currentPageId)) >
                                  0)
                            Flexible(
                              child: MaterialButton(
                                onPressed: () {
                                  changePage(pages[pages.indexOf(pages.firstWhere(
                                              (element) =>
                                                  element['key'] == currentPageId)) -
                                          1]
                                      ['key']);
                                      printO('================ Pref ====== map====== ${widget.mapAnswers}');
                                },
                                
                                child:Text("السابق"),
                              ),
                            ),
                          if (pages.where((element) =>
                                            element['key'] == currentPageId).firstOrNull !=
                                  null &&
                              pages.indexOf(pages.firstWhere(
                                      (element) => element['key'] == currentPageId)) <
                                  pages.length - 1 &&
                              pages.length > 1)
                            Flexible(
                              child: ElevatedButton(
                                onPressed: () {
                                  if (widget.operationType ==
                                          OperationType.show ||
                                      formKey.currentState!.validate()) {
                                        formKey.currentState!.save();
                                        printO('================ Next ====== map====== ${widget.mapAnswers}');
                                    changePage(pages[pages.indexOf(
                                                pages.firstWhere((element) =>
                                                    element['key'] ==
                                                    currentPageId)) +
                                            1]
                                        ['key']);
                                  }
                                },
                                
                                child: Text("التالي"),
                              ),
                            ),
              
              
              
                            if (pages.where((element) =>
                                            element['key'] == currentPageId).firstOrNull !=
                                  null &&
                              pages.indexOf(pages.firstWhere(
                                      (element) => element['key'] == currentPageId)) ==
                                  pages.length-1  && widget.operationType !=
                                          OperationType.show  )
                            Flexible(
                              child: ElevatedButton(
                                onPressed: () {
                                      if (widget.operationType ==
                                          OperationType.show ||
                                      formKey.currentState!.validate()) {
                                        formKey.currentState!.save();
                                      printO('================ Pref ====== map====== ${widget.mapAnswers}');
                                       if(widget.onSubmit!=null)
                                        widget.onSubmit!(widget.mapAnswers);
                                      
                                      }
              
                                      
                                },
                                
                                child:Text("حفظ"),
                              ),
                            ),
                          
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                   
                    ])),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}