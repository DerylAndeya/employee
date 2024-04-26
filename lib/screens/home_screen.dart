import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
final DatabaseReference _database =
    FirebaseDatabase.instance.ref().child("Employee");

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
void addEmployee(String employeeName) {
    _database.push().set({'name': employeeName});
  }
}
  Stream<Map<String, String>> getEmployee() {
    return _database.onValue.map((event) {
      final Map<String, String> items = {};
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, value) {
          // print('Key: $key');
          // print('Value: $value');
          items[key] = value['name'] as String;
        });
      }
      return items;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
        ],
      ),
      body: const Center(
        child: Text('You have logged In!!'),
      ),
    );
  }
