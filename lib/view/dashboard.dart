import 'package:flutter/material.dart';

import '../model/student.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  List<Student>? lstStudents;
  late Student foundStudent;
  @override
  void didChangeDependencies() {
    Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    lstStudents = arguments['student'] as List<Student>;
    foundStudent = arguments['foundStudent'] as Student;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fee Management System")),
      body: Column(
        children: [
          Center(
            child: Text(
                "${foundStudent.fname}'s due amount is :${foundStudent.dueAmount}"),
          ),
          Center(
            child: ElevatedButton(
              child: const Text("Pay"),
              onPressed: () {
                foundStudent.dueAmount = 0;
                setState(() {});
              },
            ),
          )
        ],
      ),
    );
  }
}
