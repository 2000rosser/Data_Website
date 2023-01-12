package com.minecraftparkourplugin.app.db;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import java.util.Arrays;
import java.util.Set;
import org.hibernate.annotations.ColumnDefault;

@Entity
@Table(name = "dataset")
public class Dataset {

  private Dataset(){}

  public Dataset(String imageURL, String title, Double datapointprice, String description, DatasetVisibility visibility,
                 int numOfDataPts, String datapoints, Categories cat){
    setImage(imageURL);
    setTitle(title);
    setDataPointPrice(datapointprice);
    setDescription(description);
    setVisibility(visibility);
    setNumDataPoints(numOfDataPts);
    setDataPoints(datapoints);
    setCategory(cat);
  }

  public enum DatasetVisibility {
    SHOW,HIDDEN
  }

  public enum Categories {
    DEFAULT_DATA,WEB_DATA,ENVIRONMENTAL_DATA,GEOSPACIAL_DATA,TRANSPORT_AND_LOCATION_DATA,FINANCIAL_DATA,MISCELLANEOUS_DATA
  }

  public enum Favourites {
    NOT_FAVOURITE,FAVOURITE
  }

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private int id;


  @Column
//  @ColumnDefault("/assets/img_1.png") // For DEFAULT_DATA
  private String image;

  @Column
  @ColumnDefault("0") // For DEFAULT_DATA
  private Categories category;

  @Column(nullable = false)
  private String title;

  @Column
  @ColumnDefault("0.0")
  private double data_point_price;

  @Column
  @ColumnDefault("Null")
  private String description;

  @Column(name = "visibility")
  @ColumnDefault("0") // For Show
  private DatasetVisibility visibility;

  @Column
  @ColumnDefault("0")
  private int num_data_points;

  @Lob
  @Column
  @ColumnDefault("null")
  private String data_points;
  
  @Column
  @ColumnDefault("0")
  private int dataItemsSold;

  @Column(name = "favourites")
  @ColumnDefault("0") // For NOT_FAVOURITE
  private Favourites favourites;

  public String getImage() {return image;}

  public void setImage(String image) {this.image = image;}

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public double getDataPointPrice() {return data_point_price;}

  public void setDataPointPrice(double price) {
    this.data_point_price = price;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public DatasetVisibility getVisibility(DatasetVisibility hidden) {
    return visibility;
  }

  public void setVisibility(DatasetVisibility visibility) {
    this.visibility = visibility;
  }

  public int getNumDataPoints() {
    return num_data_points;
  }

  public void setNumDataPoints(int num_dataPoints) {
    this.num_data_points = num_dataPoints;
  }

  public String getDataPoints() {
    return data_points;
  }

  public void setDataPoints(String dataPoints) {
    this.data_points = dataPoints;
  }

  public String getDataPointsSubset(int limit){
    return Arrays.toString(data_points.split(",", limit));
  }

  public void setdataItemsSold(int dataItemsSold) {
    this.dataItemsSold = dataItemsSold;
  }

  public int getdataItemsSold() {
    return dataItemsSold;
  }

  public void setCategory(Categories category) { this.category = category; }

  public Categories getCategory() {
    return category;
  }

  public void setFavourites(Favourites favourites) { this.favourites = favourites; }

  public Favourites getFavourites() {
    return favourites;
  }

}
