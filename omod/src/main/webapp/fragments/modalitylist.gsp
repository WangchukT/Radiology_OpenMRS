<% ui.includeCss("radiology", "modalitylist.css") %>
<% ui.includeJavascript("jquery.js") %>
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

    <form >

        <% modality_list.each { modalityname -> %>

        <label class="checkbox">
            <input id="modlist" name ="modlist" value="${ ui.format(modalityname) }"  type="checkbox">  ${ ui.format(modalityname) } </label>
        <br>
        <% } %>

        <input type="button" name="save" id="save" value="Save">
    </form>

    <div class="modality-list-btn">
        <input type="button" name="delete-modality" id="delete-modality" value="Delete Selected Modality">
        <input type="button" name="view-studies" id="view-studies" value="View Studies">

    </div>

</div>



