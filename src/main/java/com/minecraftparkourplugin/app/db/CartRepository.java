package com.minecraftparkourplugin.app.db;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 * This is our Repository Interface
 * TODO: Set up queries
 */
public interface CartRepository extends JpaRepository<Cart, Long> {

  Cart findCartById(int id);


  @Query("SELECT c FROM Cart c WHERE c.userId = :userid")
  List<Cart> getCartByUserId(@Param("userid")int userid);

}
