package com.example.jpa.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.example.jpa.model.Order;

@Repository
public interface OrderDao extends JpaRepository<Order, Integer> {
	 boolean existsByOrderID(String orderID);
}