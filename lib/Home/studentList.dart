import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Color/praanaColor.dart';
import '../Welcome/WelcomePage.dart';

class StudentList extends StatefulWidget {
  final String name;

  const StudentList({Key? key, required this.name}) : super(key: key);

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  CollectionReference user = FirebaseFirestore.instance.collection('Users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: height * .080,
        title: Text(
          widget.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: theme,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * .012,
            ),
            StreamBuilder(
              stream: user.where('blood-grp', isEqualTo: widget.name).snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      final DocumentSnapshot testSnap = snapshot.data.docs[index];
                      return Padding(
                        padding: EdgeInsets.fromLTRB(height * .02, height * .01,
                            height * .02, height * .01),
                        child: Container(
                          height: 85,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5), // shadow color
                                  spreadRadius: 2, // how spread the shadow should be
                                  blurRadius: 3, // how blurred the shadow should be
                                  offset: const Offset(0, 0), // offset of the shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              border: Border.all(
                                color: theme,
                                width: 3,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(testSnap.get('name'),
                                        style: TextStyle(
                                            color: theme,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w800,
                                            fontFamily: "IbarraRealNova")),
                                    const SizedBox(height: 5),
                                    Text(
                                      "${testSnap.get('gender')} (${testSnap.get('weight')} kg) - ${(DateTime.now().difference(DateTime.parse(testSnap.get('last-donated')))).inDays} Days",
                                      style: const TextStyle(
                                          fontSize: 19,
                                          fontFamily: "IbarraRealNova",
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: width * .01),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.phone,
                                      size: 30,
                                      color: theme,
                                    )),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}