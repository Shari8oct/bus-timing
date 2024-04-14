import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class BUSTiming {
  String campus;
  String day;
  String time;

  BUSTiming({required this.campus, required this.day, required this.time});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BUS ROUTE Timings',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BUSTimingsPage(),
    );
  }
}

class BUSTimingsPage extends StatefulWidget {
  @override
  _BUSTimingsPageState createState() => _BUSTimingsPageState();
}

class _BUSTimingsPageState extends State<BUSTimingsPage> {
  List<BUSTiming> BUSTimings = [
    BUSTiming(campus: 'Abasia', day: 'Monday', time: '9:00 AM - 5:00 PM'),
    BUSTiming(campus: 'Abasia', day: 'Tuesday', time: '9:00 AM - 5:00 PM'),
    BUSTiming(campus: 'Abasia', day: 'Wednesday', time: '9:00 AM - 5:00 PM'),
    BUSTiming(campus: 'Bagdad', day: 'Monday', time: '9:00 AM - 5:00 PM'),
    BUSTiming(campus: 'Bagdad', day: 'Tuesday', time: '9:00 AM - 5:00 PM'),
    BUSTiming(campus: 'Bagdad', day: 'Wednesday', time: '9:00 AM - 5:00 PM'),
    BUSTiming(
        campus: 'Khawja Fareed', day: 'Monday', time: '9:00 AM - 5:00 PM'),
    BUSTiming(
        campus: 'Khawja Fareed', day: 'Tuesday', time: '9:00 AM - 5:00 PM'),
    BUSTiming(
        campus: 'Khawja Fareed', day: 'Wednesday', time: '9:00 AM - 5:00 PM'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BUS ROUTE Timings'),
      ),
      body: ListView.builder(
        itemCount: BUSTimings.length,
        itemBuilder: (context, index) {
          return ListTile(
            title:
                Text('${BUSTimings[index].campus} - ${BUSTimings[index].day}'),
            subtitle: Text(BUSTimings[index].time),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Implement edit functionality
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Implement delete functionality
                    setState(() {
                      BUSTimings.removeAt(index);
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement add timing functionality
          showDialog(
            context: context,
            builder: (BuildContext context) {
              String newCampus = '';
              String newDay = '';
              String newTime = '';
              return AlertDialog(
                title: Text('Add Timing'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Campus'),
                      onChanged: (value) {
                        newCampus = value;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Day'),
                      onChanged: (value) {
                        newDay = value;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Time'),
                      onChanged: (value) {
                        newTime = value;
                      },
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      // Add new timing
                      setState(() {
                        BUSTimings.add(BUSTiming(
                            campus: newCampus, day: newDay, time: newTime));
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
