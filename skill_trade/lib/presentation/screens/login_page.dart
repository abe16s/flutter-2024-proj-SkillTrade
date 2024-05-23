import 'package:flutter/material.dart';
import 'package:skill_trade/presentation/widgets/my_button.dart';
import 'package:skill_trade/presentation/widgets/my_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _selectedRole = "Customer";

  @override
  void initState() {
    super.initState();
    _selectedRole = 'Customer';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                // color: Colors.white,
                color: Theme.of(context).colorScheme.background,
                margin: const EdgeInsets.all(10),
                elevation: 20,
                shadowColor: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 70, 15, 70),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Welcome to SkillTrade Hub!",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        MyTextField(
                            labelText: "email",
                            prefixIcon: Icons.person_2_outlined,
                            suffixIcon: Icons.edit,
                            toggleText: false,
                            controller: _emailController),
                        const SizedBox(
                          height: 15,
                        ),
                        MyTextField(
                          labelText: "password",
                          prefixIcon: Icons.lock_open,
                          suffixIcon: Icons.remove_red_eye_rounded,
                          toggleText: true,
                          controller: _passwordController,
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.,
                          children: [
                            Radio<String>(
                              value: 'Customer',
                              groupValue: _selectedRole,
                              onChanged: (value) {
                                setState(() {
                                  _selectedRole = value!;
                                });
                              },
                            ),
                            const Text('Customer'),
                            // SizedBox(width: 15,),
                            Radio<String>(
                              value: 'Technician',
                              groupValue: _selectedRole,
                              onChanged: (value) {
                                setState(() {
                                  _selectedRole = value!;
                                });
                              },
                            ),
                            const Text('Technician'),
                            // SizedBox(width: 15,),
                            Radio<String>(
                              value: 'Admin',
                              groupValue: _selectedRole,
                              onChanged: (value) {
                                setState(() {
                                  _selectedRole = value!;
                                });
                              },
                            ),
                            const Text('Admin'),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MyButton(
                            text: "login",
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (_selectedRole == "Customer"){ 
                                  Navigator.pushNamed(
                                    context, "/customer");
                                } else if (_selectedRole == "Technician"){ 
                                  Navigator.pushNamed(
                                    context, "/technician");

                                } else if(_selectedRole == "Admin"){ 
                                  Navigator.pushNamed(
                                    context, "/admin");
                                }
                              }
                            },
                            width: double.infinity),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account?",
                                style: TextStyle(fontSize: 20)),
                            const SizedBox(
                              width: 8,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, "/signup");
                                },
                                child: Text("Sign up",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.purple.shade300)))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
