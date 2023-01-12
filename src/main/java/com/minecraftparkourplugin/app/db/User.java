package com.minecraftparkourplugin.app.db;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import org.hibernate.annotations.ColumnDefault;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "users")
public class User {
  public enum Role{
    CUSTOMER,ADMIN
  }

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private int id;

  @Column(nullable = false)
  private String name;

  @Column(nullable = false)
  private String password;

  @Column
  private String email;



  @Column
  private String favourites;


  @Column(name = "role")
  @ColumnDefault("0")
  private Role role = Role.CUSTOMER;

  @Column(nullable = false)
  @ColumnDefault("0")
  private float totalExpenditure;

  private User(){}

  public User(String name, String password, String email){
    setName(name);
    setPassword(password);
    setEmail(email);
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getPassword() {
    return password;
  }

  public String getFavourites() {
    return favourites;
  }

  public void setFavourites(String favourites) {
    this.favourites = favourites;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getRole(){return role.toString();}

  public void setRole(Enum role) {this.role = (Role) role;}

  public float getTotalExpenditure() {
    return totalExpenditure;
  }

  public void setTotalExpenditure(float totalExpenditure) {
    this.totalExpenditure = totalExpenditure;
  }
}
