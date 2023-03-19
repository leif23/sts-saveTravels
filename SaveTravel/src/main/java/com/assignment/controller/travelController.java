package com.assignment.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.assignment.Service.travelService;
import com.assignment.models.Travel;

@Controller
public class travelController {
	
	@Autowired
	travelService travelServ;
	
	@GetMapping("/")
	public String index() {
		return "redirect:/expenses";
	}
	
	@GetMapping("/expenses")
	public String Home(@ModelAttribute("travels") Travel travels, Model model) {
		
		List<Travel> saveTravel = travelServ.findAllTravel();
		model.addAttribute("allSaveTravel", saveTravel);
		return "index.jsp";
	}
	
	@PostMapping("/create/expense")
	public String createExpenses(@Valid @ModelAttribute("travels") Travel travels, BindingResult result, Model model) {
		
		if(result.hasErrors()) {
			List<Travel> saveTravel = travelServ.findAllTravel();
			model.addAttribute("allSaveTravel", saveTravel);
			return "index.jsp";
		}
		
		travelServ.createTravel(travels);
		return "redirect:/";
	}
	
	@GetMapping("/edit/{id}")
	public String editTravel( @PathVariable("id") Long id, @ModelAttribute("travels") Travel travels, Model model) {
		
		Travel saveTravels = travelServ.optTravel(id);
		model.addAttribute("allSaveTravels",saveTravels);
		return "editTravel.jsp";
	}
	
	@PutMapping("/edit/expense/{id}")
	public String editSaveTravels(@PathVariable("id") Long id, @Valid @ModelAttribute("travels") Travel travels, BindingResult result, Model model) {
		
		if(result.hasErrors()) {
			model.addAttribute("allSaveTravels", travelServ.optTravel(id));
			return "editTravel.jsp";
		}
		travelServ.editTravel(travels);
		return"redirect:/";
		}

		@GetMapping("/show/{id}")
		public String show(@PathVariable("id") Long id, Model model) {
			model.addAttribute("allSaveTravels", travelServ.optTravel(id));
			
			return "show.jsp"; 
		}
//	

	@GetMapping("/delete/{id}")
	public String Destroy(@PathVariable("id") Long id){
			travelServ.deleteTravel(id);
		return "redirect:/";
	}
	
	
	
}
