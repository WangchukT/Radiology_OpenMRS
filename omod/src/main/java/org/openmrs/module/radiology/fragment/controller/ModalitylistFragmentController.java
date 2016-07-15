/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.radiology.fragment.controller;

import java.util.Arrays;
import java.util.List;
import org.openmrs.Concept;
import org.openmrs.ConceptClass;
import org.openmrs.api.context.Context;
import org.openmrs.module.radiology.Modality;
import org.openmrs.module.radiology.study.RadiologyStudy;
import org.openmrs.ui.framework.fragment.FragmentModel;
import org.springframework.web.bind.annotation.RequestParam;

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
        RadiologyStudy setModality = new RadiologyStudy();
        String modalityConstant = "XA";
        for (String modList : saveModalityList) {
            if (modList.equals("Computed Radiography")) {
                modalityConstant = "CR";
            } else if (modList.equals("Magnetic Resonance")) {
                modalityConstant = "MR";
            } else if (modList.equals("Computed Tomography")) {
                modalityConstant = "CT";
            } else if (modList.equals("Nuclear Medicine")) {
                modalityConstant = "NM";
            } else if (modList.equals("Ultrasound")) {
                modalityConstant = "US";
            }
            
            setModality.setModality(Modality.valueOf(modalityConstant));
            //Modality mo = Modality.valueOf(modalityConstant);
            //System.out.println("List of modList   " + modList);
            // System.out.println("List of modality   " + mo);
            
        }
        
    }
    
}
