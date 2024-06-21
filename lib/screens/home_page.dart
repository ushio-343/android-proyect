import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 142, 13, 255),
        body: Center(
            child: Column(
          children: <Widget>[

            //imagen
            Expanded(
                flex: 6,
                child: Image.asset(
                  'assets/ilustracion1.png',
                )), //

            //Texto de bienvenida
            Text(
              '¡Hola! Organiza tus dias alcanza tus metas',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),

            //Boton de continuar y contenedor
            Spacer(flex: 1),
            Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 250, // Ajusta el ancho según sea necesario
                    height: 250,
                    decoration: BoxDecoration(
                      color: Color(0xFF6200EA), // Color del fondo del botón
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(360),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  right: 50,
                  child: Icon(
                    Icons.arrow_forward,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        )));
  }
}
