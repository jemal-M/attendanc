import 'package:flutter/material.dart';
import 'package:mobile/provider/authProvider.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {,
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }
Future<void> _handleLogin(email,password) async {
    // Implement your login logic here, such as making an API call
    // to authenticate the user and handling the response accordingly.
    Authprovider.login(email,password);
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
                controller: _emailController.text,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.all(Radius.circular(8.0)),

                  ),
                ),
              ),

            ),
            Padding(padding: const EdgeInsets.all(16.0),
              child: TextField(
                obscureText: true,
                controller: _passwordController.text,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
              ),

            ),
            const ElevatedButton(
              onPressed: () {
                _handleLogin(_emailController.text, _passwordController.text);
                // Handle login logic here
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),

    );
  }
}