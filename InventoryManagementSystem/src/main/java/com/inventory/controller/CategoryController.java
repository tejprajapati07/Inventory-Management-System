package com.inventory.controller;

import com.inventory.model.Category;
import com.inventory.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/categories")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    // List all categories
    @GetMapping
    public String listCategories(Model model) {
        // Fetch the latest list of categories and add it to the model
        List<Category> categories = categoryService.getAllCategories();
        model.addAttribute("categories", categories);
        return "categories";  // Resolves to WEB-INF/views/categories.jsp
    }

    // Show form for adding or editing a category
    @GetMapping("/form")
    public String categoryForm(@RequestParam(required = false) Long id, Model model) {
        // Edit or Add new category based on the presence of the ID
        Category category = (id != null) ? categoryService.getCategoryById(id) : new Category();
        model.addAttribute("category", category);
        return "category-form";  // Resolves to WEB-INF/views/category-form.jsp
    }

    // Save or update the category
    @PostMapping
    public String saveCategory(@ModelAttribute Category category) {
        // Save or Update category based on the existence of the ID
        categoryService.saveOrUpdateCategory(category);
        return "redirect:/categories";  // Redirect back to the category list page
    }

    // Delete a category by ID
    @GetMapping("/delete/{id}")
    public String deleteCategory(@PathVariable Long id) {
        // Call the delete method from the service
        categoryService.deleteCategory(id);
        return "redirect:/categories";  // Redirect to the category list page
    }
}
