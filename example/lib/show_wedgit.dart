import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:form_io_builder/form_io_builder.dart';
import 'package:form_io_builder_example/contacst.dart';

class ShowWedgit extends StatefulWidget  {
  
  @override
  State<ShowWedgit> createState() => _ShowWedgitState();
}

class _ShowWedgitState extends State<ShowWedgit> with SingleTickerProviderStateMixin {
 
   TabController? _tabController;
    
    @override
  void initState() {
     _tabController= TabController(length: 2, vsync: this);
    // TODO: implement initState
    super.initState();
  }

   @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('type wedgit'),
      bottom: PreferredSize(preferredSize: Size.fromHeight(30), 
      child: TabBar(
        controller: _tabController,
        tabs:[Tab(text: 'Form',),Tab(text: 'Form Pages',) ])),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [

          FormIoBuilder(form1,'form',map: {}).FormWedgit() ,

          FormIoBuilder(wizard3,'wizard',map: {}).FormWedgit() 
      ]),
    );
  }
  


}