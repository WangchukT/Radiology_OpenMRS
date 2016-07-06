   <% ui.includeCss("radiology", "modalitylist.css") %>
 <% ui.includeJavascript("jquery.js") %>
<% ui.includeJavascript("jquery-ui.js") %>
 <%= ui.resourceLinks() %>
   
   
    <script> 
    jq(function() {
  
   
 jq("#delete-modality").on("click", function() {
 jq(".checkbox input:checked").parent().remove();
   
   
   
});
 
  
   
  
   
  jq("#ref_butn").click(function(){
 location.reload();
  });
   
   
   
   
   
   });
   
   
   
  
   
   
   </script>
   
   <div class="modality">
     
 <label id="modality-list" for modality-check> Modalities </label>
   
 <label id="modality-concept-message" for modality-concept-label> Please add Modality not appearing in list to concept dictionary and refresh  </label>

 
  
 <input type="button" name="modality-refresh" onclick="location.href='/openmrs/pages/radiology/adminInitialize.page'" id="modality-refresh" value="Refresh">
   
  
   
   
   <form method="POST">

   
    
            
    <% con3.each { route -> %>

  <label class="checkbox">
    <input id="modlist" name ="modlist" value="${ ui.format(route) }"  type="checkbox">  ${ ui.format(route) } </label>
   <br>
                   <% } %>
 


     <input type="button" name="save" id="save" value="Save">
</form>


    
   <div class="modality-list-btn">
 <input type="button" name="delete-modality" id="delete-modality" value="Delete Selected Modality">
    <input type="button" name="view-studies" id="view-studies" value="View Studies">
   
   
  
 
   </div>
  
</div>


   
  
   
   
<br>

   
 <button id="ref_butn">Refresh the page!</button>

<form method="POST">
 
           
    <% con3.each { route -> %>

  <label class="checkbox">
    <input type="checkbox" name="vehicle" value="${ ui.format(route) }" >  ${ ui.format(route) } </label>
   <input type="hidden" name="vehicle" value="${ ui.format(route) }" > 
   <br>
                   <% } %>
   
   
   
  <input type="submit" value="Submit">
</form>
   
		
      <script type = "text/javascript" language = "javascript">
         jq(document).ready(function() {
            jq("#driver").click(function(event){
               jq('.modality').load('${ ui.actionLink("getEncounters") }');
   

            });
         });
      </script>
   
   
   
  <p>Click on the button to load /jquery/result.html file −</p>
		
      <div id = "stage" style = "background-color:cc0;">
         STAGE
      </div>
		
      <input type = "button" id = "driver" value = "Load Data" />
		