import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class HomeScreen extends StatefulWidget {
  final String username;

  HomeScreen({required this.username});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _image; // Variable para almacenar la imagen seleccionada

  // Método para tomar una foto usando la cámara
  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      final savedImage = await _saveImageToApp(pickedFile.path);
      setState(() {
        _image = savedImage;
      });
    }
  }

  // Método para guardar la imagen en el directorio de la aplicación
  Future<File> _saveImageToApp(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File(imagePath);
    final savedImage = await image.copy('${directory.path}/$name');
    return savedImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla de Inicio'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '¡Bienvenido ${widget.username}!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            _image != null
                ? Image.file(
                    _image!,
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  )
                : Text('No hay imagen seleccionada.'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _takePicture,
              child: Text('Tomar una Foto'),
            ),
          ],
        ),
      ),
    );
  }
}
