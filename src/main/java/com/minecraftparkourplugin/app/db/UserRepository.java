package com.minecraftparkourplugin.app.db;

import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * This is our Repository Interface
 * TODO: Set up additional queries
 */
public interface UserRepository extends JpaRepository<User, Long> {
  @Query("SELECT u FROM User u WHERE u.id = :id")
  List<User> getUserById(@Param("id")int id);

  @Query("SELECT u FROM User u WHERE u.email = :email AND u.password = :password")
  User getUserByEmailAndPassword(@Param("email")String email, @Param("password")String password);

  @Query("SELECT u FROM User u Where u.name = :username")
  User getUserByName(@Param("username")String username);

  @Query("SELECT u FROM User u Where u.email = :email")
  User getUserByEmail(@Param("email")String email);

  @Query("SELECT u FROM User u ORDER BY u.totalExpenditure DESC")
  List <User> getUserByBOrderByTotalExpenditure();

}
