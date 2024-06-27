import 'package:flutter/material.dart'; // Importa el paquete de material design
import 'package:flutter_svg/flutter_svg.dart';
import './register.dart';
import 'recuperacion.dart';
import 'Reawards.dart';

void main() {
  runApp(MyApp()); // Ejecuta la aplicación
}

class MyApp extends StatelessWidget {
  // Clase que representa la página de inicio de sesión
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(), // Muestra la página de inicio de sesión
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Container(
            height: 300,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 143, 54, 233),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(200),
                bottomRight: Radius.circular(200),
              ),
            ),
            child: Center(
              child: CircleAvatar(
                radius: 50,
                child: Text('Logo',
                    style: TextStyle(fontSize: 12, color: Colors.black)),
              ),
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(' Iniciar Sesión',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Usuario',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 142, 142, 142)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.purple)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Contraseña',
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 142, 142, 142)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.purple)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.purple),
                        ),
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
                            builder: (context) => ReawardsPage()),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 18),
                      child: Center(
                        child: Text(
                          'Iniciar Sesión',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RecuperacionPage()),
                        );
                      },
                      child: Center(
                        child: Text('¿Olvidaste tu contraseña?',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 160, 160, 160),
                              fontSize: 16,
                            )),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text('o',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal)),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 1.6,
                              )
                            ]),
                        child: IconButton(
                          icon: SvgPicture.asset('assets/Icongoogle.svg'),
                          color: Colors.blue,
                          iconSize: 40,
                          padding: EdgeInsets.all(10),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 1.6,
                              )
                            ],
                          ),
                          child: IconButton(
                            icon: SvgPicture.asset('assets/Iconface.svg'),
                            iconSize: 40,
                            padding: EdgeInsets.all(10),
                            onPressed: () {},
                          ))
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        );
                      },
                      child: Center(
                          child: Text('No tienes ninguna cuenta? Regístrate',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 160, 160, 160),
                                fontSize: 16,
                              ))))
                ]),
          ),
        ],
      )),
    );
  }
}
