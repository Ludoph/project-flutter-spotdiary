import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spotidary/model/messageModel.dart';

class MessageService {
  final String baseUrl = 'http://localhost:8080/messages';

  Future<List<Message>> fetchMessages() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Message.fromJson(item)).toList();
    } else {
      throw Exception('Erreur lors de la récupération des messages');
    }
  }

  Future<Message> addMessage(Message newMessage) async {
    final response = await http.post(
      Uri.parse(baseUrl + '/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(newMessage.toJson()),
    );
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      return Message.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          'Erreur lors de l\'ajout du message: ${response.statusCode}');
    }
  }

Future<void> deleteMessage(int id) async {
  final response = await http.delete(Uri.parse(baseUrl + '/$id'));
  if (response.statusCode == 200 || response.statusCode == 204 || response.statusCode == 202) {
    // Suppression réussie (200, 204 ou 202 indiquent la suppression réussie)
  } else {
    throw Exception('Erreur lors de la suppression du message: ${response.statusCode}');
  }
}


  Future<Message> getMessageById(int id) async {
    final response = await http.get(Uri.parse(baseUrl + '/$id'));
    if (response.statusCode == 200) {
      return Message.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Erreur lors de la récupération du message');
    }
  }

  Future<Message> updateMessage(int id, Message updatedMessage) async {
    final response = await http.put(
      Uri.parse(baseUrl + '/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(updatedMessage.toJson()),
    );
    if (response.statusCode == 200) {
      return Message.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Erreur lors de la mise à jour du message');
    }
  }
}
