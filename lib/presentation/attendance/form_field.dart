import 'package:flutter/material.dart';

class FromField extends StatelessWidget {
  final Function(String)? onChanged;
  final String? title;
  final String? hintText;
  final IconButton? suffixIcon;
  final Icon? prefixIcon;
  const FromField(
      {Key? key,
      this.hintText,
      this.title,
      this.suffixIcon,
      this.prefixIcon,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '$title',
                  style: const TextStyle(
                      letterSpacing: 1,
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
                const Text(
                  '*',
                  style: TextStyle(
                      letterSpacing: 1,
                      color: Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              cursorColor: Colors.deepOrange,
              onChanged: onChanged,
              validator: (val) => val!.isEmpty ? 'Filed must be filled': null,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: Colors.deepOrange, width: 1.0),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 16),
                  hintText: '$hintText',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  suffixIcon: suffixIcon,
                  prefixIcon: prefixIcon,
                  hintStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400),
                  border: const OutlineInputBorder()),
            )
          ],
        ),
      ),
    );
  }
}
