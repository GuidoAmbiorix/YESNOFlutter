import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(20));

    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.send_outlined),
        ),
      ),
    );
  }
}
