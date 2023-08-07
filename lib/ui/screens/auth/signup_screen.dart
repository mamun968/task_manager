import 'package:flutter/material.dart';
import 'package:task_manager_api/data/models/network_response.dart';
import 'package:task_manager_api/data/utils/urls.dart';

import '../../../data/services/network_caller.dart';
import '../widgets/screen_background.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lasttnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  bool _signUpInProgress = false;

  Future<void> userSignUp() async {
    if (mounted) {
      setState(() {
        _signUpInProgress = true;
      });
    }

    Map<String, dynamic> formValues = {
      "email": "_emailController.text.trim()",
      "firstName": "_firstnameController.text.trim()",
      "lastName": "_lasttnameController.text.trim()",
      "mobile": "_phoneNumberController.text.trim()",
      "password": "_passwordController.text",
      "photo": "",
    };
    NetworkResponse response =
        await NetworkCaller().postRequest(Urls.registration, formValues);

    if (mounted) {
      setState(() {
        _signUpInProgress = false;
      });
    }
    if (response.isSuccess) {
      _emailController.clear();
      _firstnameController.clear();
      _lasttnameController.clear();
      _phoneNumberController.clear();
      _passwordController.clear();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("User created successfully"),
        ));
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Registration failed!"),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScreenBackground(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 64,
                ),
                Text(
                  'Join With Us',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Email is required' : null,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'First name is required' : null,
                  controller: _firstnameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'First name',
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Last name is required' : null,
                  controller: _lasttnameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'Last name',
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  validator: (value) => value!.isEmpty || value.length < 11
                      ? 'Enter a valid phone number'
                      : null,
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: 'Mobile',
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  validator: (value) => value!.isEmpty || value.length < 4
                      ? 'Password is required'
                      : null,
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Visibility(
                    visible: _signUpInProgress == false,
                    replacement: const Center(
                      child: CircularProgressIndicator(),
                    ),
                    child: ElevatedButton(
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          userSignUp();
                        },
                        child: const Text("Sign Up")),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Have an account?",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, letterSpacing: 0.5),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Sign in')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
