package com.inventory.controller;

import com.inventory.model.Order;
import com.inventory.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/orders")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @PostMapping
    public String createOrder(@RequestParam Long productId, @RequestParam(defaultValue = "1") int quantity, Model model) {
        Order order = orderService.createOrder(productId, quantity);

        if (order != null) {
            // Redirect to orders page if order creation is successful
            return "redirect:/orders";
        } else {
            // Redirect to products page and show error if order failed (e.g., insufficient stock)
            model.addAttribute("error", "Insufficient stock to fulfill the order.");
            return "redirect:/products";
        }
    }

    @GetMapping
    public String listOrders(Model model) {
        model.addAttribute("orders", orderService.getAllOrders());
        return "orders";  // This will resolve to WEB-INF/views/orders.jsp
    }
}
