/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.radiology.fragment.controller;

import java.util.Date;
import java.util.List;
import net.sourceforge.jtds.jdbc.DateTime;
import org.openmrs.Concept;
import org.openmrs.ConceptClass;
import org.openmrs.api.context.Context;
import org.openmrs.module.radiology.study.RadiologyStudy;
import org.openmrs.ui.framework.fragment.FragmentModel;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author youdon
 */
public class ModalitylistFragmentController {
    
    
    //public List<Concept> getConceptsByClass(ConceptClass con2)  {
    
    public void controller(FragmentModel model) {
        
        ConceptClass con2 = Context.getConceptService()
                .getConceptClassByName("modality");
        
        List<Concept> con3 = Context.getConceptService()
                .getConceptsByClass(con2);
        
        model.addAttribute("con3", con3);
        
    }
    
}
