import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(MyApp()); // Ejecuta la aplicación
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RecuperacionPage(), // Muestra la página de inicio de sesión
    );
  }
}

class RecuperacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          height: 350,
          child: Center(
            child: Text(
              'Recuperacion de contraseña',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Correo electronico',
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 142, 142, 142)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.purple)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.purple)),
                        prefixIcon: Icon(Icons.email)),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Contraseña nueva',
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 142, 142, 142)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.purple)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.purple)),
                        prefixIcon: Icon(Icons.lock)),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Confirmar contraseña',
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 142, 142, 142)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.purple)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.purple)),
                        prefixIcon: Icon(Icons.lock)),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 91, 26, 230),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 18),
                        child: Center(
                            child: Text('Confirmar',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18))),
                      ))
                ])),
      ],
    )));
  }
}
