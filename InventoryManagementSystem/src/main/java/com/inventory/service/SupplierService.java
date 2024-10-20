package com.inventory.service;

import com.inventory.model.Supplier;
import com.inventory.repository.SupplierRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SupplierService {

    @Autowired
    private SupplierRepository supplierRepository;

    // Get all suppliers
    public List<Supplier> getAllSuppliers() {
        return supplierRepository.findAll();
    }

    // Get supplier by ID
    public Supplier getSupplierById(Long id) {
        return supplierRepository.findById(id).orElse(null);
    }

    // Save or update supplier
    public Supplier saveOrUpdateSupplier(Supplier supplier) {
        return supplierRepository.save(supplier);
    }

    // Delete supplier
    public void deleteSupplier(Long id) {
        supplierRepository.deleteById(id);
    }
}
