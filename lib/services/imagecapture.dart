import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:mydonationapp/globals.dart' as global;

class ImageCapture extends StatefulWidget {
  createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  /// Active image file
  File _imageFile;
  bool loading = false;

  /// Cropper plugin
  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
        sourcePath: _imageFile.path,
        // ratioX: 1.0,
        // ratioY: 1.0,
        // maxWidth: 512,
        // maxHeight: 512,
        toolbarColor: Colors.purple,
        toolbarWidgetColor: Colors.white,
        toolbarTitle: 'Crop It');

    setState(() {
      _imageFile = cropped ?? _imageFile;
    });
  }

  final FirebaseStorage _storage =
      FirebaseStorage.instanceFor(bucket: 'gs://donationapp-89333.appspot.com');

  Future<String> _startUpload(file) async {
    /// Unique file name for the file
    String fileName = DateTime.now().toString();
    String filePath = 'images/${fileName}.png';
    await _storage.ref().child(filePath).putFile(file);
    print(' THis is File name ..........images/${fileName}.png');
    var ref =
        await Future.value(_storage.ref().child("images/" + fileName + ".png"));
    return await ref.getDownloadURL();
  }

  /// Select an image via gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }

  /// Remove image
  void _clear() {
    setState(() => _imageFile = null);
  }

  @override
  Widget build(BuildContext context) {
    // final globaldata = Provider.of<GlobalData>(context);
    return Scaffold(
      // Select an image from the camera or gallery
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.photo_camera),
              onPressed: () => _pickImage(ImageSource.camera),
            ),
            IconButton(
              icon: Icon(Icons.photo_library),
              onPressed: () => _pickImage(ImageSource.gallery),
            ),
          ],
        ),
      ),

      // Preview the image and crop it
      body: loading == true
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: <Widget>[
                if (_imageFile != null) ...[
                  Image.file(_imageFile),
                  Row(
                    children: <Widget>[
                      FlatButton(
                        child: Icon(Icons.crop),
                        onPressed: _cropImage,
                      ),
                      FlatButton(
                        child: Icon(Icons.refresh),
                        onPressed: _clear,
                      ),
                    ],
                  ),
                  // Uploader(file: _imageFile)
                  FlatButton.icon(
                    label: Text('Upload to Firebase'),
                    icon: Icon(Icons.cloud_upload),
                    onPressed: () async {
                      setState(() {
                        loading = true;
                      });
                      global.imgurl = await _startUpload(_imageFile);
                      await global.userinst.update({"img": global.imgurl});
                      setState(() {
                        loading = false;
                      });
                      Navigator.pop(context);
                    },
                  ),
                ]
              ],
            ),
    );
  }
}
