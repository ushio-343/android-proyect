import 'package:flutter/material.dart';

class RewardsPage extends StatefulWidget {
  @override
  _RewardsPageState createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  int _selectedIndex = 2;

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
        title: Text('Recompensas'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                'Completa desafíos para ganar cupones',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.emoji_events, size: 50, color: Colors.purple),
                  SizedBox(width: 16),
                  Icon(Icons.emoji_events, size: 50, color: Colors.purple),
                  SizedBox(width: 16),
                  Icon(Icons.verified, size: 50, color: Colors.purple),
                ],
              ),
            ),
            SizedBox(height: 32),
            Text(
              'Desafío del día',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ChallengeCard(
              title: 'Asigna 3 nuevas tareas a tu agenda',
              currentProgress: 1,
              totalProgress: 3,
            ),
            SizedBox(height: 32),
            Text(
              'Desafío semanal',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ChallengeCard(
              title: 'Completa 5 Actividades',
              currentProgress: 0,
              totalProgress: 5,
            ),
            SizedBox(height: 8),
            ChallengeCard(
              title: 'Completa 4 desafíos del día',
              currentProgress: 0,
              totalProgress: 4,
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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
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

class ChallengeCard extends StatelessWidget {
  final String title;
  final int currentProgress;
  final int totalProgress;

  ChallengeCard({
    required this.title,
    required this.currentProgress,
    required this.totalProgress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            LinearProgressIndicator(
              value: currentProgress / totalProgress,
              backgroundColor: Colors.grey[200],
              color: Colors.purple,
            ),
            SizedBox(height: 8),
            Text('$currentProgress/$totalProgress'),
          ],
        ),
      ),
    );
  }
}
