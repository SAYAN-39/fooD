package com.example.jpa.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.jpa.model.User;

public interface UserDao extends JpaRepository<User, Integer> {
 User findByEmailAndPassword(String email,String pass);
}
