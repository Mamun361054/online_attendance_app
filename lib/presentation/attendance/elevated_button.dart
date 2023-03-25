import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String? text;
  final Function()? onPressed;

  const ElevatedButtonWidget({Key? key, this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              backgroundColor: Colors.deepOrange),
          onPressed: onPressed,
          child: Text(
            '$text',
            style: const TextStyle(
              letterSpacing: 1,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          )),
    );
  }
}
