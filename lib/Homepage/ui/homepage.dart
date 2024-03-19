import 'package:aamec_cse_attendance_app/AbsentiesNotingPage/helpers/absenties_helper.dart';
import 'package:aamec_cse_attendance_app/AbsentiesNotingPage/ui/absenties_ui.dart';
import 'package:aamec_cse_attendance_app/FormPage/ui/subdetails_page.dart';
import 'package:aamec_cse_attendance_app/loginpage/helpers/firebase_services.dart';
import 'package:aamec_cse_attendance_app/shared/common_shared_components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final user = FirebaseAuth.instance.currentUser;
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: key,
        appBar: AppBar(
          title: const Text(
            "H O M E P A G E",
            style:
                TextStyle(color: Colors.white, fontSize: 16, letterSpacing: 2),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              key.currentState!.openDrawer();
            },
          ),
          backgroundColor: const Color.fromARGB(255, 3, 3, 63),
        ),
        drawer: Drawer(
          backgroundColor: const Color.fromARGB(235, 9, 9, 94),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              CommonWidgets.paddedContainer(
                  child: const Center(
                    child: Text(
                      "AAMEC CSE",
                      style: TextStyle(
                          color: Colors.white, fontSize: 20, letterSpacing: 2),
                    ),
                  ),
                  padding: 5),
              const SizedBox(
                height: 10,
              ),
              CommonWidgets.paddedContainer(
                  child: const FittedBox(
                    child: Text(
                      "Logged as : example@gmail.com",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  padding: 10),
              CommonWidgets.paddedContainer(
                  child: const FittedBox(
                    child: Text(
                      "Username : Username",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  padding: 10),
              const Spacer(),
              const Center(
                  child: Text(
                "Sign out",
                style: TextStyle(color: Colors.white),
              )),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: IconButton(
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    await FirebaseServices.logOut();
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: GridView.builder(
              itemCount: 1,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1 / 1.5),
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color.fromARGB(255, 166, 0, 255),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.1),
                            blurRadius: 10,
                            offset: const Offset(-5, -5))
                      ]),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EnterDetailsPage(),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/attendance.png"),
                        const Text(
                          "Mark Attendance",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
