package com.ludoph.spotdiary.service;

import java.util.NoSuchElementException;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ludoph.spotdiary.model.Message;
import com.ludoph.spotdiary.repository.MessageRepository;

@Service
public class MessageService {
    @Autowired
    private MessageRepository messageRepository;

    public Iterable<Message> getAllMessages() {
        return messageRepository.findAll();
    }

    public Message addMessage(Message message) {
        return messageRepository.save(message);
    }

    public Message getMessageById(Long id) {
        Optional<Message> message = messageRepository.findById(id);
        if (message.isPresent()) {
            return message.get();
        } else {
            throw new NoSuchElementException("Message not found");
        }
    }

    public Message updateMessage(Long id, Message updatedMessage) {
        if (messageRepository.existsById(id)) {
            updatedMessage.setId(id); // Assurez-vous de conserver le même ID
            return messageRepository.save(updatedMessage);
        } else {
            throw new NoSuchElementException("Message not found");
        }
    }

    public void deleteMessage(Long id) {
        messageRepository.deleteById(id);
    }
}
