<%@page import="Ajax.dataPulls"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Manage Grants</title>
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
	<!-- Favicon icon -->
        <link rel="icon" href="assets/images/grants.png" type="image/x-icon">

	<!-- vendor css -->
	<link rel="stylesheet" href="assets/css/style.css">
	 <link rel="stylesheet" type="text/css" href="assets/bootstrap-datepicker/css/datepicker.css" />
	  <link href="assets/css/dataTables.bootstrap.min.css" rel="stylesheet">

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
								<div class="toast-body">
									<p class='ujumbe'></p>
								</div>
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
								<a class="nav-link active text-uppercase" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Add Grants</a>
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
                                <form action="savegrants" class=''>
                                    
						<h2 class='btn btn-success' style='text-align: center; width:100%;'><b>Add Grants Information</b></h2>
					
                                    <div class="form-row">
                                        
                                        <%
                                        
                                        dataPulls dp= new dataPulls();
                                        

                                        
                                        %>
                                        
                                        <input required="true" value="<%=dp.getRandNo(1,10000)%>" type='hidden' class='form-control' id='grant_id' name='grant_id'  placeholder='Enter id'/>
<div class='form-group col-md-4'>
<label for='donor_name'><b>Donor Name <font color='red'>*</font></b></label>
<input required="true" type='input' class='form-control' id='donor_name' name='donor_name'  placeholder='Enter Donor Name'/>
</div>
                                    
                                    
<div class='form-group col-md-4'>
<label for='donor_code'><b>Donar Code<font color='red'>*</font></b></label>
<input required="true" type='input' class='form-control' id='donor_code' name='donor_code'  placeholder='Enter Donar Code'/>
</div>
                                    
                                    
<div class='form-group col-md-4'>
<label for='prime_recipient'><b>Prime Recipient<font color='red'>*</font></b></label>
<input value='Deloitte & Touche Limited' required="true" type='input' class='form-control' id='prime_recipient' name='prime_recipient'  placeholder='Enter Prime Recipient'/>
</div>
         </div>
        <div class="form-row">
                                    
<div class='form-group col-md-4'>
<label for='prime_award_number'><b>Prime Award Number<font color='red'>*</font></b></label>
<input required="true" type='input' class='form-control' id='prime_award_number' name='prime_award_number'  placeholder='Enter Prime Award Number'/>
</div>
                                    
                                    
<div class='form-group col-md-4'>
<label for='country_of_implementation'><b>Country of Implementation<font color='red'>*</font></b></label>
<Select class='form-control' id='country_of_implementation' name='country_of_implementation'  >
<option value='Kenya'>Kenya</option>
<option value='Tanzania'>Tanzania</option>
</select>
</div>
                                    
                                    
<div class='form-group col-md-4'>
<label for='implementation_startdate'><b>Implementation Start Date<font color='red'>*</font></b></label>
<input  required="true" type='input' class='form-control tarehe_kitambo' id='implementation_startdate' name='implementation_startdate'  placeholder='Enter Implementation Start Date'/>
</div>
 
         </div>
        <div class="form-row">            
                                    
<div class='form-group col-md-4'>
<label for='implementation_enddate'><b>Implementation End Date<font color='red'>*</font></b></label>
<input required="true" type='input' class='form-control tarehe_kesho' id='implementation_enddate' name='implementation_enddate'  placeholder='Enter Implementation End Date'/>
</div>
                                    
                                    
<div class='form-group col-md-4'>
<label for='obligation_enddate'><b>Obligation End Date<font color='red'>*</font></b></label>
<input required="true" type='input' class='form-control tarehe_kesho' id='obligation_enddate' name='obligation_enddate'  placeholder='Enter Obligation End Date'/>
</div>
                                    
                                    
<div class='form-group col-md-4'>
<label for='costshare_obligation'><b>Cost Share Obligation<font color='red'>*</font></b></label>
<input required="true" type='input' class='form-control' id='costshare_obligation' name='costshare_obligation'  placeholder='Enter Cost Share Obligation'/>
</div>
         </div>
        <div class="form-row">                                    
                                    
<div class='form-group col-md-4'>
<label for='grant_amount'><b>Grant Amount <font color='orange'>(in US Dollars) </font><font color='red'>*</font></b></label>
<input onkeypress='return numbers(event);' required="true" type='input' class='form-control' id='grant_amount' name='grant_amount'  placeholder='Enter Grant Amount'/>
</div>
            
<div class='form-group col-md-4'>
<label for='mechanism_name'><b>Mechanism Name<font color='red'>*</font></b></label>
<input  required="true" type='input' class='form-control' id='mechanism_name' name='mechanism_name'  placeholder='Enter Mechanism Name'/>
</div>
          
            
            <div class='form-group col-md-4'>
                <label for='submit_frm'><b>.</b></label>
         <button id="submit_frm" type="submit" class="btn  btn-primary btn-sm form-control">Submit</button>   
            
         </div>
            
         </div>
<div class="toast hide toast-3s" role="alert" aria-live="assertive" data-delay="3000" aria-atomic="true">
		<div class="toast-header">
									
									
									<small class="text-muted"></small>
									<button type="button" class="m-l-5 mb-1 mt-1 close" data-dismiss="toast" aria-label="Close">
										<span>&times;</span>
									</button>
		</div>
								<div class="toast-body">
									<p  class='ujumbe'></p>
								</div>
		</div>
 </form>
                            </div>
                         
                        </div>
							
							
							
							
						</div>
					</div>
                                                    
                                                    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
							
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
    <script type="text/javascript" src="assets/js/datatables.min.js"></script>
    
    
       <%if (session.getAttribute("grants_response") != null) { %>
                                <script type="text/javascript"> 
                    
                    var uju='<%=session.getAttribute("grants_response")%>';
                    $('.ujumbe').html(uju);
                    $('.callalert').click();
                      
                    
                </script> <%
                session.removeAttribute("grants_response");
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
              "lengthChange": false,  
              "order": [[0,'desc']]});
 
    $('#searchtable_'+elementtoappend+' tbody').on( 'click', 'tr', function () {
        if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
             $('#btnDeleteRow').hide();
        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
             $('#btnDeleteRow').show();
        }
    } );
 
    $('#btnDeleteRow').click( function () {
        
     var tablerowid=table.$('tr.selected').attr('id');
        
        if(ConfirmDelete()===true){
        
        deletedata(tablerowid);
        
        table.row('.selected').remove().draw( false );
        
        
                        
                    }});
          
 
        });
                        
                    }});    
         
           
            
          
    
}
    
  loadEdits('searchtable','grants_infor','loadedits','vw_grants_infor','grant_id'); 
  
  
  
  
  function loadExistingData(recordid,maintbl,pki)
{ 
    
    //once the edit form is clicked, the assumption is that the add section will be loaded
    $('#home-tab').click();
    $('#home-tab').html("Edit Grants");
    
   
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
for (const key in data[0]) {  
    
    var ky=key;
    var vl=data[0][key];
    
  $("#"+ky).val(vl);
}
                    }  
//});
                        
                  
//                         $('.dates').datepicker({
//                             todayHighlight: true, daysOfWeekDisabled: "0,6",clearBtn: true, autoclose: true,format: "yyyy-mm-dd",
//     });
     
   
                        
                        
                    });    
             
           
            
            
    
    
    
}

   function dltrw(rw,tbl,act,tblid){
     
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


function refreshPage(){
    
      window.location.reload();
    
}
  


</script>    
</body>
</html>
