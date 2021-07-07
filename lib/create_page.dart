import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController();

  final _picker = ImagePicker();
  PickedFile? _image;

  @override
  void dispose() {
    // 메모리 해제
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
          onPressed: _getImage, child: Icon(Icons.add_a_photo)),
    );
  }

  _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(onPressed: () {}, icon: Icon(Icons.send)),
      ],
    );
  }

  _buildBody() {
    return Column(
      children: [
        _image == null ? Text('No Image') : Image.file(File(_image!.path)),
        TextField(
          decoration: InputDecoration(hintText: '내용을 입력하세요.'),
          controller: textEditingController,
        )
      ],
    );
  }

  Future<void> _getImage() async {
    //Future => 비동기 처리
    PickedFile? image = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = image!;
    });
  }
}
