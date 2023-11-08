package com.ludoph.spotdiary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ludoph.spotdiary.model.Message;
import com.ludoph.spotdiary.service.MessageService;

@RestController
@CrossOrigin(origins = { "http://localhost:65000", "http://localhost:8080" })
public class MessageController {
    @Autowired
    private MessageService messageService;

    @GetMapping("/messages")
    public Iterable<Message> getAllMessages() {
        return messageService.getAllMessages();
    }

    @PostMapping("/messages/add")
    public Message addMessage(@RequestBody Message message) {
        return messageService.addMessage(message);
    }

    @GetMapping("/messages/{id}")
    public Message getMessageById(@PathVariable Long id) {
        return messageService.getMessageById(id);
    }

    @PutMapping("/messages/{id}")
    public Message updateMessage(@PathVariable Long id, @RequestBody Message message) {
        return messageService.updateMessage(id, message);
    }

    @DeleteMapping("/messages/{id}")
    public void deleteMessage(@PathVariable Long id) {
        messageService.deleteMessage(id);
    }
}
