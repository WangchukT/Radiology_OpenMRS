<%
 ui.decorateWith("appui", "standardEmrPage")

ui.includeJavascript("uicommons", "datatables/jquery.dataTables.min.js")
ui.includeCss("uicommons", "datatables/dataTables_jui.css")
%>

${ ui.includeFragment("radiology", "modalitySoftware") }

${ ui.includeFragment("radiology", "breadcrumb") }



 
${ ui.includeFragment("radiology", "modalitylist",
        [   start: "2011-02-16",
            end: "2011-02-16 23:59:59.999",
            properties: ["location", "encounterDatetime"],
            
        ]) }





