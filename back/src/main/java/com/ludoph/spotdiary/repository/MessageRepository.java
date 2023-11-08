package com.ludoph.spotdiary.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ludoph.spotdiary.model.Message;

@Repository
public interface MessageRepository extends JpaRepository<Message, Long> {

}
