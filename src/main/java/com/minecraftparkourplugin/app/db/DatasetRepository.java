package com.minecraftparkourplugin.app.db;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * This is our Repository Interface
 * TODO: Set up queries
 */
public interface DatasetRepository extends JpaRepository<Dataset, Integer> {

  @Query("SELECT d FROM Dataset d WHERE d.id = :datasetid")
  Dataset getDatasetById(@Param("datasetid")int datasetid);

  //Get the top datasets ordered by dataItemsSold
  @Query("SELECT d FROM Dataset d ORDER BY d.dataItemsSold DESC")
  List<Dataset> getDatasetByByOrderDesc();

  @Query("SELECT d FROM Dataset d WHERE lower(d.title) LIKE lower(concat('%',:searchPhrase,'%')) OR lower(d.description) LIKE lower(concat('%',:searchPhrase,'%')) ")
  List<Dataset> search(@Param("searchPhrase") String searchPhrase);

  @Query("SELECT d FROM Dataset d WHERE d.category = :category")
  List<Dataset> getDatasetByCategory(@Param("category")Dataset.Categories category);

  @Query("SELECT d FROM Dataset d WHERE d.category = :category AND d.visibility = :visibility")
  List<Dataset> getDatasetByCategoryVisibilityShown(@Param("category")Dataset.Categories category,
                                                    @Param("visibility")Dataset.DatasetVisibility visibility);

}
