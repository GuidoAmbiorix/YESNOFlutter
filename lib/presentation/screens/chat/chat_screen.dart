import 'package:flutter/material.dart';
import 'package:flutterpractice/domain/entities/message.dart';
import 'package:flutterpractice/presentation/providers/chat_provider.dart';
import 'package:flutterpractice/presentation/widgets/chat/her_messages_bubbles.dart';
import 'package:flutterpractice/presentation/widgets/chat/my_messages_bubbles.dart';
import 'package:flutterpractice/presentation/widgets/shared/message_field_box.dart';
import 'package:provider/provider.dart';

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
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  controller: chatProvider.chatScrollController,
                  itemCount: chatProvider.messageList.length,
                  itemBuilder: (context, index) {
                    final message = chatProvider.messageList[index];
                    return (message.fromWho == FromWho.me)
                        ? MyMessageBubble(message: message)
                        : HerMessageBubble(
                            message: message,
                          );
                  }),
            ),
            MessageFieldBox(onValue: chatProvider.sendMessage),
          ],
        ),
      ),
    );
  }
}
