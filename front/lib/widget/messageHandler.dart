import 'package:flutter/material.dart';
import 'package:spotidary/model/messageModel.dart';
import 'package:spotidary/service/messageService.dart';

Future<void> handleDeleteMessages(
  MessageService _messageService,
  List<Message> selectedMessages,
  List<Message> messages,
  Function fetchMessages,
  BuildContext context, // Ajoutez cette ligne pour inclure le contexte
) async {
  final List<Future<void>> deleteFutures = [];

  for (final selectedMessage in selectedMessages) {
    final deleteFuture = _messageService.deleteMessage(selectedMessage.id);
    deleteFutures.add(deleteFuture);
  }

  await Future.wait(deleteFutures);

  messages.removeWhere((message) => selectedMessages.contains(message));
  selectedMessages.clear();
  fetchMessages();
}

Future<void> handleAddMessage(
  MessageService _messageService,
  TextEditingController messageController,
  Function fetchMessages,
  BuildContext context, // Ajoutez cette ligne pour inclure le contexte
) async {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Ajouter un nouveau message'),
        content: TextField(
          controller: messageController,
          decoration: InputDecoration(
            labelText: 'Message',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Annuler'),
          ),
          TextButton(
            onPressed: () async {
              final newMessage = Message(
                id: 0,
                content: messageController.text,
              );
              await _messageService.addMessage(newMessage);
              fetchMessages();
              messageController.clear();
              Navigator.of(context).pop();
            },
            child: Text('Ajouter'),
          ),
        ],
      );
    },
  );
}
