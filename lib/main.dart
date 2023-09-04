
// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_options.dart';
import 'login.dart';

const kWebRecaptchaSiteKey = '6LectPsnAAAAAKYZJ0JBXjO_sKHzJ7ohPdvr6rPJ';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Activate app check after initialization, but before
  // usage of any Firebase services.
  await FirebaseAppCheck.instance
      // Your personal reCaptcha public key goes here:
      .activate(
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.debug,
    webRecaptchaSiteKey: kWebRecaptchaSiteKey,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String title = 'Firebase App Check';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase App Check',
      home: FirebaseAppCheckExample(title: title),
    );
  }
}

class FirebaseAppCheckExample extends StatefulWidget {
  FirebaseAppCheckExample({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _FirebaseAppCheck createState() => _FirebaseAppCheck();
}

class _FirebaseAppCheck extends State<FirebaseAppCheckExample> {
  final appCheck = FirebaseAppCheck.instance;
  String _message = '';
  String _eventToken = 'not yet';

  @override
  void initState() {
    appCheck.onTokenChange.listen(setEventToken);
    super.initState();
  }

  void setMessage(String message) {
    setState(() {
      _message = message;
    });
  }

  void setEventToken(String? token) {
    setState(() {
      _eventToken = token ?? 'not yet';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          // go to the login
          IconButton(
            icon: const Icon(Icons.login),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                // Use this button to check whether the request was validated on the Firebase console
                // Gets first document in collection

                // try with firebase exception to get token
                try {
                  await appCheck.getToken(true);
                } catch (e) {

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        'Error: ${e.toString()}',
                      ),
                      duration: const Duration(seconds: 3),
                      showCloseIcon: true,
                      closeIconColor: Colors.white,
                    ),
                  );
                }
                final result = await FirebaseFirestore.instance
                    .collection('flutter-tests')
                    .get();

                if (result.docs.isNotEmpty) {
                  setMessage('Document found');
                } else {
                  setMessage(
                    'Document not found, please add a document to the collection',
                  );
                }
              },
              child: const Text('Test App Check validates requests'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (kIsWeb) {
                  print(
                    'Pass in your "webRecaptchaSiteKey" key found on you Firebase Console to activate if using on the web platform.',
                  );
                }
                await appCheck.activate(
                  webRecaptchaSiteKey: kWebRecaptchaSiteKey,
                );
                setMessage('activated!!');
              },
              child: const Text('activate()'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Token will be passed to `onTokenChange()` event handler
                await appCheck.getToken(true);
              },
              child: const Text('getToken()'),
            ),
            ElevatedButton(
              onPressed: () async {
                await appCheck.setTokenAutoRefreshEnabled(true);
                setMessage('successfully set auto token refresh!!');
              },
              child: const Text('setTokenAutoRefreshEnabled()'),
            ),
            const SizedBox(height: 20),
            Text(
              _message, //#007bff
              style: const TextStyle(
                color: Color.fromRGBO(47, 79, 79, 1),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Token received from tokenChanges() API: $_eventToken', //#007bff
              style: const TextStyle(
                color: Color.fromRGBO(128, 0, 128, 1),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: WebViewApp(),
    ),
  );
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadFlutterAsset(
        'assets/webpages/index.html',
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    */
/*..loadRequest(
        Uri.parse('assets/webpages/index.html'),
      );*//*

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter WebView'),
        ),
        body: Column(
          children: [
            Text('test'),
            Expanded(
              child: WebViewWidget(
                controller: controller,
              ),
            )
          ],
        ));
  }
}

*/
