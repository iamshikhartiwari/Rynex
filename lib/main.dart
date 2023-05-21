import 'package:firebase_core/firebase_core.dart';
import 'package:rynex/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyCOqIC8iWbi_HDsK9arBOMRreeCWTUr8mM',
          appId: '1:683725442568:android:ca4a5c23b1bf533324cbbd',
          messagingSenderId: 'AAAAnzE2Tgg:APA91bFDr2X0xcLLISaSbTn_Lo40zDTyn6EacIh1icoMyYF8SnDRb6Eguxk16KCTvGd3jgwj644cF3chS9BfuCcfej_iOCuVcCoJY4t2CDT6Eq2AiG7KjTFAj4NVPh0KPq6B6qpunGEx',
          projectId: 'rynex-da0e1'));
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const SignInScreen(),
    );
  }
}
