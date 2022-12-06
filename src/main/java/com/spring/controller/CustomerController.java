package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.entity.Customer;
import com.spring.services.Services;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	@Autowired
	private Services services;
	@GetMapping
	public String index(Model model, @RequestParam(name = "q",required = false) String key) {
		if (key!=null) {
			model.addAttribute("LIST", services.getAllByKeyWord(key));
		}
		else {
			model.addAttribute("LIST", services.getAll());
		}
		return "index";
	}
	@GetMapping("/addForm")
	public String showAddNew(Model model) {
		model.addAttribute("ITEM", new Customer());
		return "form-input";
	}
	@PostMapping("/saveOrUpdate")
	public String processSaveOrUpdate(@ModelAttribute("ITEM") Customer customer ) {
		services.saveOrUpdate(customer);
		return "redirect:/customer/";
	}
	@GetMapping("/updateForm")
    public String showFormForUpdate(@RequestParam("id") int id,
        Model theModel) {
        Customer theCustomer = services.getById(id);
        theModel.addAttribute("ITEM", theCustomer);
        return "form-input";
    }
	@GetMapping("/delete")
    public String deleteCustomer(@RequestParam("id") int id) {
        services.delete(id);
        return "redirect:/customer/";
    }
}
