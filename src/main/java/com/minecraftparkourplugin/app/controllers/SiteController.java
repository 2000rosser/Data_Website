package com.minecraftparkourplugin.app.controllers;

import com.minecraftparkourplugin.app.db.Cart;
import com.minecraftparkourplugin.app.db.CartRepository;
import com.minecraftparkourplugin.app.db.Dataset;
import com.minecraftparkourplugin.app.db.DatasetRepository;
import com.minecraftparkourplugin.app.db.Order;
import com.minecraftparkourplugin.app.db.Order.OrderStatus;
import com.minecraftparkourplugin.app.db.OrderRepository;
import com.minecraftparkourplugin.app.db.User;
import com.minecraftparkourplugin.app.db.UserRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLConnection;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SiteController {

  User user = null;
  int orderIdNum = 0;

  boolean[] dataPointCheck = new boolean[6];

  @Autowired
  UserRepository userRepo;

  @Autowired
  DatasetRepository datasetRepo;

  @Autowired
  CartRepository cartRepo;

  @Autowired
  OrderRepository orderRepo;

  // CATALOGUE SECTION
  @GetMapping("/index")
  public String index(Model model) {
    model.addAttribute("user", user);
    return "index.html";
  }

  @GetMapping("/viewfavourites")
  public String viewFavourites(Model model) {
    model.addAttribute("user", user);

    List<Dataset> datasets = new ArrayList<>();
    if(user.getFavourites()==null){
      user.setFavourites("");
    }else{

    String favourites = user.getFavourites();

    String[] data = favourites.split(",");

      if (data[0].startsWith(",")){
          data[0].substring(1);
        }



    for(int i=0;i<data.length;i++){
      if (data[i]!=null){
        if(data[i]!=""){
        int tempInt;
        tempInt=Integer.valueOf(data[i]);
        datasets.add(datasetRepo.getDatasetById(tempInt));
      }}
    }}


    model.addAttribute("datasets", datasets);
    return "viewfavourites.html";
  }

  @PostMapping("/removefavourite")
  @ResponseBody
  public void removeFavourite(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    String id = request.getParameter("dataId");
    String favs[] = user.getFavourites().split(",");
    String newFavs="";
    if(favs.length>1){
    for(int i=0; i<favs.length;i++){
      if(!favs[i].equals(id)){
        if(newFavs==""){
          newFavs += favs[i];
        }else{
          newFavs += "," + favs[i];
        }

      }
    }
    }else{
      newFavs=null;
    }
    user.setFavourites(newFavs);
    userRepo.save(user);
    try {
      response.sendRedirect("/viewfavourites");
    } catch (IOException e) {
      e.printStackTrace();
    }

  }

  @PostMapping("/addfavourite")
  @ResponseBody
  public void addFavourite(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    String id = request.getParameter("dataId");


    int numId = Integer.valueOf(id);
    String favs;
    String temp="";
    if (user != null) {
    if(user.getFavourites()!=null) {
      favs = user.getFavourites();
      if (favs.startsWith(",")){
        favs.substring(1);
      }

    }else {
      favs="";
    }
    if (favs.startsWith(",")){
      favs.substring(1);
    }


      if(user.getFavourites()==null||user.getFavourites()==""){
        favs+=numId;

        user.setFavourites(favs);
      }else{
        temp+=numId;
        if(!favs.contains(temp)) {
          favs += "," + numId;
          user.setFavourites(favs);
        }
      }
      userRepo.save(user);
      response.sendRedirect("/viewfavourites");
    } else {
      try {
        response.sendRedirect("/login");
      } catch (IOException e) {
        e.printStackTrace();
      }
    }

  }

  @GetMapping("/webdata")
  public String webData(Model model) {
    model.addAttribute("user", user);
    System.out.println(user);
    List<Dataset> datasets =
      datasetRepo.getDatasetByCategoryVisibilityShown(Dataset.Categories.valueOf("WEB_DATA"),Dataset.DatasetVisibility.valueOf("SHOW"));
    if (dataPointCheck[0] == false) {
      createDataPoints(1, 400, datasets);
      dataPointCheck[0] = true;

    }
    model.addAttribute("data", datasets);
    return "datasets.html";
  }

  public void createDataPoints(int min, int max, List<Dataset> datasets) {

    int total = datasets.size();
    StringBuilder dataPoints = new StringBuilder();
//      int min = 1;
//      int max = 400;
//    int random;
    Random random = new Random();
    for (Dataset dataset : datasets) {
      for (int i = 0; i < dataset.getNumDataPoints(); i++) {
        if (i == 0) {
          dataPoints.append(random.nextInt(max) + min);
        } else {
          dataPoints.append(",").append(random.nextInt(max) + min);
        }
      }
      dataset.setDataPoints(String.valueOf(dataPoints));
      datasetRepo.save(dataset);
    }
  }

  @PostMapping("/webdata")
  @ResponseBody
  public void webDataCart(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String id = request.getParameter("dataId");
    String quantityString = request.getParameter("quantity");
    int quantity = Integer.valueOf(quantityString);
    int numId = Integer.valueOf(id);
    Dataset dataset = datasetRepo.getDatasetById(numId);
    if (user != null) {
      cartRepo.save(new Cart(user.getId(), numId, quantity));
      response.sendRedirect("/webdata");
    } else {
      try {
        response.sendRedirect("/login");
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }

  @GetMapping("/environmentdata")
  public String environmentData(Model model) {
    model.addAttribute("user", user);
    List<Dataset> result =
        datasetRepo.getDatasetByCategoryVisibilityShown(
            Dataset.Categories.valueOf("ENVIRONMENTAL_DATA"),
            Dataset.DatasetVisibility.valueOf("SHOW"));
    model.addAttribute("data", result);

    if (dataPointCheck[1] == false) {
      createDataPoints(1, 400, result);
      dataPointCheck[1] = true;
    }

    return "datasets.html";
  }

  @PostMapping("/environmentdata")
  @ResponseBody
  public void environmentDataCart(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String id = request.getParameter("dataId");
    String quantityString = request.getParameter("quantity");
    int quantity = Integer.valueOf(quantityString);
    int numId = Integer.valueOf(id);
    Dataset dataset = datasetRepo.getDatasetById(numId);
    if (user != null) {
      cartRepo.save(new Cart(user.getId(), numId, quantity));
      response.sendRedirect("/environmentdata");
    } else {
      try {
        response.sendRedirect("/login");
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }

  @GetMapping("/geospacialdata")
  public String geospacialData(Model model) {
    model.addAttribute("user", user);
    List<Dataset> result =
        datasetRepo.getDatasetByCategoryVisibilityShown(
            Dataset.Categories.valueOf("GEOSPACIAL_DATA"),
            Dataset.DatasetVisibility.valueOf("SHOW"));
    model.addAttribute("data", result);
    if (dataPointCheck[2] == false) {
      createDataPoints(1, 400, result);
      dataPointCheck[2] = true;
    }
    return "datasets.html";
  }

  @PostMapping("/geospacialdata")
  @ResponseBody
  public void geospacialDataCart(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String id = request.getParameter("dataId");
    String quantityString = request.getParameter("quantity");
    int quantity = Integer.valueOf(quantityString);
    int numId = Integer.valueOf(id);
    Dataset dataset = datasetRepo.getDatasetById(numId);
    if (user != null) {
      cartRepo.save(new Cart(user.getId(), numId, quantity));
      response.sendRedirect("/geospacialdata");
    } else {
      try {
        response.sendRedirect("/login");
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }

  @GetMapping("/transportandlocationdata")
  public String transportAndLocationData(Model model) {
    model.addAttribute("user", user);
    List<Dataset> result =
        datasetRepo.getDatasetByCategoryVisibilityShown(
            Dataset.Categories.valueOf("TRANSPORT_AND_LOCATION_DATA"),
            Dataset.DatasetVisibility.valueOf("SHOW"));
    model.addAttribute("data", result);
    if (dataPointCheck[3] == false) {
      createDataPoints(1, 400, result);
      dataPointCheck[3] = true;
    }
    return "datasets.html";
  }

  @PostMapping("/transportandlocationdata")
  @ResponseBody
  public void transportAndLocationDataCart(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String id = request.getParameter("dataId");
    String quantityString = request.getParameter("quantity");
    int quantity = Integer.valueOf(quantityString);
    int numId = Integer.valueOf(id);
    Dataset dataset = datasetRepo.getDatasetById(numId);
    if (user != null) {
      cartRepo.save(new Cart(user.getId(), numId, quantity));
      response.sendRedirect("/transportandlocationdata");
    } else {
      try {
        response.sendRedirect("/login");
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }

  @GetMapping("/financialdata")
  public String financialData(Model model) {
    model.addAttribute("user", user);
    List<Dataset> result =
        datasetRepo.getDatasetByCategoryVisibilityShown(
            Dataset.Categories.valueOf("FINANCIAL_DATA"),
            Dataset.DatasetVisibility.valueOf("SHOW"));
    model.addAttribute("data", result);
    if (dataPointCheck[4] == false) {
      createDataPoints(1, 400, result);
      dataPointCheck[4] = true;
    }
    return "datasets.html";
  }

  @PostMapping("/financialdata")
  @ResponseBody
  public void financialDataCart(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String id = request.getParameter("dataId");
    String quantityString = request.getParameter("quantity");
    int quantity = Integer.valueOf(quantityString);
    int numId = Integer.valueOf(id);
    Dataset dataset = datasetRepo.getDatasetById(numId);
    if (user != null) {
      cartRepo.save(new Cart(user.getId(), numId, quantity));
      response.sendRedirect("/financialdata");
    } else {
      try {
        response.sendRedirect("/login");
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }

  @GetMapping("/miscellaneousdata")
  public String miscellaneousData(Model model) {
    model.addAttribute("user", user);
    List<Dataset> result =
        datasetRepo.getDatasetByCategoryVisibilityShown(
            Dataset.Categories.valueOf("MISCELLANEOUS_DATA"),
            Dataset.DatasetVisibility.valueOf("SHOW"));
    model.addAttribute("data", result);
    if (dataPointCheck[5] == false) {
      createDataPoints(1, 400, result);
      dataPointCheck[5] = true;
    }
    return "datasets.html";
  }

  @PostMapping("/miscellaneousdata")
  @ResponseBody
  public void miscellaneousDataCart(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String id = request.getParameter("dataId");
    String quantityString = request.getParameter("quantity");
    int quantity = Integer.valueOf(quantityString);
    int numId = Integer.valueOf(id);
    Dataset dataset = datasetRepo.getDatasetById(numId);
    if (user != null) {
      cartRepo.save(new Cart(user.getId(), numId, quantity));
      response.sendRedirect("/miscellaneousdata");
    } else {
      try {
        response.sendRedirect("/login");
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }

  public void dataListTest() {
    List<Dataset> result =
        datasetRepo.getDatasetByCategory(Dataset.Categories.valueOf("DEFAULT_DATA"));
    //        datasets.subList(0, 5);

  }

  // LOGGING IN SECTION

  @GetMapping("/login")
  public String login() {
    datasetOrderTest();
    return "login.html";
  }

  @GetMapping("/logout")
  public String logout() {
    user = null;
    return "index.html";
  }

  @PostMapping("/login")
  @ResponseBody
  public void loggingIn(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    User result =
        userRepo.getUserByEmailAndPassword(
            request.getParameter("user"), request.getParameter("password"));

    if (result != null) {
      user = result;
      try {
        response.sendRedirect("/index");
      } catch (IOException e) {
        e.printStackTrace();
      }
    } else {
      try {
        response.sendRedirect("/login");
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }

  // REGISTRATION SECTION

  @GetMapping("/register")
  public String register() {
    datasetOrderTest();
    return "register.html";
  }

  @PostMapping("/register")
  @ResponseBody
  public void Registration(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    if (userRepo.getUserByName(request.getParameter("username")) == null
        && userRepo.getUserByEmail(request.getParameter("email")) == null) {
      userRepo.save(
          new User(
              request.getParameter("username"),
              request.getParameter("password"),
              request.getParameter("email")));
      try {
        response.sendRedirect("/login");
      } catch (IOException e) {
        e.printStackTrace();
      }
    } else {
      try {
        response.sendRedirect("/register");
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }

  //UserPanel Section
  @GetMapping("/userpanel")
  public String userpanel(Model model) {
    model.addAttribute("user", user);
    return "userpanel.html";
  }

  @GetMapping("/vieworders")
  public String vieworders(Model model) {
    model.addAttribute("user", user);
    List<Order> orders = orderRepo.getOrderByUserId(user.getId());
    List<Dataset> datasets = new ArrayList<>();
    orders.forEach(item -> datasets.add(datasetRepo.getDatasetById(item.getDatasetId())));
    model.addAttribute("orders", orders);
    model.addAttribute("datasets", datasets);
    return "vieworders.html";
  }

  @PostMapping("/vieworders")
  public void vieworders(HttpServletRequest request, HttpServletResponse response) {
    int datasetid = Integer.parseInt(request.getParameter("datasetid"));
    int datasetpoints = Integer.parseInt(request.getParameter("datasetpoints"));
    Dataset dataset = datasetRepo.getDatasetById(datasetid);
    String[] data = dataset.getDataPoints().split(",");
    StringBuilder datapoints = new StringBuilder();
    for (int i = 0; i < datasetpoints; i++) {
      if (i == 0){
        datapoints.append(data[i]);
      } else {
        datapoints.append(",").append(data[i]);
      }
    }
    File file = new File("src/main/resources/data.csv");
    try {
      file.createNewFile();
      FileOutputStream fileOutputStream = new FileOutputStream(file, false);
      fileOutputStream.write(String.valueOf(datapoints).getBytes(StandardCharsets.UTF_8));
      fileOutputStream.close();
      String mimeType = URLConnection.guessContentTypeFromName(file.getName());
      response.setContentType(mimeType);
      response.setHeader("Content-Disposition", "attachment; filename=\"" + file.getName() + "\"");
      response.setContentLength((int) file.length());
      InputStream inputStream = new BufferedInputStream(new FileInputStream(file));
      FileCopyUtils.copy(inputStream, response.getOutputStream());
    } catch (IOException e) {
      e.printStackTrace();
    }
  }


  //FAQ Section
  @GetMapping("/faq")
  public String faq(Model model) {
    model.addAttribute("user", user);
    return "faq.html";
  }

  // TEST METHODS

  public void datasetOrderTest() {
    List<Dataset> result =
        datasetRepo.getDatasetByCategory(Dataset.Categories.valueOf("DEFAULT_DATA"));
    result.forEach(e -> System.out.println(e.getTitle()));
  }

  public void test() {
    List<User> all = userRepo.getUserById(1);
    all.forEach(u -> System.out.println(u.getEmail() + " " + u.getRole()));
  }

  public void addToCart() {
//    cartRepo.save(new Cart(1, 1, 10));
//    cartRepo.save(new Cart(2, 1, 10));

    cartRepo.getCartByUserId(1).forEach(c -> System.out.println(c.getDatasetId()));
  }

  public void testOrder() {
    orderRepo.save(new Order(1, 1, 10, 0.1f, 1));
    System.out.println(orderRepo.getOrdersByUserIdAndDatasetId(1, 1));
  }

  // Cart Methods

  @GetMapping("/cart")
  public String viewCart(Model model) {
    if (user == null) {
      return "index.html";
    }
    model.addAttribute("user", user);
    // addToCart(); //TODO: Remove this after testing
    List<Cart> cart = cartRepo.getCartByUserId(user.getId());
    List<Dataset> datasets = new ArrayList<>();
    cart.forEach(item -> datasets.add(datasetRepo.getDatasetById(item.getDatasetId())));
    int totalPrice = 0;
    for (Cart item : cart) {
      totalPrice +=
          item.getDataPoints()
              * datasetRepo.getDatasetById(item.getDatasetId()).getDataPointPrice();
    }
    model.addAttribute("carts", cart);
    model.addAttribute("datasets", datasets);
    model.addAttribute("totalPrice", totalPrice);
    return "cart.html";
  }

  @PostMapping("/cart")
  @ResponseBody
  public void removeFromCart(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    List<Cart> cart = cartRepo.getCartByUserId(user.getId());
    for (Cart item : cart) {
      if (item.getId() == Integer.parseInt(request.getParameter("cartitemid"))) {
        cartRepo.delete(item);
      }
    }

    try {
      response.sendRedirect("/cart");
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  @GetMapping("/checkout")
  public void checkout(Model model, HttpServletResponse response) {
    model.addAttribute("user", user);
    // Checkout Button to add items from cart to orders and then clear cart
    List<Cart> carts = cartRepo.getCartByUserId(user.getId());
    if (carts.isEmpty()) {
      try {
        response.sendRedirect("/vieworders");
      } catch (IOException e) {
        e.printStackTrace();
      }
    } else {
      orderIdNum += 1;
      for (Cart cart : carts) {
        Order order =
            new Order(
                user.getId(),
                cart.getDatasetId(),
                cart.getDataPoints(),
                datasetRepo.getDatasetById(cart.getDatasetId()).getDataPointPrice(),
                orderIdNum);
        order.setOrderStatus(OrderStatus.NEW);
        orderRepo.save(order);
        List<User> users = userRepo.getUserById(order.getUserId());
        for (User user : users) {
          if (user.getId() == order.getUserId()) {
            user.setTotalExpenditure(
                (float) (user.getTotalExpenditure() + order.getDatasetTotalPrice()));
          }
        }
        Dataset dataset = datasetRepo.getDatasetById(order.getDatasetId());
        dataset.setdataItemsSold(dataset.getdataItemsSold() + 1);
      }
      cartRepo.deleteAll(carts);
      try {
        response.sendRedirect("/order");
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }

  @GetMapping("/order")
  public String order(Model model) {
    model.addAttribute("user", user);
    List<Order> orders = orderRepo.getOrdersByOrderId(orderIdNum);
    List<Dataset> datasets = new ArrayList<>();
    orders.forEach(item -> datasets.add(datasetRepo.getDatasetById(item.getDatasetId())));
    model.addAttribute("orders", orders);
    model.addAttribute("datasets", datasets);
    return "order.html";
  }

  @PostMapping("/order")
  public void order(HttpServletRequest request, HttpServletResponse response) {
    int datasetid = Integer.parseInt(request.getParameter("datasetid"));
    int datasetpoints = Integer.parseInt(request.getParameter("datasetpoints"));
    Dataset dataset = datasetRepo.getDatasetById(datasetid);
    String[] data = dataset.getDataPoints().split(",");
    StringBuilder datapoints = new StringBuilder();
    for (int i = 0; i < datasetpoints; i++) {
      if (i == 0){
        datapoints.append(data[i]);
      } else {
        datapoints.append(",").append(data[i]);
      }
    }
    File file = new File("src/main/resources/data.csv");
    try {
      file.createNewFile();
      FileOutputStream fileOutputStream = new FileOutputStream(file, false);
      fileOutputStream.write(String.valueOf(datapoints).getBytes(StandardCharsets.UTF_8));
      fileOutputStream.close();
      String mimeType = URLConnection.guessContentTypeFromName(file.getName());
      response.setContentType(mimeType);
      response.setHeader("Content-Disposition", "attachment; filename=\"" + file.getName() + "\"");
      response.setContentLength((int) file.length());
      InputStream inputStream = new BufferedInputStream(new FileInputStream(file));
      FileCopyUtils.copy(inputStream, response.getOutputStream());
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  // Analytics Methods

  public List<Dataset> topDataSetsSold() {
    List<Dataset> datasets = datasetRepo.getDatasetByByOrderDesc();
    return datasets;
  }

  // Admin Panel and analytics
  public List<User> topBuyers() {
    List<User> user = userRepo.getUserByBOrderByTotalExpenditure();
    return user;
  }

  public List<Dataset> hideAllDataSets() {
    List<Dataset> datasets = datasetRepo.getDatasetByByOrderDesc();
    return datasets;
  }

  public List<Order> viewAllOrders() {
    List<Order> orders = orderRepo.getOrdersByOrderId(orderIdNum);
    return orders;
  }

  public List<Order> changeOrderStatus() {
    List<Order> orders = orderRepo.getOrdersByOrderId(orderIdNum);
    return orders;
  }

  public List<Dataset> editDataSets() {
    List<Dataset> datasets = datasetRepo.getDatasetByByOrderDesc();
    return datasets;
  }

  @GetMapping("/adminpanel")
  public String adminPanel(Model model) {
    model.addAttribute("user", user);
    return "adminpanel.html";
  }

  @GetMapping("/adminanalytics")
  public String adminAnalytics(Model model) {
    model.addAttribute("user", user);
    model.addAttribute("topdata", topDataSetsSold());
    //    model.addAttribute("topcategory",topCategoriesSold(category));
    model.addAttribute("topbuyers", topBuyers());
    return "adminanalytics.html";
  }

  // Admin Panel Methods

  @GetMapping("/adddatasets")
  public String adddatasets(Model model) {
    model.addAttribute("user", user);
    return "adddatasets.html";
  }

  @GetMapping("/hidedatasets")
  public String hidedatasets(Model model) {
    model.addAttribute("user", user);
    model.addAttribute("hidealldatasets", hideAllDataSets());
    return "hidedatasets.html";
  }

  @GetMapping("/viewallorders")
  public String viewallorders(Model model) {
    model.addAttribute("user", user);
    model.addAttribute("viewallorders", viewAllOrders());
    return "viewallorders.html";
  }

  @GetMapping("/changeorderstatus")
  public String changeorders(Model model) {
    model.addAttribute("user", user);
    model.addAttribute("changeorderstatus", changeOrderStatus());
    return "changeorderstatus.html";
  }

  @GetMapping("/editdatasets")
  public String editdatasets(Model model) {
    model.addAttribute("user", user);
    model.addAttribute("editdatasets", editDataSets());
    return "editdatasets.html";
  }

   //Admin Methods Mapping
  @PostMapping("/adddatasets")
  @ResponseBody
  public void AddDataSets(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      datasetRepo.save(
                new Dataset(
                      request.getParameter("image"),
                      request.getParameter("title"),
                      Double.valueOf(request.getParameter("datapointprice")),
                      request.getParameter("description"),
                      Dataset.DatasetVisibility.valueOf(request.getParameter("visibility")),
                      Integer.valueOf(request.getParameter("numofdatapoints")),
                      request.getParameter("datapoints"),
                      Dataset.Categories.valueOf(request.getParameter("categories"))));
      try {
        response.sendRedirect("/adddatasets");
      } catch (IOException e) {
        e.printStackTrace();
      }
    }

  @PostMapping("/hidedatasets")
  @ResponseBody
  public void HideDataSets(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String id = request.getParameter("dataId");
    int numId = Integer.valueOf(id);
    Dataset dataset = datasetRepo.getDatasetById(numId);
    if (dataset.getVisibility(Dataset.DatasetVisibility.valueOf("HIDDEN")) == Dataset.DatasetVisibility.valueOf("HIDDEN"))
    {
      dataset.setVisibility(Dataset.DatasetVisibility.valueOf("SHOW"));
    }
    else
    {
      dataset.setVisibility(Dataset.DatasetVisibility.valueOf("HIDDEN"));
    }

    datasetRepo.save(dataset);
    try {
      response.sendRedirect("/hidedatasets");
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  @PostMapping("/viewallorders")
  @ResponseBody
  public void viewAllOrders(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String id = request.getParameter("dataId");
    int numId = Integer.valueOf(id);
    Order orders = (Order) orderRepo.getOrdersByOrderId(numId);
    Integer.valueOf(request.getParameter("orderId"));
    Integer.valueOf(request.getParameter("datasetId"));
    Integer.valueOf(request.getParameter("userId"));
    Double.valueOf(request.getParameter("datasetPricePerPoint"));
    Double.valueOf(request.getParameter("datasetTotalPrice"));
    orderRepo.save(orders);
    try {
      response.sendRedirect("/viewallorders");
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  @PostMapping("/changeorderstatus")
  @ResponseBody
  public void ChangeOrderStatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String id = request.getParameter("dataId");
    int numId = Integer.parseInt(id);
    List<Order> orders = orderRepo.getOrdersByOrderId(numId);

    for(Order order : orders) {

      if ((order.getOrderStatus() == Order.OrderStatus.valueOf(
          "NEW")) || (order.getOrderStatus())
          == Order.OrderStatus.valueOf("CANCELLED")) {
        order.setOrderStatus(Order.OrderStatus.valueOf("DELIVERED"));
      } else if ((order.getOrderStatus()
          == Order.OrderStatus.valueOf("DELIVERED")) || (
          order.getOrderStatus()
              == Order.OrderStatus.valueOf("CANCELLED"))) {
        order.setOrderStatus(Order.OrderStatus.valueOf("NEW"));
      } else {
        order.setOrderStatus(Order.OrderStatus.valueOf("CANCELLED"));
      }
    }

    orderRepo.saveAll(orders);
    try {
      response.sendRedirect("/changeorderstatus");
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  @PostMapping("/editdatasets")
  @ResponseBody
  public void EditDataSets(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String id = request.getParameter("dataId");
    int numId = Integer.valueOf(id);
    Dataset dataset = datasetRepo.getDatasetById(numId);
    dataset.setImage(request.getParameter("image"));
    dataset.setDataPointPrice(Double.valueOf(request.getParameter("datapointprice")));
    dataset.setDescription(request.getParameter("description"));
    dataset.setNumDataPoints(Integer.valueOf(request.getParameter("numofdatapoints")));
    dataset.setDataPoints(request.getParameter("datapoints"));
    dataset.setCategory(Dataset.Categories.valueOf(request.getParameter("categories")));
    datasetRepo.save(dataset);
    try {
      response.sendRedirect("/editdatasets");
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  // Search Function
  @GetMapping("/search")
  public String search(@RequestParam String search, Model model) {
    model.addAttribute("user", user);
    List<Dataset> datasets = datasetRepo.search(search);
    model.addAttribute("datasets", datasets);
    return "search.html";
  }


}
