package com.minecraftparkourplugin.app.db;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

/** This is a basic implementation of the class. There is no real functionality yet
 * TODO: Add/Remove items to/from cart
 * TODO: Calculate Total value of cart
 * TODO: Return last n items from cart
 */
@Entity
@Table(name = "cart")
public class Cart {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private int id;

  @Column
  private int userId;

  @Column
  private int datasetId;

  @Column
  private int dataPoints;

  private Cart(){}

  public Cart(int userId, int datasetId, int dataPoints){
    setUserId(userId);
    setDatasetId(datasetId);
    setDataPoints(dataPoints);
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public int getUserId(){return this.userId;}

  public void setUserId(int userId){this.userId = userId;}

  public int getDatasetId(){return this.datasetId;}

  public void setDatasetId(int datasetId){this.datasetId = datasetId;}

  public int getDataPoints(){return this.dataPoints;}

  public void setDataPoints(int dataPoints){this.dataPoints = dataPoints;}

}
