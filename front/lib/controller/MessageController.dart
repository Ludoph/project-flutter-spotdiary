import 'package:flutter/material.dart';
import 'package:spotidary/model/messageModel.dart';
import 'package:spotidary/service/messageService.dart';
import 'package:spotidary/widget/messageHandler.dart'; // Importez le fichier de gestion des actions

class MessagePage extends StatefulWidget {
  MessagePage({super.key});

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final MessageService _messageService = MessageService();
  List<Message> messages = [];
  List<Message> selectedMessages = [];
  final TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchMessages();
  }

  Future<void> fetchMessages() async {
    final messages = await _messageService.fetchMessages();
    setState(() {
      this.messages = messages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 100,
        title: Text('Proxi CV'),
      ),
      body: Column(
        children: [
          Container(
            child: Text('Candidat en cours de processus'),
            height: 100,
            alignment: Alignment.center,
          ),
          DataTable(
            columns: [
              DataColumn(label: Text('Nom')),
            ],
            rows: messages.map((message) {
              final isSelected = selectedMessages.contains(message);
              return DataRow(
                selected: isSelected,
                onSelectChanged: (isSelected) {
                  setState(() {
                    if (isSelected != null) {
                      if (isSelected) {
                        selectedMessages.add(message);
                      } else {
                        selectedMessages.remove(message);
                      }
                    }
                  });
                },
                cells: [
                  DataCell(Text(message.content)),
                ],
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  handleDeleteMessages(
                    _messageService,
                    selectedMessages,
                    messages,
                    fetchMessages,
                    context,
                  );
                },
              ),
              SizedBox(width: 40),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  handleAddMessage(
                    _messageService,
                    messageController,
                    fetchMessages,
                    context,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
