//package com.minecraftparkourplugin.app.controllers;
//
//import com.minecraftparkourplugin.app.db.Dataset;
//import com.minecraftparkourplugin.app.db.OrderRepository;
//import com.minecraftparkourplugin.app.db.User;
//import com.minecraftparkourplugin.app.db.UserRepository;
//import java.security.Principal;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//@Controller
//@RequestMapping("/orders")
//public class OrderController {
//  @Autowired
//  UserRepository userRepository;
//
//  @Autowired
//  OrderRepository orderRepository;
//
//  @GetMapping
//  public String orders(Principal principal, Model model){
//    User user = userRepository.findUserByName(principal.getName());
//    model.addAttribute("user", user);
////    model.addAttribute("orders", orderRepository.findOrderByUser(user));
//    return "orders";
//  }
//
//  public boolean ownsDataset(Principal principal, Dataset dataset){
//    if (principal == null) {
//      return false;
//    }
//    User user = userRepository.findUserByName(principal.getName());
//    return orderRepository.getOrdersByUserIdAndDatasetId(user.getId(), dataset.getId()).isEmpty();
//  }
//
//}
