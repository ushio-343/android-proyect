import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'login.dart';

void main() {
  runApp(MyApp()); // Ejecuta la aplicación
}

class MyApp extends StatelessWidget {
  // Clase que representa la página de inicio de sesión
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterPage(), // Muestra la página de inicio de sesión
    );
  }
}

class RegisterPage extends StatelessWidget {
  // Clase que representa la página de inicio de sesión
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  Future<void> registerUser(BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse(
            'http://100.29.86.145:3000/user/'), // Cambia esto a tu URL de API
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'name': _nameController.text,
          'last_name': _lastNameController.text,
          'password': _passwordController.text,
          'email': _emailController.text,
          'phone': _ageController.text,
        }),
      );
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Registro exitoso'),
              content: Text('Usuario registrado correctamente.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text('Cerrar'),
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text(
                  'Error al registrar el usuario. Inténtalo de nuevo: ${response.body}'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cerrar'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Error de conexión. Inténtalo de nuevo.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cerrar'),
              ),
            ],
          );
        },
      );
    }
  }

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
                child: Image.asset('assets/Logo.png'),
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Registrarme',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 20),
                  TextField(
                    controller: _nameController,
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
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      labelText: 'Apellidos',
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
                    controller: _passwordController,
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
                  SizedBox(height: 20),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        labelText: 'Correo',
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 142, 142, 142)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.purple)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        prefixIcon: Icon(Icons.email)),
                  ),
                  SizedBox(height: 20),
                  TextField(
                      controller: _ageController,
                      decoration: InputDecoration(
                          labelText: 'Telefono',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 142, 142, 142)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.purple)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.purple),
                          ),
                          prefixIcon: Icon(Icons.phone)),
                      keyboardType: TextInputType.number),
                  SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 107, 1, 213),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      registerUser(context);
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 18),
                      child: Center(
                        child: Text(
                          'Registrarse',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  ),
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
                      onPressed: () {},
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
