import 'package:flutter/material.dart';
import './data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {},
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Data dataService = Data();
    return Scaffold(
      appBar: AppBar(
        title: Text('Trando Technologies'),
      ),
      body: FutureBuilder<List>(
        future: dataService.getData(),
        builder: (context, snapshot) {
          print(snapshot.data);
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: ListTile(
                      title: Column(
                        children: [
                          Text('Deatils:', style: TextStyle(fontSize: 30.0)),
                          Text(snapshot.data![i]['id']),
                          Text(snapshot.data![i]['meeting_purpose']),
                          Text(snapshot.data![i]['duration']),
                        ],
                      ),
                      subtitle: Column(children: [
                        Text('Mentor Details:',
                            style: TextStyle(fontSize: 30.0)),
                        Text(
                          snapshot.data![i]['mentor']['id'],
                        ),
                        Text(
                          snapshot.data![i]['mentor']['name'],
                        ),
                        Text(
                          snapshot.data![i]['mentor']['email'],
                        ),
                        Text('User Details:', style: TextStyle(fontSize: 30.0)),
                        Text(snapshot.data![i]['user']['id']),
                      ]),
                    ),
                  );
                });
          } else {
            return const Center(
              child: Text('No Data Found'),
            );
          }
        },
      ),
    );
  }
}
