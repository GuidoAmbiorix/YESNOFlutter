import 'package:flutter/material.dart';

class HerMessageBubble extends StatefulWidget {
  const HerMessageBubble({super.key});

  @override
  State<HerMessageBubble> createState() => _HerMessageBubbleState();
}

class _HerMessageBubbleState extends State<HerMessageBubble> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Hola Mundo',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),
        _ImageBubble(),
        const SizedBox(height: 10),
        // TODO: imagen
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        'https://yesno.wtf/assets/no/6-4bf0a784c173f70a0cab96efd9ff80c9.gif',
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 10, vertical: 5),
            child: const Text('Mi amor esta enviando un mensaje'),
          );
        },
      ),
    );
  }
}
