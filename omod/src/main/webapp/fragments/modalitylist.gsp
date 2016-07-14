<% ui.includeCss("radiology", "modalitylist.css") %>
<% ui.includeJavascript("jquery.js") %>




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

<div>
        <% modality_list.each { modalityname -> %>
        <label class="checkbox">
        <input id="modlist" name ="modlist" value="${ ui.format(modalityname) }"  type="checkbox">  ${ ui.format(modalityname) } </label>
        <input type="hidden" name="modlist" value="${ ui.format(modalityname) }" > 
        <br>
        <% } %>
        <div class="modality-list-btn">
            <input type="submit" id="Save" value="Save">
            <input type="button" name="delete-modality" id="delete-modality" value="Delete Selected Modality">
            <input type="button" name="view-study" id="view-study" value="view studies">
        </div>
    </div>
</div>


