package com.minecraftparkourplugin.app.controllers;

import com.minecraftparkourplugin.app.db.*;
import jakarta.annotation.PostConstruct;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;

import java.io.IOException;
import java.util.List;

@Controller
public class LoginController {
//    User user = null;
//
//    @Autowired
//    UserRepository userRepo;
//
//    @Autowired
//    DatasetRepository datasetRepo;
//
//    @Autowired
//    CartRepository cartRepo;
//
//    @GetMapping("/login")
//    public String login(){
////        test(); //only for testing purposes
////        addToCart(); //only for testing purposes
//        return "login.html";
//    }
//
//    @PostMapping("/login")
//    @ResponseBody
//    public void loggingIn(HttpServletRequest request, HttpServletResponse
//            response) throws ServletException, IOException {
//        System.out.println(request.getParameter("user"));
//        User result = userRepo.getUserByEmailAndPassword(request.getParameter("user"), request.getParameter("password"));
//
//        if(result != null){
//            user = result;
//            try{response.sendRedirect("/index");}catch(IOException e){e.printStackTrace();}
//        }
//        else try{response.sendRedirect("/login");}catch(IOException e){e.printStackTrace();}
//
//    }
//
//    public void test(){
//        List<User> all = userRepo.getUserById(1);
//        all.forEach(u -> System.out.println(u.getEmail()+ " " +u.getRole()));
//    }
//
//    public void addToCart(){
//        cartRepo.save(new Cart(1,1,10));
//        cartRepo.save(new Cart(2,1,10));
//
//        cartRepo.getCartByUserId(1).forEach(c -> System.out.println(c.getDatasetId()));
//    }
}
