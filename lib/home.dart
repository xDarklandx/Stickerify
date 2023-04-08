import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:image_editor_pro/image_editor_pro.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showEditButton = false;
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        showEditButton = true;
      });
    }
  }

  // void _editImage() async {
  //   final result = await Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => ImageEditorPro(
  //         appBarColor: Colors.blue,
  //         bottomBarColor: Colors.blue,
  //         backgroundColor: Colors.grey.shade300,
  //         initialImage: _image!,
  //       ),
  //     ),
  //   );
  //   if (result != null) {
  //     setState(() {
  //       _image = result;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stickerify'),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              // TODO: Implement "How to use" functionality.
            },
          ),
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () {
              // TODO: Implement "FAQ" functionality.
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 400,
            child: AnimatedOpacity(
              opacity: _image != null ? 1.0 : 0.0,
              duration: Duration(milliseconds: 200),
              child: _image != null ? Image.file(_image!) : SizedBox(),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_image == null)
                    ElevatedButton(
                      child: Text('Load Photo'),
                      onPressed: _pickImage,
                    ),
                  if (_image != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          child: Text('Edit'),
                          onPressed: () {
                            // Open photo editor
                          },
                        ),
                        ElevatedButton(
                          child: Text('Share'),
                          onPressed: () {
                            // Share image
                          },
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// <a target="_blank" href="https://icons8.com/icon/6rl9wWKSZJfX/image-upload">Image Upload</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
