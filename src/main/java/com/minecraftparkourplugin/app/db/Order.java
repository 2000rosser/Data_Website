package com.minecraftparkourplugin.app.db;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import org.hibernate.annotations.ColumnDefault;

/** This is a basic implementation of the class. There is no real functionality yet
 * TODO: Add/Remove items to/from cart
 * TODO: Calculate Total value of cart
 * TODO: Return last n items from cart
 */
@Entity
@Table(name = "order")
public class Order {
  public enum OrderStatus{
    NEW,CANCELLED,DELIVERED
  }

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private int id;

  @Column
  private int userId;

  @Column
  private int datasetId;

  @Column
  private int dataPoints;

  @Column
  private int orderId;

  @Column
  private double datasetPricePerPoint;

  @Column
  private double datasetTotalPrice;

  @Column
  @ColumnDefault("0")
  private OrderStatus orderStatus;

  private Order(){}

  public Order(int userId, int datasetId, int dataPoints, double datasetPricePerPoint ,int orderId){
    setUserId(userId);
    setDatasetId(datasetId);
    setDataPoints(dataPoints);
    setOrderId(orderId); //Please generate some random number for this order number...
    setDatasetPricePerPoint(datasetPricePerPoint);
    setDatasetTotalPrice(datasetPricePerPoint, dataPoints);
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {this.id = id;}

  public int getUserId(){return this.userId;}

  public void setUserId(int userId){this.userId = userId;}

  public int getDatasetId(){return this.datasetId;}

  public void setDatasetId(int datasetId){this.datasetId = datasetId;}

  public int getDataPoints(){return this.dataPoints;}

  public void setDataPoints(int dataPoints){this.dataPoints = dataPoints;}

  public int getOrderId() {
    return orderId;
  }

  public void setOrderId(int orderId) {this.orderId = orderId;}

  public void setDatasetPricePerPoint(double price){this.datasetPricePerPoint = price;}

  public double getDatasetPricePerPoint(){return datasetPricePerPoint;}

  public void setDatasetTotalPrice(double price, int points){this.datasetTotalPrice = price*points;}

  public double getDatasetTotalPrice(){return datasetTotalPrice;}

  public OrderStatus getOrderStatus() {
    return orderStatus;
  }

  public void setOrderStatus(OrderStatus orderStatus) {
    this.orderStatus = orderStatus;
  }
}
