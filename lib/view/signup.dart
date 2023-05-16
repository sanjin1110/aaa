import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../model/student.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final meroKey = GlobalKey<FormState>();
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final ageController = TextEditingController();
  final passwordController = TextEditingController();
  String? gender;
  var gap = const SizedBox(height: 15);

  List<Student> lstStudents = [];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Form(
        key: meroKey,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  gap,
                  TextFormField(
                    controller: fnameController,
                    decoration: const InputDecoration(
                      hintText: "First Name",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter first name';
                      }
                      return null;
                    },
                  ),
                  gap,
                  TextFormField(
                    controller: lnameController,
                    decoration: const InputDecoration(
                      hintText: "Last Name",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter last name';
                      }
                      return null;
                    },
                  ),
                  gap,
                  TextFormField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Age",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter age';
                      }
                      return null;
                    },
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Select gender'),
                  ),
                  RadioListTile(
                    title: const Text('Male'),
                    value: 'Male',
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Female'),
                    value: 'Female',
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Others'),
                    value: 'Others',
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value;
                      });
                    },
                  ),
                  
                  gap,
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                  ),
                  gap,
                  ElevatedButton(
                    onPressed: () {
                      if (meroKey.currentState!.validate()) {
                        String studentidno = const Uuid().v4();
                        Student student = Student(
                          studentId: studentidno,
                          fname: fnameController.text,
                          lname: lnameController.text,
                          password: passwordController.text,
                          age: int.parse(ageController.text.trim()),
                          gender: gender!,
                          dueAmount: 20000,
                        );

                        lstStudents.add(student);

                        showDialog(
                          context: context,
                          builder: (BuildContext dialogContext) {
                            return AlertDialog(
                              title: const Text('Registration Successful'),
                              content: const Text(
                                  'User has been registered successfully.'),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/loginRoute',
                                        arguments: lstStudents);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text("Register"),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                        child: Text("Already have account?"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/loginRoute',
                              arguments: lstStudents);
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    fnameController.dispose();
    lnameController.dispose();
    ageController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
