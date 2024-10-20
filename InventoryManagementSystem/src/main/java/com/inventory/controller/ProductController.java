package com.inventory.controller;

import com.inventory.model.Product;
import com.inventory.model.Category;
import com.inventory.model.Supplier;
import com.inventory.service.ProductService;
import com.inventory.service.CategoryService;
import com.inventory.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/products")
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private SupplierService supplierService;

    // List all products
    @GetMapping
    public String listProducts(Model model) {
        model.addAttribute("products", productService.getAllProducts());
        return "products";  // Resolves to WEB-INF/views/products.jsp
    }

    // Show form for adding or editing a product
    @GetMapping("/form")
    public String productForm(@RequestParam(required = false) Long id, Model model) {
        Product product = (id != null) ? productService.getProductById(id) : new Product();

        // Fetch the categories and suppliers from the services
        List<Category> categories = categoryService.getAllCategories();
        List<Supplier> suppliers = supplierService.getAllSuppliers();

        // Add product, categories, and suppliers to the model
        model.addAttribute("product", product);
        model.addAttribute("categories", categories);
        model.addAttribute("suppliers", suppliers);

        return "product-form";  // Resolves to WEB-INF/views/product-form.jsp
    }

    // Save or update a product
    @PostMapping
    public String saveProduct(@ModelAttribute Product product, @RequestParam("category.id") Long categoryId, @RequestParam("supplier.id") Long supplierId) {
        // If the product ID is null or invalid, set it to null for creating a new product
        if (product.getId() == null || product.getId() <= 0) {
            product.setId(null);
        }

        // Fetch the category and supplier from the database based on the selected IDs
        Category category = categoryService.getCategoryById(categoryId);
        Supplier supplier = supplierService.getSupplierById(supplierId);

        // Set the existing category and supplier on the product
        product.setCategory(category);
        product.setSupplier(supplier);

        // Save or update the product
        productService.saveOrUpdateProduct(product);

        return "redirect:/products";  // Redirect to the product list page
    }



    // Delete a product
    @GetMapping("/delete/{id}")
    public String deleteProduct(@PathVariable Long id) {
        productService.deleteProduct(id);
        return "redirect:/products";
    }
}
