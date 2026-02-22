import 'package:flutter/material.dart';
import 'package:mobile/provider/authProvider.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }
Future<void> _handleRegister(name,email,password) async {
    // Implement your register logic here, such as making an API call
    // to register the user and handling the response accordingly.
   Authprovider.register(name,email,password);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _nameController.text,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.all(Radius.circular(8.0)),

                  ),
                ),
              ),

            ),
            const Padding(padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: _emailController.text,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.all(Radius.circular(8.0)),

                  ),
                ),
              ),

            ),
            const Padding(padding: EdgeInsets.all(16.0),
              child: TextField(
                obscureText: true,
                controller: _passwordController.text,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
              ),

            ),
            const ElevatedButton(
              onPressed: () {
                _handleRegister(_emailController.text, _passwordController.text);
                // Handle register logic here
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),

    );
  }
}