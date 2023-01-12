package com.minecraftparkourplugin.app.controllers;

import com.minecraftparkourplugin.app.db.Dataset;
import com.minecraftparkourplugin.app.db.DatasetRepository;
import com.minecraftparkourplugin.app.db.User;
import com.minecraftparkourplugin.app.db.UserRepository;
import java.security.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.server.ResponseStatusException;

@Controller
@RequestMapping("/dataset")
public class DatasetController {

  @Autowired
  public DatasetRepository datasetRepository;

  @Autowired
  private UserRepository userRepository;


  @GetMapping("/{id}")
  public String viewDataset(User user, @PathVariable int id, Model model) {
    Dataset dataset = datasetRepository.getDatasetById(id);
    if (dataset == null) {
      throw new ResponseStatusException(HttpStatus.NOT_FOUND);
    }
    model.addAttribute("dataset", dataset);
    return "view_dataset";
  }

  @GetMapping("/{id}/buy")
  public String buyDataset(@PathVariable int id, Model model) {
    Dataset dataset = datasetRepository.getDatasetById(id);
    if (dataset == null){
      throw new ResponseStatusException(HttpStatus.NOT_FOUND);
    }
    model.addAttribute("dataset", dataset);
    return "buy_dataset";
  }
}
