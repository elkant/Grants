<%@page import="Ajax.dataPulls"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Sub-recipients</title>
	<!-- HTML5 Shim and Respond.js IE11 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 11]>
		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
	<!-- Meta -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="description" content="" />
	<meta name="keywords" content="">
	<meta name="author" content="Emmanuel Kaunda" />
        <!--<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">-->
	<!-- Favicon icon -->
        <link rel="icon" href="assets/images/grants.png" type="image/x-icon">

	<!-- vendor css -->
	<link rel="stylesheet" href="assets/css/style.css">
	 <link rel="stylesheet" type="text/css" href="assets/bootstrap-datepicker/css/datepicker.css" />
	  <link href="assets/css/dataTables.bootstrap.min.css" rel="stylesheet">
          <link href="assets/css/responsive.bootstrap.min.css" rel="stylesheet">

</head>
<body class="">
	<!-- [ Pre-loader ] start -->
	<div class="loader-bg">
		<div class="loader-track">
			<div class="loader-fill"></div>
		</div>
	</div>
	<!-- [ Pre-loader ] End -->
	<!-- [ navigation menu ] start -->
        <%@include file="menu/menu.jsp" %>
	<!-- [ navigation menu ] end -->
	<!-- [ Header ] start -->
	<header class="navbar pcoded-header navbar-expand-lg navbar-light header-dark">
		
			
				<div class="m-header">
					<a class="mobile-menu" id="mobile-collapse" href="#!"><span></span></a>
					
					<a href="#!" class="mob-toggler">
						<i class="feather icon-more-vertical"></i>
					</a>
				</div>
            <%@include  file="menu/navbar.jsp"%>
				
			
	</header>
	<!-- [ Header ] end -->
	
	

<!-- [ Main Content ] start -->
<div class="pcoded-main-container">
	<div class="pcoded-content">
		<!-- [ breadcrumb ] start -->
		
                
                <div class="toast hide toast-3s" role="alert" aria-live="assertive" data-delay="3000" aria-atomic="true">
<div class="toast-header">
<small class="text-muted"></small>
<button type="button" class="m-l-5 mb-1 mt-1 close" data-dismiss="toast" aria-label="Close">
<span>&times;</span>
</button>
</div>
<div class="toast-body"><p class='ujumbe'></p></div>
</div>		
		
		
<p class='callalert' onclick="$('.toast-3s').toast('show')">.</p>
                
		<!-- [ breadcrumb ] end -->
		<!-- [ Main Content ] start -->
		<div class="row">
			<!-- [ card ] start -->
			
			<div class="col-xl-12">
				<div class="row">
				<div class="col-sm-12">
				<div class="card">
					
					<div class="card-body">
						<ul class="nav nav-tabs mb-3" id="myTab" role="tablist">
							<li class="nav-item">
								<a class="nav-link active text-uppercase" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="false">Update Sub-Recipients</a>
							</li>
							<li class="nav-item">
								<a class="nav-link  text-uppercase" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="true">View/Edit</a>
							</li>
							
						</ul>
						<div class="tab-content" id="myTabContent">
							<div class="tab-pane  show active " id="home" role="tabpanel" aria-labelledby="home-tab">
								<p class="mb-0"> 
                                                                    <div class="card">
                    <div class="card-header">
                       
                    </div>
                    
<!--                        <h5>Form controls</h5>-->
                       
                        <div class="row">
                            <div class="col-md-12">
                                <form action="savesubrecipient" enctype="multipart/form-data" method="POST">
                                    
						<h2 class='btn btn-success' style='text-align: center; width:100%;'><b>Update Sub-recipient</b></h2>
				<div class="form-row">
                                        
                                        <%
                                            String uid="unknown";
               if (session.getAttribute("kd_session") != null) {
             
              HashMap<String,String> hm=new HashMap<String,String>();
            
            hm=(HashMap<String, String>)session.getAttribute("kd_session");
            
             uid=hm.get("userid");
                                            }
                                        
                                        dataPulls dp= new dataPulls();
                                        

                                        
                                        %>
                                        
                                        
                                        <a id="dwn"></a>
<input required="true" value="<%=dp.getRandNo(1,10000)%>" type='hidden' class='form-control' id='table_id' name='table_id'  placeholder='Enter id'/>
<input required="true" value="<%=uid%>" type='hidden' class='form-control' id='user_id' name='user_id'  placeholder='User id'/>
                 
<div class='form-group col-md-4'>
<label for='subrec_name'><b>Sub Recipient Name<font color='red'>*</font></b></label>
<select required='true' class='form-control' id='subrec_name' name='subrec_name'  >
<option value=''></option>
</select>
</div>

<div class='form-group col-md-4'>
<label for='subaward_number'><b>Sub Award Number<font color='red'>*</font></b></label>
<input type='input' class='form-control' id='subaward_number' name='subaward_number'  placeholder='Enter SubAward Number'/>
</div>

<div class='form-group col-md-4'>
<label for='subaward_type'><b>Sub Award Type<font color='red'>*</font></b></label>
<select onchange="showHiddenElement('subaward_type','other','subaward_type_other');" required='true' class='form-control' id='subaward_type' name='subaward_type'  >
<option value=''></option>
</select>
</div>



</div>









  <div class="form-row"> 



<div style="display:none;" class='form-group col-md-4 subaward_type_other'>
<label for='subaward_type_other'><b>Sub Award Type Other<font color='red'>*</font></b></label>
<input  type='input' class='form-control' id='subaward_type_other' name='subaward_type_other'  placeholder='Enter Sub Award Type Other'/>
</div>

<div class='form-group col-md-4'>
<label for='subaward_startdate'><b>Sub Award Start Date<font color='red'>*</font></b></label>
<input required="true" type='input' class='form-control tarehe' id='subaward_startdate' name='subaward_startdate'  placeholder='Enter Sub Award Start Date'/>
</div>

<div class='form-group col-md-4'>
<label for='subaward_enddate'><b>Sub Award End Date<font color='red'>*</font></b></label>
<input required="true" type='input' class='form-control tarehe_kesho' id='subaward_enddate' name='subaward_enddate'  placeholder='Enter Sub Award End Date'/>
</div>

      
<div class='form-group col-md-4'>
<label for='reportingcurrency'><b>Reporting Currency<font color='red'>*</font></b></label>
<select required='true' class='form-control' id='reportingcurrency' name='reportingcurrency'  >
<option value=''></option>
</select>
</div>
      
      
</div>



  <div class="form-row"> 







<div class='form-group col-md-4'>
<label for='reportingfrequency'><b>Reporting Frequency<font color='red'>*</font></b></label>
<select required='true' class='form-control' id='reportingfrequency' name='reportingfrequency'  >
<option value=''></option>
</select>
</div>

<div class='form-group col-md-4'>
<label for='applicable_indirectcost'><b>Applicable Indirect Cost<font color='red'>*</font></b></label>
<select required='true' class='form-control' id='applicable_indirectcost' name='applicable_indirectcost'  >
<option value=''></option>
</select>
</div>


      <div class='form-group col-md-4'>
<label for='entity_type'><b>Entity Type<font color='red'>*</font></b></label>
<select onchange="showHiddenElement('entity_type','other','entity_type_other');" required='true' class='form-control' id='entity_type' name='entity_type'  >
<option value=''></option>
</select>
</div>
      
</div>



  <div class="form-row"> 





<div  style="display:none;" class='form-group col-md-4 entity_type_other'>
<label for='entity_type_other'><b>Other Entity Type</b></label>
<input type='input' class='form-control' id='entity_type_other' name='entity_type_other'  placeholder='Enter Other Entity Type'/>
</div>

      
<div class='form-group col-md-4'>
<label for='costshare_obligation'><b>Cost Share Obligation <font color='orange'> (in % )</font><font color='red'>*</font></b></label>
<input onkeypress='return numbers(event);' required="true" type="input" required='true' class='form-control' placeholder='eg 0.01' id='costshare_obligation' name='costshare_obligation'  />

</div>
      
      
      
<div class='form-group col-md-4'>
<label for='subaward_agreement_filename'><b>Sub Award Agreement File<font color='red'>*</font></b></label>
<input required='true' type='file' class='form-control' id='subaward_agreement_filename' name='subaward_agreement_filename'  placeholder='Enter Sub Award Agreement File'/>
</div>
      
    
      
<div class='form-group col-md-4'>
<label for='subaward_budget_filename'><b>Sub Award Budget File<font color='red'>*</font></b></label>
<input required='true' type='file' class='form-control' id='subaward_budget_filename' name='subaward_budget_filename'  placeholder='Enter Sub Award Budget'/>
</div>
      
</div>



  <div class="form-row"> 




<div class='form-group col-md-4'>
<label for='subrecipient_status'><b>Sub Recipient Status<font color='red'>*</font></b></label>
<select required='true' class='form-control' id='subrecipient_status' name='subrecipient_status'  >
<option value=''></option>
</select>
</div>

      
        <div class='form-group col-md-4'>
                <label for='submit_frm'><b>.</b></label>
         <button id="submit_frm" type="submit" class="btn  btn-primary btn-sm form-control">Submit</button>   
            
         </div>
      
</div>



  



 
  
  <div class="form-row"> 



   
          
            
          
</div>
 </form>
                 <div class="toast hide toast-3s" role="alert" aria-live="assertive" data-delay="3000" aria-atomic="true">
<div class="toast-header">
<small class="text-muted"></small>
<button type="button" class="m-l-5 mb-1 mt-1 close" data-dismiss="toast" aria-label="Close">
<span>&times;</span>
</button>
</div>
<div class="toast-body"><p class='ujumbe'></p></div>
</div>	                       
                                        
                                        
                                        
                            </div>
                         
                        </div>
							
							
							
							
						</div>
					</div>
                                                    
                                                    <div class="tab-pane fade active" id="profile" role="tabpanel" aria-labelledby="profile-tab">
							
                                                        <div id="searchtable">
                                  Edit Form
                                                                      </div> 
                                                        
                                                        </div>
				</div>
			</div>
					
				</div>
			</div>
                        
			
			<!-- [ card ] end -->
		</div>
		<!-- [ Main Content ] end -->
	</div>
</div>


    <!-- Required Js -->
    <script src="assets/js/vendor-all.min.js"></script>
    <!--<script src="assets/js/plugins/bootstrap.min.js"></script>-->
    <script src="assets/js/plugins/bootstrap.min.js"></script>
    <script src="assets/js/pcoded.min.js"></script>


   <script  src="assets/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
   <script type="text/javascript" src="assets/js/jquery.dataTables_1.3.min.js"></script>
    
    <script type="text/javascript" src="assets/js/jquery.fileDownload.js"></script>
    <script type="text/javascript" src="assets/js/dataTables.responsive.min.js"></script>
    
    
   <%if (session.getAttribute("subrecipients_response") != null) { %>
   <script type="text/javascript"> 
                    
                    var uju='<%=session.getAttribute("subrecipients_response")%>';
                    $('.ujumbe').html(uju);
                    $('.callalert').click();
                      
                    
                </script> <%
                session.removeAttribute("subrecipients_response");
                            }

    %>
    
    
     <%if (session.getAttribute("file_upload") != null) { %>
   <script type="text/javascript"> 
                    
                    var uju='<%=session.getAttribute("file_upload")%>';
                    $('.ujumbe').html(uju);
                    $('.callalert').click();
                      
                    
                </script> <%
                session.removeAttribute("file_upload");
                            }

    %>
    
    
<script>
    
     function numbers(evt){
var charCode=(evt.which) ? evt.which : event.keyCode;
if(charCode > 31 && (charCode < 48 || charCode>57))
return false;
return true;
}


   $(".tarehe_kitambo").datepicker({
    endDate: "now()",
    clearBtn: true,
    format: "yyyy-mm-dd"
}).on('changeDate', function(ev){
    $(this).datepicker('hide');
//    var mk=$("#weekstart").val();
////    var mk=addDays($("#weekstart").val(),6);
//    //alert(mk);
//    $("#weekend").val(mk);
});



      $(".tarehe").datepicker({
    startDate: "2021-05-01",
    endDate: "now()",
    clearBtn: true,
    format: "yyyy-mm-dd"
}).on('changeDate', function(ev){
    $(this).datepicker('hide');
//    var mk=$("#weekstart").val();
////    var mk=addDays($("#weekstart").val(),6);
//    //alert(mk);
//    $("#weekend").val(mk);
});


    $(".tarehe_kesho").datepicker({
    startDate: "2021-05-01",
    clearBtn: true,
    format: "yyyy-mm-dd"
}).on('changeDate', function(ev){
    $(this).datepicker('hide');
//    var mk=$("#weekstart").val();
////    var mk=addDays($("#weekstart").val(),6);
//    //alert(mk);
//    $("#weekend").val(mk);
});




 

function loadEdits(elementtoappend,tbl,act,vwtbl,pkid){
      
  //now load the data
          $.ajax({
                    url:'dataPulls',                            
                    type:'post',
                    dataType: 'html',  
                    data:{act:act,
                        table_docker:elementtoappend,
			tablename:tbl,
			vwtable:vwtbl,pkid:pkid},
                    success: function(data) 
                    {
                        
            $(document).ready(function(){
                        
                        var dt = data;
            
//<label class='btn btn-success'>Edit</label>          
$("#"+elementtoappend).html(""+dt);
              
//          $('#searchtable_'+elementtoappend).DataTable({              
//              "autoWidth": true,
//              "paging": true,
//              "pagingType": "full",
//              "lengthChange": false                    
//          });
          
          
          var table = $('#searchtable_'+elementtoappend).DataTable({
              "autoWidth": true,
              "paging": true,
              "pagingType": "full",
              "lengthChange": false,responsive: true,  
              "order": [[0,'desc']]});
 
//    $('#searchtable_'+elementtoappend+' tbody').on( 'click', 'tr', function () {
//        if ( $(this).hasClass('selected') ) {
//            $(this).removeClass('selected');
//             $('#btnDeleteRow').hide();
//        }
//        else {
//            table.$('tr.selected').removeClass('selected');
//            $(this).addClass('selected');
//             $('#btnDeleteRow').show();
//        }
//    } );
 
//    $('#btnDeleteRow').click( function () {
//        
//     var tablerowid=table.$('tr.selected').attr('id');
//        
//        if(ConfirmDelete()===true){
//        
//        deletedata(tablerowid);
//        
//        table.row('.selected').remove().draw( false );
//        
//        
//                        
//                    }});
          
 
        });
                        
                    }});    
         
           
            
          
    
}
    
  loadEdits('searchtable','subrecipient_infor','loadedits','vw_subrecipient_details','table_id'); 
  
  
  
  
  function loadExistingData(recordid,maintbl,pki)
{ 
    
    //once the edit form is clicked, the assumption is that the add section will be loaded
    $('#home-tab').click();
    $('#home-tab').html("Edit Assessments");
    
   
//    console.log("_"+fc+"vs"+dt);

            
 
            
           
            
            //now load the data
          $.ajax({
                    url:'dataPulls',                            
                    type:'post',  
                    data:{
                        act:'loadrecordx',
                        tablename:maintbl,
                        pkid:pki,
                        pkidval:recordid
                    },
                    dataType: 'json',  
                    success: function(data) 
                    {
                        console.log(data);
                        
                        const keys = Object.keys(data[0]);  
                        console.log(keys);
for (const key in data[0]) 
{  
    
    var ky=key;
    var vl=data[0][key];
    
    
    //don't include 
    if(vl.indexOf(".")<0){
     $("#"+ky).val(vl);
 }
  
}
                    }  
//});
                        
                  
//                         $('.dates').datepicker({
//                             todayHighlight: true, daysOfWeekDisabled: "0,6",clearBtn: true, autoclose: true,format: "yyyy-mm-dd",
//     });
     
   
                        
                        
                    });    
             
           
            
            
    
    
    
}

  
  
  
  function loadSelectOptionsPerField(elemid,act,selval){
    
            //now load the data
          $.ajax({
                    url:'dataPulls',                            
                    type:'post',  
                    dataType: 'html',  
                    data:{act:act,                         
                         loadmtrs_sel_val:selval},
                    success: function(data) 
                    {
                        var dt = data;
       
          $("#"+elemid).html(dt);
                        
                    }});    
         
           
   
          
    
}
         
     loadSelectOptionsPerField('subrec_name','getQualifiedApplicants',''); 
     loadSelectOptionsPerField('subaward_type','getsubawardtypes_subrecipients',''); 
     loadSelectOptionsPerField('reportingcurrency','getcurrency',''); 
     loadSelectOptionsPerField('reportingfrequency','getreportingfrequency',''); 
     loadSelectOptionsPerField('applicable_indirectcost','getapplicableindirectcost',''); 
     loadSelectOptionsPerField('entity_type','getentitytype',''); 
     loadSelectOptionsPerField('subrecipient_status','getsubrecipientstatus',''); 
      



 function dltrw(rw,tbl,act,tblid)
 {
     
     var result = confirm("Are you sure you want to delete this row?");
if (result) {
    //Logic to delete the item

    
            //now load the data
          $.ajax({
                    url:'dataPulls',                            
                    type:'post',  
                    dataType: 'html',  
                    data:{act:act,                         
                          tablename:tbl,
                          pkid:tblid,
                        pkidval:rw},
                    success: function(data) 
                    {
                        var dt = data;
       
          refreshPage();
                        
                    }});    
            }
           
   
          
    
}

 function OpenFile(path)
 {
     
  //alert("Open File Called");
    //Logic to open the file
    
    
    var pt=decodeURIComponent(path);
    console.log(path);
    console.log(pt);
    
    var ur ="downloadFiles?fp=" + pt;
                    console.log(ur);
                    $.fileDownload(ur).done(function () {                       
                    }).fail(function () {
                        alert('File generation failed, kindly try again!');
                       
                    });

    
}


function refreshPage(){
    
      window.location.reload();
    
}


function autosum(sourceindics,dest){
    
    var elms=sourceindics.split(",");
    
    var ttl=0;
    for(var x=0;x<elms.length;x++){
    if($("#"+elms[x]).val()!=='')
    {
      ttl=ttl+parseInt($("#"+elms[x]).val()); 
    }    
        
        
    }
    $("#"+dest).val(ttl);
}


function showHiddenElement(primeelement,ifvalueis,unhide_eleme){
    
    
    var se=$("#"+primeelement).val();
    
    if(se===ifvalueis){ $("."+unhide_eleme).show(); } else{ $("."+unhide_eleme).hide();$("#"+unhide_eleme).val(""); }
    
    
    
}
</script>    
</body>
</html>
