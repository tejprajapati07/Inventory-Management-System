package com.inventory.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.inventory.model.Supplier;
import com.inventory.service.SupplierService;

@Controller
@RequestMapping("/suppliers")
public class SupplierController {

    @Autowired
    private SupplierService supplierService;

    // List all suppliers
    @GetMapping
    public String listSuppliers(Model model) {
        model.addAttribute("suppliers", supplierService.getAllSuppliers());
        return "suppliers";  // Resolves to WEB-INF/views/suppliers.jsp
    }

    // Show form for adding or editing a supplier
    @GetMapping("/form")
    public String supplierForm(@RequestParam(required = false) Long id, Model model) {
        Supplier supplier = (id != null) ? supplierService.getSupplierById(id) : new Supplier();
        model.addAttribute("supplier", supplier);
        return "supplier-form";  // Resolves to WEB-INF/views/supplier-form.jsp
    }

    // Save or update supplier
    @PostMapping
    public String saveSupplier(@ModelAttribute Supplier supplier) {
        supplierService.saveOrUpdateSupplier(supplier);
        return "redirect:/suppliers";  // Redirect to the supplier list page
    }

    // Delete a supplier
    @GetMapping("/delete/{id}")
    public String deleteSupplier(@PathVariable Long id) {
        supplierService.deleteSupplier(id);
        return "redirect:/suppliers";
    }
}
