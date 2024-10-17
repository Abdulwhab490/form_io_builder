import 'dart:io';
import 'package:flutter/material.dart';
import 'package:form_io_builder/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dio/dio.dart';

import '../styles/theme_app.dart';

class MultiFileUploader extends StatefulWidget {
  var Item;
  Map<String,dynamic>? map;
   List<FileUplaod> images;
   bool show;
  MultiFileUploader(this.Item,this.map,this.images,{this.show= false});
  @override
  _MultiFileUploaderState createState() => _MultiFileUploaderState();
}

class _MultiFileUploaderState extends State<MultiFileUploader> {
   List<FileUplaod> _files=[] ;
  final ImagePicker _imagePicker = ImagePicker();
  double _uploadProgress = 0;

  void _showFilePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.image),
                title: Text('Pick Images'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImages();
                },
              ),
              ListTile(
                leading: Icon(Icons.file_present),
                title: Text('Pick Files'),
                onTap: () {
                  Navigator.pop(context);
                  _pickFiles();
                },
              ),
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Capture Image from Camera'),
                onTap: () {
                  Navigator.pop(context);
                  _captureImage();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickFiles() async {
    final pickedFiles = await FilePicker.platform.pickFiles(allowMultiple: true);
    
    if (pickedFiles != null) {
      setState(() {
        for (var file in pickedFiles.paths) {
          if (file != null) {
            _files.add(FileUplaod(file: File(file)));
          }
        }
      });
    }
  }

  Future<void> _pickImages() async {
    final pickedFiles = await _imagePicker.pickMultiImage();
    if (pickedFiles != null) {
      setState(() {
        for (var file in pickedFiles) {
          _files.add(FileUplaod(file: File(file.path)));
        }
      });
    }
  }

  Future<void> _captureImage() async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
       
        _files.add(FileUplaod(file: File(pickedFile.path)));
      });
    }
  }

  Future<void> _uploadFiles() async {
    Dio dio = Dio();
    String url = widget.Item['url']; // Replace with your server URL

    for (var file in _files) {
      //String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(file.file!.path, filename: file.fileName),
      });
        file.status=statusUpload.uploading;
      // Uploading with progress
      try {
        var response = await dio.post(
          url,
          data: formData,
          onSendProgress: (sent, total) {
            setState(() {
              _uploadProgress = sent / total;
              file.progress= sent / total;

            });
          },
        );

        // Store the returned path from the server
        if (response.statusCode == 200) {
          //_uploadedPaths.add(response.data['path']);
           // Adjust based on your server response
           file.status=statusUpload.uploaded;
           file.onlinePath=response.data['path'];
        }else{
           print('==========Upload failed:===== ${response.statusCode}============= erroe ${response.data}');
            file.status=statusUpload.error;
            setState(() {
              
            });
        }
      } catch (e) {
        print('Upload failed: $e');
        file.status=statusUpload.error;
        setState(() {
              
            });
      }
    }

    // Reset progress after upload
    setState(() {
      _uploadProgress = 0;
    });

   // fieldFormkey.didChange(_files.where((e)=> e.status==statusUpload.uploaded).map((e)=>e.onlinePath));

  }

  void _removeFile(file) {
    setState(() {
      _files.remove(file);
    });
  }


  void initilaze(){
    //  widget.map?[widget.Item['key']].map((e)=>_files.add(FileUplaod(onlinePath: e)));
     _files=widget.images;
  }

  @override
  void initState() {
    // TODO: implement initState
    initilaze();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return 
       Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormField(
          initialValue: widget.map?[widget.Item['key']],
          builder: (FormFieldState<dynamic> formFieldState) {  
          return Column(
            children: [
              // ElevatedButton(
              //   onPressed: _showFilePickerOptions,
              //   child: Text('Select File/Image'),
              // ),
               if (_files.isNotEmpty && !widget.show)
               ...[
                ElevatedButton(
                onPressed: _uploadFiles,
                child: Text('Upload Files'),
              ),
            
              SizedBox(height: 20)],
              
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  
                  child: Wrap(
                            
                          spacing: 0.0,
                           crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                         verticalDirection: VerticalDirection.down,
                          alignment: WrapAlignment.start,
                          runAlignment: WrapAlignment.start,
                          runSpacing: 1.0,
                          children: [
                            if (_files.isNotEmpty)
                             for(var file in _files)
                              Container(
                      height: 140,
                      width: 120,
                      margin: const EdgeInsetsDirectional.only(
                          end: 16),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(8),
                          border: Border.all(color: ThemeApp.borderColor)),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(8),
                        
                                child: _ImageWidget(fileUplaod: file,image: file.file!.path,onTap:()=> _removeFile(file),
                                isReadOnly:widget.show,),
                              )),
                            
                       
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child:InkWell(
                                
                                  onTap:widget.show?null:  _showFilePickerOptions,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                         children: [
                                           Container(
                                               padding: EdgeInsets.all(10),
                                               decoration: BoxDecoration(
                                                 color: ThemeApp.borderColor,
                                                 borderRadius: BorderRadius.all(Radius.circular(12)),
                                               ),
                                               child: Icon(Icons.cloud_upload_sharp,color: ThemeApp.primaryColor,)),
                                                           
                                           SizedBox(width: 10,),
                                                           
                                           Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                                           
                                             Text('${widget.Item['label']??'attachments'}',style:ThemeApp.headline1 ,),
                                                           
                                                           
                                           Text('Upload_files_or_photos',style: ThemeApp.headline2,),
                                             ],
                                           ),
                                         ],
                                       ),
                                ),
                              ),
                                 
                            ],
                          ),
                ),
              SizedBox(height: 20),
              if (_uploadProgress > 0)
                LinearProgressIndicator(value: _uploadProgress),

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
         onSaved: (value){

          widget.map?[widget.Item['key']]= _files.where((e)=>e.status==statusUpload.uploaded).map((es)=>es.onlinePath).toList()??[];
         },
         validator: (value){

             if (widget.Item['validate'] != null &&
                          widget.Item['validate']['required'] != null &&
                          widget.Item['validate']['required'])
                 {
                    if(_files.isEmpty)
                     {
                       return  widget.Item['validate']['customMessage']??'Field is Required';
                       
                    }
                    
                    if( _files.any((e)=>e.status!=statusUpload.uploaded))
                    {
                      return 'Some Image not upload to server';
                    }
                 }

                 if( _files.any((e)=>e.status!=statusUpload.uploaded))
                    {
                      return 'Some Image not upload to server';
                    }

              return null;            
                       
         },
         ),
      )
  ;
  }
}



enum statusUpload{ initi,uploading, uploaded, error}
class FileUplaod{

  File? file;
  String? fileName;
  statusUpload status;
  String? onlinePath;
  double progress;
  FileUplaod({this.file, this.status=statusUpload.initi,this.onlinePath,this.progress=0})
  :fileName=file?.path.split('/').last;
}



class _ImageWidget extends StatelessWidget {
  const _ImageWidget(
      {Key? key,
      required this.image,
      required this.onTap,
      required this.isReadOnly,
      required this.fileUplaod
      })
      : super(key: key);

  final String image;
  final GestureTapCallback onTap;
  final bool isReadOnly;
  final FileUplaod fileUplaod;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      fit: StackFit.loose,
      children: [
        InkWell(
          onTap: () => showDialog(
              context: context,
              builder: (context) => _ShowImageDialog(image: image)),
          child: //Image.memory(base64Decode(image)
          Image.file(File(image),
              key: GlobalKey(),
              fit: BoxFit.cover,
              height: double.infinity,
              width:double.infinity),
        ),
        InkWell(
          onTap: isReadOnly
              ? null
              : () async {
                  showDialog(
                    context: context,
                    builder: (context) => Directionality(
                      textDirection: TextDirection.rtl,
                      child: AlertDialog(
                        title: const Text('هل أنت واثق؟'),
                        content: const Text('هل تريد حذف هذه الصورة'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: const Text('لا'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: const Text('نعم'),
                          ),
                        ],
                      ),
                    ),
                  ).then((value) {
                    if (value) {
                      onTap();
                    }
                  });
                },
          child: Container(
            alignment: Alignment.center,
            height: 40,
            color: ThemeApp.errorColor,
            child: Icon(
              Icons.delete,
              color: ThemeApp.onPrimaryColor,
            ),
          ),
        ),
        if(fileUplaod.status==statusUpload.uploaded)
        Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundColor: Colors.black26,
                      child: Icon(Icons.check_circle, color: Colors.green)),
                  ),
       
        if(fileUplaod.status==statusUpload.uploading)
         Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: LinearProgressIndicator(borderRadius: BorderRadius.circular(5),
                      value: fileUplaod.progress,
                      color: ThemeApp.primaryColor,
                    //  backgroundColor: Colors.black87,
                      minHeight: 10,
                      ),
                    ),
                  ),
         
         if(fileUplaod.status==statusUpload.initi)
         Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundColor: Colors.black26,
                      child: Icon(Icons.file_upload_outlined,color: ThemeApp.onPrimaryColor,)),
                  ),

        if(fileUplaod.status==statusUpload.error)
         Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundColor: Colors.black26,
                      child: Icon(Icons.file_upload_off,color: ThemeApp.errorColor,)),
                  ),


      ],
    );
  }
}

class _ShowImageDialog extends StatelessWidget {
  const _ShowImageDialog({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AlertDialog(
      actions: [
        Center(
          child:Image.file(File(image),
             height: size.height * 0.3,
            width: size.width,
          )
          //  Image.memory(
          //   base64.decode(image),
          //   height: size.height * 0.3,
          //   width: size.width,
          // ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child:Text("إغلاق"),
          ),
        )
      ],
    );
  }
}