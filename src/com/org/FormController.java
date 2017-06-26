package com.org;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FormController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {

		return "/form";
	}

	@RequestMapping(value = "/", method = RequestMethod.POST)
	public ModelAndView mq(@ModelAttribute("formBean") FormBean input,
			ModelMap modelMap) throws IOException {
		
		System.out.println(input.getBtnId());
		
		if(input.getBtnId().equalsIgnoreCase("success")){
			modelMap.addAttribute("msg", "success");
		}else{
			modelMap.addAttribute("msg", "failure");
		}		
		return new ModelAndView("/form");
	}

}
