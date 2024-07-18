import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ejem/screens/task.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskCalendarScreen(),
    );
  }
}

class TaskCalendarScreen extends StatefulWidget {
  @override
  _TaskCalendarScreenState createState() => _TaskCalendarScreenState();
}

class _TaskCalendarScreenState extends State<TaskCalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  int _selectedIndex = 1;
  List<dynamic> _tasks = [];

  @override
  void initState() {
    super.initState();
    _fetchTasks();
  }

  Future<void> _fetchTasks() async {
    try {
      final response = await http.get(Uri.parse(
          'http://100.29.86.145:3000/task/')); // Cambia esto a la URL de tu API

      if (response.statusCode == 200) {
        setState(() {
          _tasks = json.decode(response.body);
        });
      } else {
        _showErrorAlertDialog(
            context, 'Error al cargar las tareas: ${response.body}');
      }
    } catch (e) {
      _showErrorAlertDialog(context, 'Error de conexión. Inténtalo de nuevo.');
    }
  }

  void _showErrorAlertDialog(BuildContext context, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(content),
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

  Future<void> _navigateToAddTask(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Task()),
    );

    if (result != null) {
      setState(() {
        _tasks.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendario de Tareas'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fecha de la tarea',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tarea pendiente',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF6200EA), // Color del fondo del botón
                        borderRadius: BorderRadius.circular(
                            30)), // Ajusta el ancho según sea necesario
                    child: IconButton(
                      onPressed: () => _navigateToAddTask(context),
                      icon: Icon(
                        Icons.add,
                        size: 40,
                        color: Colors.white,
                      ),
                    ))
              ],
            ),
            SizedBox(height: 10),
            ..._tasks.where((task) => task['done'] == false).map((task) => _taskCard(
                  task['name'] ?? 'Sin nombre',
                  task['description'] ?? 'Sin descripción',
                  task['date'] ?? 'Sin fecha',
                  task['schedule'] ?? 'Sin horario',
                  task['done'] == false ? Color.fromARGB(255, 107, 1, 213) : Colors.white,
                  task['done'] == false ? Colors.white : Colors.green,
                  overdue: task['overdue'] ?? false,
                  completed: task['done'] ?? false,
                )).toList(),
            SizedBox(height: 20),
            Text(
              'Tareas realizadas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
          ..._tasks.where((task) => task['done'] == true).map((task) => _taskCard(
                  task['name'] ?? 'Sin nombre',
                  task['description'] ?? 'Sin descripción',
                  task['date'] ?? 'Sin fecha',
                  task['schedule'] ?? 'Sin horario',
                  task['done'] == true ? Colors.white : Color.fromARGB(255, 107, 1, 213),
                  task['done'] == true ? Colors.green : Colors.white,
                  overdue: task['overdue'] ?? false,
                  completed: task['done'] ?? false,
                )).toList(),
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

  Widget _taskCard(String title, String description, String date,
      String schedule, Color color, Color textColor,
      {bool overdue = false, bool completed = false}) {
    return Card(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: textColor)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_today, size: 16, color: textColor),
                      SizedBox(width: 4),
                      Text(date, style: TextStyle(color: textColor)),
                      SizedBox(width: 16),
                      Icon(Icons.access_time, size: 16, color: textColor),
                      SizedBox(width: 4),
                      Text(schedule, style: TextStyle(color: textColor)),
                    ],
                  ),
                  if (overdue)
                    Icon(Icons.warning, color: Colors.red)
                  else if (completed)
                    Icon(Icons.check, color: Colors.green),
                ],
              )
            ],
          ),
        ));
  }
}
