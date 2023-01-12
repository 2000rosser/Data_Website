package com.minecraftparkourplugin.app.controllers;

import com.minecraftparkourplugin.app.db.Cart;
import com.minecraftparkourplugin.app.db.CartRepository;
import com.minecraftparkourplugin.app.db.Dataset;
import com.minecraftparkourplugin.app.db.DatasetRepository;
import com.minecraftparkourplugin.app.db.Order;
import com.minecraftparkourplugin.app.db.OrderRepository;
import com.minecraftparkourplugin.app.db.User;
import com.minecraftparkourplugin.app.db.UserRepository;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseStatus;

public class CartController {
  @Autowired
  private CartRepository cartRepository;

  @Autowired
  private UserRepository userRepository;
  @Autowired
  private OrderRepository orderRepository;

  @Autowired
  private DatasetRepository datasetRepository;

}
