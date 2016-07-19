
<% ui.includeCss("radiology", "modalitylist.css") %>
<% ui.includeJavascript("jquery.js") %>


<script>
jq = jQuery;
jq(document).ready(function() {
jq('#view-study').click(function() {

if(jq('#Save').data('clicked')) {
    alert("cliked Save")
      jq("#modality-concept-message").empty();
      jq("#modality-concept-message").text("Please add studies appearing in list to concept dictionary then refresh");
  
      
      
      
jq('input:checkbox[name=modlistt]').each(function() 
{    
    if(jq(this).is(':checked')){
      alert(jq(this).val());
      myFunctionT(jq(this).val()); }
    
});
       jq("#delete-modality").empty();
      jq("#delete-modality").val("Select Modality to View Study"); 
      jq('#delete-modality').attr('id','select-modality');
   
      jq("#view-study").empty();
      jq("#view-study").val("Delete selected studies"); 
      jq('#view-study').attr('id','delete-study');

   }
    else
    {
    alert("Please Save the data");
    }


  });
  
  
function myFunctionT(selectedValue) {
alert("helee " + selectedValue);


    if (selectedValue != "empty") {
        
 
        jq.getJSON('${ ui.actionLink("getStudyConcepts") }',
           {
             'studyconceptclass': selectedValue
            })
       .error(function(xhr, status, err) {
            alert('AJAX error ' + err);
        })
        .success(function(ret) {
                                
                                
                                
                                  for (var i = 0; i < ret.length; i++) {
                                    var conId = ret[i].conceptId;
                                    var conName = ret[i].displayString;
  
jq("#header ul").append(jq("<li>").html('<input type="checkbox" value="' + conId + '" name="' + conName + '" id="id' + i + '"><label for="id' + i + '">' + conName + '</label>'));

                                    }
                                
                                

                              

                            });

                }


            };


});

</script>



<script> 
    jq(function() {
    jq(document).ready(function() {
    jq("#delete-modality").on("click", function() {
    var resultDelete=jq('input[type="checkbox"]:checked');
  if(resultDelete.length > 0) {
    deleteModality = [];
    resultDelete.each(function() {
    deleteModality.push(jq(this).val());
    });
    alert(deleteModality + " is checked");
    jq(".checkbox input:checked").parent().remove();
    }
    else {
    alert("Nothing is checked");
    }
    });
    jq("#Save").on("click", function() {
    jq(this).data('clicked', true);
    var resultSave=jq('input[type="checkbox"]:checked');
   if(resultSave.length > 0) {
    saveModality = [];
    resultSave.each(function() {
    saveModality.push(jq(this).val());
    });
    alert(saveModality + " is checked");
    }
    else {
    alert("Nothing is checked");
    }
    jq.ajax({
    type: "POST",
    url: "${ ui.actionLink('saveModality') }",
    data : { modalityList: saveModality },
    cache: false,
    success: function(data){
    alert("Data Received");
    }
    });
    });
 
    
    

    
    });
    });
</script>


<div class="modality">

    <label id="modality-list" for modality-check> Modalities </label>
    <label id="modality-concept-message" for modality-concept-label> Please add Modality not appearing in list to concept dictionary and refresh  </label>
    <input type="button" name="modality-refresh" onclick="location.href='/openmrs/pages/radiology/adminInitialize.page'" id="modality-refresh" value="Refresh">

    <div class="list-modality">
           <div style="width:30%; float:left">
        <% modality_list.each { modalityname -> %>
        <label class="checkbox">
            <input id="modlistt" name ="modlistt" value="$modalityname"  type="checkbox">  ${ ui.format(modalityname) } 
            <input type="hidden" name="modlist" >  </label>
        <br>
        <% } %>
</div>

    <div id="header" style="width:70%; float:right">  
<ul class="tabs">
    
    </ul>
</div>
        
        <div class="modality-list-btn">
            
            <input type="button" name="delete-modality" id="delete-modality" value="Delete Selected Modality">
           <input type="submit" id="Save" value="Save">
            <input type="button" name="view-study" id="view-study" value="View Studies">
        </div>
    </div>



  






  

