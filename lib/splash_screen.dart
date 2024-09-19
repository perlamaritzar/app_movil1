import 'package:flutter/material.dart';
import 'dart:async';
import 'home_screen.dart'; // Importar la pantalla de inicio

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen(username: 'Usuario')), // Cambia según cómo manejes el usuario
      );
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Bienvenido a la App Disap1'),
            const SizedBox(height: 20),
            Image.asset('assets/splash.png'), // Asegúrate de que la imagen esté en esta ruta
          ],
        ),
      ),
    );
  }
}
