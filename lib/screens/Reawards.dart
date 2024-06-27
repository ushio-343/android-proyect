import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recompensas',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: ReawardsPage(),
    );
  }
}

class ReawardsPage extends StatelessWidget {
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
