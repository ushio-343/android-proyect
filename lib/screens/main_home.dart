import 'package:flutter/material.dart';

class main_center extends StatefulWidget {
  const main_center ({super.key});

  @override
  State <main_center> createState() => _main_centerSate();
}

class _main_centerSate extends State<main_center> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'main_center',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
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
              child: Image.asset('assets/ilustracion2.png'),
            ),
            SizedBox(height: 20),
            Text(
              'Juan Manuel',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.purple),
            ),
            Text(
              'Ing. Software',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TaskCard('Completado', 10, Colors.green),
                TaskCard('Pendientes', 5, Colors.purple),
                TaskCard('Retrasado', 0, Colors.red),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProgressCard(45, Colors.green),
                ProgressCard(45, Colors.purple),
                ProgressCard(45, Colors.red),
              ],
            ),
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
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
        selectedIconTheme: IconThemeData(size: 30),
        unselectedIconTheme: IconThemeData(size: 24),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
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
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '$count',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
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
      children: <Widget>[
        Container(
          width: 80,
          height: 80,
          child: CircularProgressIndicator(
            value: progress / 100,
            strokeWidth: 8,
            backgroundColor: color.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
        SizedBox(height: 8),
        Text(
          '$progress%',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
