/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.radiology.page.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author tenzinyoudon
 */
@Controller
@RequestMapping("/module/radiology/hello")
public class HelloPageController {
    
    
    @RequestMapping(method = RequestMethod.GET)
    public String printHello(ModelMap model) {
        // model.addAttribute("message", "Hello GOGOGOGOGSpring MVC Tenzin Wangchuk Framework!");
        System.out.println("Go Go JJJJJJ  go");
        
        return "/module/radiology/hello";
        
    }
    
}
