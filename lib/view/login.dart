import 'package:flutter/material.dart';

import '../model/student.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late List<Student> lstStudents;

  @override
  void initState() {
    super.initState();
    lstStudents = [];
  }

  @override
  void didChangeDependencies() {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    if (arguments is List<Student>) {
      lstStudents = arguments;
    }
    super.didChangeDependencies();
  }

  final meroKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var gap = const SizedBox(height: 15);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
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
                    "Sign In",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  gap,
                  TextFormField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      hintText: "Username",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter user name';
                      }
                      return null;
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
                        return 'Please enter first name';
                      }
                      return null;
                    },
                  ),
                  gap,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (meroKey.currentState!.validate()) {
                              // Find the user with matching username and password
                              Student? foundStudent;
                              for (var student in lstStudents) {
                                if (student.fname ==
                                        usernameController.text.trim() &&
                                    student.password ==
                                        passwordController.text.trim()) {
                                  foundStudent = student;
                                  break;
                                }
                              }
                              if (foundStudent != null) {
                                Navigator.pushNamed(
                                  context,
                                  '/dashboardRoute',
                                  arguments: {
                                    'student': lstStudents,
                                    'foundStudent': foundStudent
                                  },
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('User Not Registered'),
                                  ),
                                );
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 15)),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                        child: Text("Dont have account?"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/registerRoute');
                        },
                        child: const Text(
                          'Register',
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
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
