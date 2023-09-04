//import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';




class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // global key for the form
  final _formKey = GlobalKey<FormState>();
  // text editing controllers
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // focus node for the password field
  final FocusNode _passwordFocusNode = FocusNode();
  // boolean to determine if the password is visible or not
  bool _isPasswordVisible = false;

  late final WebViewController controller;



  // init appcheck


 /* void callApiExample() async {
    final appCheckToken = await FirebaseAppCheck.instance.getToken();
    if (appCheckToken != null) {
      print(appCheckToken);
      final response = await http.get(
        Uri.parse("https://api-rest.bryce-kaddouri.com/produits/lire.php"),
        headers: {"HTTP_X_FIREBASE_APPCHECK": appCheckToken},
      );
      print('-' * 100);
      print(response.statusCode);
      print('-' * 100);
    } else {
      // Error: couldn't get an App Check token.
    }
  }*/

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadFlutterAsset(
        'assets/webpages/index.html',
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase App Check'),
      ),
      body:
      Container(
        margin: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Phone Number',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                focusNode: _passwordFocusNode,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),


              SizedBox(height: 16),
          Expanded(
            child: WebViewWidget(
              controller: controller,
            ),
          ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: () async {
                  // hide the keyboard - if it is not already hidden
                  FocusScope.of(context).unfocus();
                  if (_formKey.currentState!.validate()) {
                   print('test');

                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Error: App check failed'),
                      ),
                    );
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






