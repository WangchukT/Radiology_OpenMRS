/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.radiology.fragment.controller;

import java.util.List;
import org.openmrs.Concept;
import org.openmrs.ConceptClass;
import org.openmrs.api.context.Context;
import org.openmrs.ui.framework.fragment.FragmentModel;

/**
 *
 * @author tenzin
 */
public class ModalitylistFragmentController {
    
    
    public void controller(FragmentModel model) {
        
        ConceptClass modality_concept = Context.getConceptService()
                .getConceptClassByName("modality");
        
        List<Concept> modality_list = Context.getConceptService()
                .getConceptsByClass(modality_concept);
        
        model.addAttribute("modality_list", modality_list);
        
    }
    
}
