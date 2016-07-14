/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.radiology.fragment.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import net.sourceforge.jtds.jdbc.DateTime;
import org.openmrs.Concept;
import org.openmrs.ConceptClass;
import org.openmrs.api.context.Context;
import org.openmrs.module.radiology.study.RadiologyStudy;
import org.openmrs.ui.framework.SimpleObject;
import org.openmrs.ui.framework.UiUtils;
import org.openmrs.ui.framework.fragment.FragmentModel;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author youdon
 */
public class ModalitylistFragmentController {
    
    
    public void controller(FragmentModel model) {
        ConceptClass modality_concept = Context.getConceptService()
                .getConceptClassByName("modality");
        
        List<Concept> modality_list = Context.getConceptService()
                .getConceptsByClass(modality_concept);
        
        model.addAttribute("modality_list", modality_list);
        
    }
    
    public void saveModality(FragmentModel model, @RequestParam(value = "modalityList[]") String[] modalityList) {
        
        List<String> saveModalityList = Arrays.asList(modalityList);
        
        for (String modList : saveModalityList) {
            System.out.println(modList);
        }
        
    }
    
}
