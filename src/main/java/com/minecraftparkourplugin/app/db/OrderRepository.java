package com.minecraftparkourplugin.app.db;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * This is our Repository Interface
 * TODO: Set up queries
 */
public interface OrderRepository extends JpaRepository<Order, Integer> {

  @Query("SELECT o FROM Order o WHERE o.userId = :userid")
  List<Order> getOrderByUserId(@Param("userid")int userid);

  @Query("SELECT o FROM Order o WHERE o.orderId = :orderid")
  List<Cart> getOrderByOrderId(@Param("orderid")int orderid);

  List<Order> getOrdersByUserIdAndDatasetId(int userid, int datasetid);

  @Query("SELECT o FROM Order o WHERE o.orderId = :orderid")
  List<Order> getOrdersByOrderId(@Param("orderid") int orderid);

}
