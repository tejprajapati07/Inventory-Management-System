package com.inventory.service;

import com.inventory.model.Order;
import com.inventory.model.Product;
import com.inventory.repository.OrderRepository;
import com.inventory.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private ProductRepository productRepository;

    // Create an order and decrease product quantity
    public Order createOrder(Long productId, int quantity) {
        Product product = productRepository.findById(productId).orElse(null);

        if (product != null && quantity > 0 && product.getQuantity() >= quantity) {
            // Decrease the quantity of the product
            product.setQuantity(product.getQuantity() - quantity);
            productRepository.save(product);  // Save the updated product

            // Create and save the order
            Order order = new Order();
            order.setProduct(product);
            order.setQuantity(quantity);
            return orderRepository.save(order);
        } else {
            // Handle the case where the product is not found or quantity is not sufficient
            return null;
        }
    }

    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }
}
