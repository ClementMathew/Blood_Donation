import 'package:blood_donation/Home/editProfile.dart';
import 'package:blood_donation/Home/callProfile.dart';
import 'package:blood_donation/SplashScreen.dart';
import 'package:blood_donation/Welcome/WelcomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'Home/callProfileEdit.dart';
import 'Provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  // system chrome helps us to implement fullscreen for our app
  // for fullscreen mode edit the styles.xml in both values
  // now for fixed portrait  orientation only
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) async {
    await Firebase.initializeApp(
        name: "Praana",
        options: const FirebaseOptions(
            apiKey: "AIzaSyCgUGkV2sLvbdrvuGzpIjGmI4xerPXzesQ",
            appId: "1:118563119986:web:70b765fa7cf3a2695ef3eb",
            messagingSenderId: "118563119986",
            projectId: "praana-61496"));
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TagProvider(),
        child:  MaterialApp(
            routes: {
              '/edit': (context) => const EditProfile(),
              '/call-edit': (context) => const CallEditProfile(),
            },
            debugShowCheckedModeBanner: false,
            title: 'Blood Donation',
            home: const SplashScreen()));
  }
}