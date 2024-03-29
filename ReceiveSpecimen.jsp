<%-- 
    Document   : view_order
    Created on : Nov 24, 2016, 12:24:01 PM
    Author     : Ahmed
--%>
<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">   
        <title>Main Page</title>
         <%@include file="../assets/header.html"%>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="assets/js/jquery.min.js"></script>
        <!-- Custom styles for this template -->
        <link rel="stylesheet" href="assets/css/loading.css">
        <link href="assets/datepicker/jquery-ui.css" rel="stylesheet">    
        <link href="assets/datepicker/jquery-ui.css" rel="stylesheet">
        <script src="assets/datepicker/jquery-ui.js"></script>
        <script src="assets/js/form-validator.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script> 
        <script src="assets/js/w3data.js"></script>
        <script src="assets/js/bootbox.min.js"></script>  
        
    </head>
    <body>
      
      <div class="container-fluid">
          <div class="row">
          <!-- menu side -->		
                <%@include file = "libraries/sideMenus.jsp" %>
                <!-- menu side -->
            <div class="main" style="background: #f2f4f8;">
                <!-- menu top -->
                <%@include file = "libraries/topMenus.html" %>
                <!-- menu top -->
                <div class="row">
                    
                    <div class="col-md-12">
                        <div class="thumbnail">


                            <!-- Tab Menu -->

                            <div class="tabbable-panel">
                                <div class="tabbable-line">
                                    <ul class="nav nav-tabs ">
                                        <li class="active">
                                            <a href="#tab_default_1" data-toggle="tab">
                                                Receive Specimen </a>
                                        </li>

                                    </ul>
                                    <!-- tab content -->
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="tab_default_1">
                                                <%
                                                Conn conn = new Conn();    
                                                String pmi = request.getParameter("pmi");
                                                String specimen_no1 = request.getParameter("specimen_no");
                                                String query1 = "SELECT pb.`PMI_NO`, pb.`NEW_IC_NO`, pb.`PATIENT_NAME`,ls.order_no,ls.specimen_no,ls.`Collection_date`,ls.`Collection_time`,lom.order_date FROM pms_patient_biodata pb,lis_specimen ls,lis_order_master lom WHERE pb.`PMI_NO` = ls.pmi_no AND ls.pmi_no =lom.pmi_no AND pb.`PMI_NO` = '"+pmi+"' AND ls.specimen_no = '"+specimen_no1+"' GROUP BY(ls.specimen_no)";
                                                ArrayList<ArrayList<String>> q2 = conn.getData(query1);
                                                %>  
                                           
                                    <div class="row">

                                       <%if (q2.size() > 0) 
                                            {
                                                for (int i = 0; i < q2.size(); i++) 
                                            {%> 
                                            <br>

                                    <div class="col-xs-6 col-sm-6 col-md-6">
                                        <address>
                                            <br>
                                            <br>
                                        <p>
                                            <em>PMI No: <%=q2.get(i).get(0)%> </em>
                                        </p>
                                        <p>
                                            <em>IC No: <%=q2.get(i).get(1)%></em>
                                        </p>
                                        <p>
                                            <em>Name: <%=q2.get(i).get(2)%></em>
                                        </p>
                                        <p>
                                            <em>Registration No: </em>
                                        </p>
                                        <p>
                                            <em>Order No: <%=q2.get(i).get(3)%></em>
                                        </p>
                                        <p>
                                            <em>Order Date: <%=q2.get(i).get(7)%></em>
                                        </p>
                                        <p>
                                            <em>Order Time: <%=q2.get(i).get(7)%></em>
                                        </p>
                                        </address>  
                                    </div>

                                    <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                        </br>
                                        <p>
                                            <em>Specimen No: <%=q2.get(i).get(4)%></em>
                                        </p>
                                        <p>
                                            <em>Specimen Type: <%%></em>
                                        </p>
                                         <p>
                                            <em>Collection Date: <%=q2.get(i).get(5)%></em>
                                        </p>
                                         <p>
                                            <em>Collection Time: <%=q2.get(i).get(6)%></em>
                                        </p>

                                    </div>          
                                         <%
                                           }}
                                         %>
                                    </div>         
<hr>
                    
    <h3 class="headerTitle">Order Item</h3>
    <div class="table-responsive" id='viewVODpage'>
        
    <table id="MTC"  class="table table-striped table-bordered" cellspacing="0" width="100%">
                    <%
                        String pmi2 = request.getParameter("pmi");
                        String specimen_no = request.getParameter("specimen_no");
                                
                         String query4 = "SELECT ls.specimen_no,lod.item_cd, lod.item_name, lod.spe_container, lod.volume, lod.spe_source, lod.requestor_comments FROM lis_order_detail lod,lis_specimen ls WHERE ls.item_cd = lod.item_cd AND ls.specimen_no = '"+specimen_no+"' AND ls.pmi_no='"+pmi2+"' GROUP BY(lod.item_cd)";
                         ArrayList<ArrayList<String>> q4 = conn.getData(query4);    
                     %>
                     <input type="text" id="pmi" value="<%=pmi2%>" style="display: none;"><input type="text" id="specimen_no" value="<%=specimen_no%>" style="display: none;">
    <thead>
        <tr>
                <th class="col-sm-1">Item Code</th>
                <th class="col-sm-1">Item Name</th>
                <th class="col-sm-1">Specimen Container</th>
                <th class="col-sm-1">Volume</th>
                <th class="col-sm-1">Specimen Source</th>
                <th class="col-sm-1">Requestor Comment</th>
                <th class="col-sm-1">Collection Remark</th>
                <th class="col-sm-1">TCA Date</th>
        </tr>
    </thead>
    <tbody>

       
         <%if (q4.size() > 0) 
           {
                for (int i = 0; i < q4.size(); i++) 
           {%> 
        <tr>    
                <td><%=q4.get(i).get(1)%></td>
                <td><%=q4.get(i).get(2)%></td>
                <td><%=q4.get(i).get(3)%></td>
                <td><%=q4.get(i).get(4)%></td>
                <td><%=q4.get(i).get(5)%></td>
                <td><%=q4.get(i).get(6)%></td>
                <td></td>
                <td></td>
        <%
                }
            }
        %>
             
          
        </tr>
       
    </tbody>
</table>
        <div class="col-xs-12 col-md-12">
            <button type="button" class="btn btn-primary" id="sendAccept">Send Specimen</button> To <select name="healthCentre" id="healthCentre"><option>Select Healthcare</option>
                    <option value="Sample Lab 1">Sample Lab 1</option>
                    <option value="Sample Lab 2">Sample Lab 2</option>
                    <option value="Sample Lab 3">Sample Lab 3</option>
                </select>
            <div class=" pull-right">
                <button type="button" class="btn btn-default" id="reject" data-toggle="modal" data-target="#reject_form">Reject Specimen</button>
                <div class="modal fade" id="reject_form" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
                                      <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><%= new SimpleDateFormat("HH:mm:ss").format(new java.util.Date())%></button>
                                                    <h4 class="modal-title" id="myModalLabel">Reject Specimen</h4>
                                                </div>
                                                    <br><br>
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1"> Reason: </label>
                                                        <textarea name="career[message]" class="form-control" id="fcomment" placeholder="Write your reason" ></textarea>
                                                    </div>
                                                    <div class="form-group pull-right">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                        <button type="submit" class="btn btn-primary" id="sub_reject">Submit</button>
                                                    </div>
                                            </div>
                                        </div>
                                      </div>
                                  </div>
                <button type="button" class="btn btn-default" id="back">Back</button>
            </div></div>
        
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Tab Menu -->

                        </div>
                    </div>
                </div>

            </div>
    </div>
    </div>
      </div>
        </form>
             <script type="text/javascript" charset="utf-8">
           
   $(document).ready(function() {
    $('#orderRecieve').DataTable();
} );
    </script>
            <script>
        w3IncludeHTML();
        $(document).ready(function () { 
                     $("#back").click(function () {
                           window.location.replace("ManageResult.jsp");
                        });
                        
                     $("#sub_reject").click(function () {
                           var fcomment = $("#fcomment").val(); 
                           var pmi = $("#pmi").val();
                           var specimen_no = $("#specimen_no").val();
                           
                           $.ajax({
                                url: "tRejectSpecimen.jsp",
                                type: "post",
                                data: {
                                    fcomment: fcomment,
                                    pmi: pmi,
                                    specimen_no: specimen_no
                                },
                                timeout: 10000,
                                
                                success: function(data) {
                                        alert("Specimen reject succesfully");
                                         window.location.replace("ManageResult.jsp");
                                         $("#basicModal").hide();
                                         $(".modal-backdrop").hide();
                                    
                                },
                                
                            });
                            
                        });
                        
                        $("#sendAccept").click(function () {
                           var healthCentre = $("#healthCentre").val(); 
                           var pmi = $("#pmi").val();
                           var specimen_no = $("#specimen_no").val();
                           
                           $.ajax({
                                url: "tAcceptSpecimen.jsp",
                                type: "post",
                                data: {
                                    healthCentre: healthCentre,
                                    pmi: pmi,
                                    specimen_no: specimen_no
                                },
                                timeout: 10000,
                                success: function(data) {
                                     alert("Specimen Accept succesfully");
                                         window.location.replace("ManageResult.jsp");
                                         $("#basicModal").hide();
                                         $(".modal-backdrop").hide();
                                     
                                },
                            });
                            
                        });
                    });
        $(document).ready(function () {

            $("#headerindex").load("libraries/header.html");
            $("#topmenuindex").load("libraries/topMenus.html");
            $("#sidemenus").load("libraries/sideMenus.jsp");
        });

    </script>
</html>
