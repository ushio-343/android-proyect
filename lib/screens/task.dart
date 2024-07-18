import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return MaterialApp(
      home: Task(),
    );
  }
}

class Task extends StatefulWidget {
  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _sheduleController = TextEditingController();
  bool _isDone = false;

  Future<void> _submitForm() async {
    final String name = _nameController.text;
    final String description = _descriptionController.text;
    final String date = _dateController.text;
    final String shedule = _sheduleController.text;
    final int done = _isDone ? 1 : 0;

    final response = await http.post(
      Uri.parse('http://100.29.86.145:3000/task/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': name,
        'description': description,
        'date': date,
        'schedule': shedule,
        'done': done,
      }),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final newTask = {
        'name': name,
        'description': description,
        'date': date,
        'schedule': shedule,
        'done': done == 1,
      };
      Navigator.pop(context, newTask);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Tarea registrada exitosamente')),
      );
    } else {
      print('Error en el registro: ${response.body}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error en el registro: ${response.body}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar tarea'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nombre de la tarea'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Descripción de la tarea'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(labelText: 'Fecha de la tarea'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _sheduleController,
              decoration: InputDecoration(labelText: 'Hora de la tarea'),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text('Completada'),
                Checkbox(
                    value: _isDone,
                    onChanged: (bool? value) {
                      setState(() {
                        _isDone = value ?? false;
                      });
                    })
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 107, 1, 213),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Container(
                    width: double.infinity,
                    height: 50,
                    child: Center(
                        child: Text('Guardar',
                            style: TextStyle(
                                fontSize: 15, color: Colors.white))))),
          ],
        ),
      ),
    );
  }
}
