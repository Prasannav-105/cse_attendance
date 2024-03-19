import 'package:aamec_cse_attendance_app/AbsentiesNotingPage/ui/absenties_ui.dart';
import 'package:aamec_cse_attendance_app/Homepage/ui/homepage.dart';
import 'package:aamec_cse_attendance_app/loginpage/helpers/firebase_services.dart';
import 'package:aamec_cse_attendance_app/loginpage/helpers/helpers.dart';
import 'package:aamec_cse_attendance_app/shared/common_shared_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LogInPage extends StatefulWidget {
  LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  bool button = false;
  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Logo Image
            Image.asset(
              height: 400,
              Helpers.aamecLogo,
              width: double.infinity,
            ),
            //Login Text
            const Center(
              child: Text(
                "Staffs Login",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    fontSize: 18),
              ),
            ),

            const SizedBox(
              height: 15,
            ),
            //TextField For Username
            CommonWidgets.textField(
              hintText: Helpers.enterEmail,
              controller: usernameController,
            ),

            const SizedBox(
              height: 15,
            ),
            //TextField For Password

            CommonWidgets.textField(
              hintText: Helpers.enterPassword,
              controller: passwordController,
              obscuredText: true,
            ),
            const SizedBox(
              height: 15,
            ),
            // button
            CommonWidgets.customizedButton(onPressed: () async {
              await FirebaseServices.logIn(
                email: usernameController.text,
                password: passwordController.text,
              )
                  .then((user) => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (c) => HomePage())))
                  .onError(
                    (error, stackTrace) => ScaffoldMessenger.of(context)
                        .showSnackBar(
                            SnackBar(content: Text(error.toString()))),
                  );
            }),
          ],
        ),
      ),
    );
  }
}
