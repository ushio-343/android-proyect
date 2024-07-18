import 'package:flutter/material.dart';

class MainCenter extends StatefulWidget {
  const MainCenter({super.key});

  @override
  State<MainCenter> createState() => _MainCenterState();
}

class _MainCenterState extends State<MainCenter> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

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
        title: Text('Centro de Información'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Container(
              height: 200,
              child: Image.asset('assets/ilustracion3.png'),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.person, size: 30, color: Colors.grey),
                  ),
                  SizedBox(width: 12),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Juan manuel',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Ing: Software',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Total de tareas',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TaskCard('Completado', 10, Colors.green),
                TaskCard(
                  'Pendientes',
                  5,
                  Color.fromARGB(255, 143, 54, 233),
                ),
                TaskCard('Retrasado', 0, Colors.red),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Progreso',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    height: 150,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ProgressCard(45, Colors.green),
                            SizedBox(width: 20),
                            ProgressCard(45, Color.fromARGB(255, 143, 54, 233)),
                            SizedBox(width: 20),
                            ProgressCard(45, Colors.red),
                          ],
                        )))),
          ],
        ),
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
        onTap: _onItemTapped,
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String title;
  final int count;
  final Color color;

  TaskCard(this.title, this.count, this.color);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(16),
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '$count',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}

class ProgressCard extends StatelessWidget {
  final int progress;
  final Color color;

  ProgressCard(this.progress, this.color);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 130,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white, // Necesario para que se vea la sombra
            borderRadius:
                BorderRadius.circular(10), // Ajusta según sea necesario
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                offset: Offset(0, 0), // Cambia la posición de la sombra
              ),
            ],
          ),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 80, // Tamaño del CircularProgressIndicator
                  height: 80, // Tamaño del CircularProgressIndicator
                  child: CircularProgressIndicator(
                    value: progress / 100,
                    strokeWidth: 8,
                    backgroundColor: color.withOpacity(0.2),
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                  ),
                ),
                Text(
                  '${progress}%',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
