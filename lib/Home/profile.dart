import 'package:flutter/material.dart';

import '../Color/praanaColor.dart';
import '../HomeReusable/ProfileContainer.dart';
import '../Welcome/WelcomePage.dart';
import 'editProfile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: height * .080,
          title: const Text(
            "Profile",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, ),
          ),
          centerTitle: true,
          backgroundColor: theme,
          actions: [Padding(
            padding: const EdgeInsets.fromLTRB(0,0,10,0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfile(),
                    ));
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height*.05,
              ),
              CircleAvatar(
                radius: width*.25,
                backgroundColor: theme,
                child: Icon(Icons.add_a_photo,size: width*.15,color: background),
              ),
              const SizedBox(height: 20,),
              profileShow("Name","name"),
              divider(),
              profileShow("Phone Number","phone"),
              divider(),
              profileShow("Email","email"),
              divider(),
              profileShow("Date of Birth","dob"),
              divider(),
              profileShow("Blood Group","blood-grp"),
              divider(),
              profileShow("Last Donated","last-donated"),
              divider(),
              profileShow("Weight","weight"),
              divider(),
              profileShow("Gender","gender"),
              const SizedBox(height: 20,)
            ],
          ),
        ));
  }
}