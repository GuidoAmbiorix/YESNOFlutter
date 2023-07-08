import 'package:flutter/material.dart';
import 'package:flutterpractice/presentation/widgets/chat/her_messages_bubbles.dart';
import 'package:flutterpractice/presentation/widgets/chat/my_messages_bubbles.dart';
import 'package:flutterpractice/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://styles.redditmedia.com/t5_2thys/styles/communityIcon_w1ag5is945881.jpg?width=256&s=7cb70452ccd0e5415a4f8b65e2231acd2bc4304b'),
          ),
        ),
        title: const Text('Mi amor'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return (index % 2 == 0)
                        ? const HerMessageBubble()
                        : const MyMessageBubble();
                  }),
            ),
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
