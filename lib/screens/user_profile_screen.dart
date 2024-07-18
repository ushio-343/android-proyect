import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  int _selectedIndex = 3;

  void _onItemTapped(BuildContext context, int index) {
    _selectedIndex = index;

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/main_center');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/task_calendar');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/rewards');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/user_profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil de Usuario'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            height: 350,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: const Color.fromRGBO(167, 71, 250, 1),
            ),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                          radius: 50,
                          child: Icon(Icons.person,
                              size: 50,
                              color: const Color.fromARGB(255, 0, 0, 0))
                          //backgroundImage: AssetImage('assets/profile.png'), // Asegúrate de tener una imagen de perfil en tus assets
                          ),
                      SizedBox(height: 16),
                      Text(
                        'Juan Manuel',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      // El botón se mueve fuera de aquí
                    ],
                  ),
                ),
                Positioned(
                  top: 0, // Ajusta estos valores según necesites
                  right: 0, // Ajusta estos valores según necesites
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Editar perfil',
                        style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 107, 1, 213),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 32),
          Expanded(
              child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 6),
            children: <Widget>[
              _profileOption(Icons.lock, 'Contraseña'),
              _profileOption(Icons.email, 'Correo'),
              _profileOption(Icons.phone, 'Teléfono'),
              _profileOption(Icons.exit_to_app, 'Cerrar sesión'),
            ],
          )),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Tareas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Recompensas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 107, 1, 213),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
        selectedIconTheme: IconThemeData(size: 30),
        unselectedIconTheme: IconThemeData(size: 24),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        onTap: (index) => _onItemTapped(context, index),
      ),
    );
  }

  Widget _profileOption(IconData icon, String title) {
    return Card(
      child: ListTile(
        leading: Icon(
          icon,
          color: Color.fromARGB(255, 107, 1, 213),
        ),
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Lógica para cada opción del perfil
        },
      ),
    );
  }
}
