<%@page import="Ajax.dataPulls"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Manage Applicants</title>
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
								<a class="nav-link active text-uppercase" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Add Applicants</a>
							</li>
							<li class="nav-item">
								<a class="nav-link text-uppercase" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">View/Edit</a>
							</li>
							
						</ul>
						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
								<p class="mb-0"> 
                                                                    <div class="card">
                    <div class="card-header">
                       
                    </div>
                    
<!--                        <h5>Form controls</h5>-->
                       
                        <div class="row">
                            <div class="col-md-12">
                                <form action="saveapplicants" enctype="multipart/form-data" method="POST">
                                    
						<h2 class='btn btn-success' style='text-align: center; width:100%;'><b>Add Applicants </b></h2>
					
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
<label for='solicitation_id'><b>NOFO Number<font color='red'>*</font></b></label>
<select required="true"  class='form-control' id='solicitation_id' name='solicitation_id'  >
<option value=''></option>
</select>
</div>


<div class='form-group col-md-4'>
<label for='organization_name'><b>Organization Name<font color='red'>*</font></b></label>
<input required="true"  type='input' class='form-control' id='organization_name' name='organization_name'  placeholder='Enter Organization Name'/>
</div>


<div class='form-group col-md-4'>
<label for='type_of_organization'><b>Type of Organization<font color='red'>*</font></b></label>
<select class='form-control' id='type_of_organization' name='type_of_organization'  >
<option value=''></option>
</select>
</div>







            </div>

       
  <div class="form-row">   


<div class='form-group col-md-4'>
<label for='postal_address'><b>Postal Address</b></label>
<input   type='input' class='form-control' id='postal_address' name='postal_address'  placeholder='Enter Postal Address'/>
</div>


<div class='form-group col-md-4'>
<label for='email'><b>Email Address<font color='red'>*</font></b></label>
<input required="true"  type='input' class='form-control' id='email' name='email'  placeholder='Enter Email Address'/>
</div>


<div class='form-group col-md-4'>
<label for='phoneno'><b>Phone Number<font color='red'>*</font></b></label>
<input required="true"  type='tel' class='form-control' id='phoneno' name='phoneno'  placeholder='Enter Phone Number'/>
</div>


</div>
  <div class="form-row">  

<div class='form-group col-md-4'>
<label for='executive_name'><b>Executive Name<font color='red'>*</font></b></label>
<input required="true"  type='input' class='form-control' id='executive_name' name='executive_name'  placeholder='Enter Executive Name'/>
</div>


<div class='form-group col-md-4'>
<label for='executive_title'><b>Executive Title<font color='red'>*</font></b></label>
<input required="true"  type='input' class='form-control' id='executive_title' name='executive_title'  placeholder='Enter Executive Title'/>
</div>


<div class='form-group col-md-4'>
<label for='has_registration_certificate'><b>Has Registration Certificate?<font color='red'>*</font></b></label>
<select required="true"  class='form-control' id='has_registration_certificate' name='has_registration_certificate'  >
<option value=''>Select Option</option>
<option value='Yes'>Yes</option>
<option value='No'>No</option>
</select>
</div>
</div>
  <div class="form-row">  

<div class='form-group col-md-4'>
<label for='nationality'><b>Nationality<font color='red'>*</font></b></label>
<select required="true"  class='form-control' id='nationality' name='nationality'  >
<option value=''>Select Option</option>
<option value='Kenya'>Kenya</option>
<option value='Tanzania'>Tanzania</option>
<option value='Uganda'>Uganda</option>
<option value='US'>US</option>
</select>
</div>


<div class='form-group col-md-4'>
<label for='has_pin_certificate'><b>Has Pin Certificate?<font color='red'>*</font></b></label>
<select required="true"  class='form-control' id='has_pin_certificate' name='has_pin_certificate'  >
<option value=''>Select Option</option>
<option value='Yes'>Yes</option>
<option value='No'>No</option>
</select>
</div>


<div class='form-group col-md-4'>
<label for='pin_number'><b>Pin Number</b></label>
<input   type='input' class='form-control' id='pin_number' name='pin_number'  placeholder='Enter Pin Number'/>
</div>

</div>
  <div class="form-row">  

<div class='form-group col-md-4'>
<label for='is_tax_compliant'><b>Is Tax Compliant?<font color='red'>*</font></b></label>
<select required="true"  class='form-control' id='is_tax_compliant' name='is_tax_compliant'  >
<option value=''>Select Option</option>
<option value='Yes'>Yes</option>
<option value='No'>No</option>
</select>
</div>


<div class='form-group col-md-4'>
<label for='tax_compliant_certificate_file'><b>Upload Tax Compliant Certificate</b></label>
<input   type='file' class='form-control' id='tax_compliant_certificate_file' name='tax_compliant_certificate_file'  placeholder='Enter Upload Tax Compliant Certificate'/>
</div>


<div class='form-group col-md-4'>
<label for='universal_entity_number'><b></b>Universal Entity Identifier
</label>
<input   type='input' class='form-control' id='universal_entity_number' name='universal_entity_number'  placeholder='Enter '/>
</div>

</div>
  <div class="form-row">  

<div class='form-group col-md-4'>
<label for='universal_entity_certificate_file'><b>Upload Universal entity Certificate</b></label>
<input   type='file' class='form-control' id='universal_entity_certificate_file' name='universal_entity_certificate_file'  placeholder='Enter Upload Universal entity Certificate'/>
</div>
                     

      
      
   




<div class='form-group col-md-4'>
<label for='pin_certificate_attachment_file'><b>Upload Pin Certificate Attachment</b></label>
<input  type='file' class='form-control' id='pin_certificate_attachment_file' name='pin_certificate_attachment_file'  placeholder='Enter Upload Pin Certificate Attachment'/>
</div>
      
      
<div class='form-group col-md-4'>
<label for='other_requirement_attachment_file'><b>Upload Other Attachments<font color="orange"> (to upload multiple files, zip them)</font></b></label>
<input type='file' class='form-control' id='other_requirement_attachment_file' name='other_requirement_attachment_file'  placeholder='Enter Upload Other Required Attachments'/>
</div>

      
      

</div>
  <div class="form-row"> 



         <div class='form-group col-md-4'>
<label for='final_eligibility_status'><b>Is the Applicant Eligible?<font color='red'>*</font></b></label>
<select required="true" class='form-control' id='final_eligibility_status' name='final_eligibility_status'  >
<option value=''>Select Option</option>
<option value='Eligible'>Eligible</option>
<option value='Ineligible'>In eligible</option>
</select>
</div>
          
            
            <div class='form-group col-md-4'>
                <label for='submit_frm'><b>.</b></label>
         <button id="submit_frm" type="submit" class="btn  btn-primary btn-sm form-control">Submit</button>   
            
         </div>
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
    <script src="assets/js/plugins/bootstrap.min.js"></script>
    <script src="assets/js/pcoded.min.js"></script>


   <script  src="assets/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
   <script type="text/javascript" src="assets/js/jquery.dataTables_1.3.min.js"></script>
    
   
    <script type="text/javascript" src="assets/js/dataTables.responsive.min.js"></script>
    
    <script type="text/javascript" src="assets/js/jquery.fileDownload.js"></script>
    
    
   <%if (session.getAttribute("applicants_response") != null) { %>
   <script type="text/javascript"> 
                    
                    var uju='<%=session.getAttribute("applicants_response")%>';
                    $('.ujumbe').html(uju);
                    $('.callalert').click();
                      
                    
                </script> <%
                session.removeAttribute("applicants_response");
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
              "lengthChange": true,responsive:true, 
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
    
  loadEdits('searchtable','applicants_details','loadedits','vw_applicants_details','table_id'); 
  
  
  
  
  function loadExistingData(recordid,maintbl,pki)
{ 
    
    //once the edit form is clicked, the assumption is that the add section will be loaded
    $('#home-tab').click();
    $('#home-tab').html("Edit Applicants");
    
   
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
    loadSelectOptionsPerField('type_of_organization','getorgtypes','');       
     loadSelectOptionsPerField('solicitation_id','getsolicitation',''); 
      



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


</script>    
</body>
</html>
