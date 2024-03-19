// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonWidgets {
  static Widget textField(
      {required String hintText,
      bool obscuredText = false,
      required TextEditingController controller}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.amber.withOpacity(.03),
            offset: const Offset(-5, -5),
            blurRadius: 5,
            spreadRadius: 2,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(.08),
            offset: const Offset(5, 5),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(5),
      child: TextField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(obscuredText ? 12 : 40)
        ],
        controller: controller,
        cursorColor: Colors.amber,
        obscureText: obscuredText,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "  ${hintText}",
          hintStyle: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  static Widget customizedButton(
      {required void Function()? onPressed, String text = "Login"}) {
    return SizedBox(
      width: 200,
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
            overlayColor:
                MaterialStatePropertyAll(Colors.brown.withOpacity(.2)),
            side: const MaterialStatePropertyAll(
                BorderSide(color: Colors.black, width: 2))),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.black.withOpacity(.7),
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
      ),
    );
  }

  static Widget paddedContainer(
      {required Widget child, required double padding}) {
    return Container(
      padding: EdgeInsets.all(padding),
      child: child,
    );
  }
}
