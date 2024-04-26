import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:employee/screens/home_screen.dart';
final TextEditingController _controller = TextEditingController();
final HomeScreen _homeScreen = HomeScreen();
class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Tambah Karyawan'),
    ),
    body: Column(
    children: [
    Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
    children: [
      Expanded(
    child: TextField(
    controller: _controller,
    decoration:
    const InputDecoration(hintText: 'Masukkan Nama Pegawai'),
    ),
    ),
    IconButton(
      icon: const Icon(Icons.add),
    onPressed: () {
        _homeScreen.addEmployee(_controller.text);
        _controller.clear();
    },
    ),
    ],
    ),
    ),

    ],
    ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

