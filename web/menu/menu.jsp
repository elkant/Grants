<%-- 
    Document   : user
    Created on : Feb 27, 2023, 12:12:13 PM
    Author     : Emmanuel Kaunda
--%>

<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav class="pcoded-navbar  ">
		<div class="navbar-wrapper  ">
			<div class="navbar-content scroll-div " >
				
				<div class="">
					<div class="main-menu-header">
						<img class="img-radius" src="assets/images/user/avatar.png" alt="User-Profile-Image">
						<div class="user-details">
                                                   <%if(session.getAttribute("kd_session")!=null){
                                                       
                                                       HashMap <String,String>ks=(HashMap<String, String>)session.getAttribute("kd_session");
                                                       
                                                       %>
                                                       <span> <b> Hi <%=ks.get("fname").toString()%></b> </span>
                                                       <%
                                                       
                                                                                                 } 
                                                               else {%><a href="index.jsp" class="btn-info">Log in</a><%}%>
                                               </div>
					</div>
					<div class="collapse" id="nav-user-link">
						<ul class="list-unstyled">
							<li class="list-group-item"><a href="user-profile.html"><i class="feather icon-user m-r-5"></i>View Profile</a></li>
							<li class="list-group-item"><a href="#!"><i class="feather icon-settings m-r-5"></i>Settings</a></li>
							<li class="list-group-item"><a href="auth-normal-sign-in.html"><i class="feather icon-log-out m-r-5"></i>Logout</a></li>
						</ul>
					</div>
				</div>
				
				<ul class="nav pcoded-inner-navbar ">
					<li class="nav-item pcoded-menu-caption">
						<label>Data entry</label>
					</li>
					<li class="nav-item">
					    <a href="home.jsp" class="nav-link "><span class="pcoded-micon"><i class="feather icon-home"></i></span><span class="pcoded-mtext">Home</span></a>
					</li>
                                        <li class="nav-item">
					    <a href="grants.jsp" class="nav-link "><span class="pcoded-micon"><i class="feather icon-award"></i></span><span class="pcoded-mtext">Grants</span></a>
					</li>
                                         <li class="nav-item">
					    <a href="solicitation.jsp" class="nav-link "><span class="pcoded-micon"><i class="feather icon-airplay"></i></span><span class="pcoded-mtext">Solicitation</span></a>
					</li>
                                        <li class="nav-item">
					    <a href="index.html" class="nav-link "><span class="pcoded-micon"><i class="feather icon-bar-chart"></i></span><span class="pcoded-mtext">Dashboards</span></a>
					</li>
					<li class="nav-item pcoded-hasmenu">
					    <a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-layout"></i></span><span class="pcoded-mtext">Page layouts</span></a>
					    <ul class="pcoded-submenu">
					        <li><a href="layout-vertical.html" target="_blank">Vertical</a></li>
					        <li><a href="layout-horizontal.html" target="_blank">Horizontal</a></li>
					    </ul>
					</li>
					<li class="nav-item pcoded-menu-caption">
						<label>Management</label>
					</li>
					<li class="nav-item pcoded-hasmenu">
						<a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-box"></i></span><span class="pcoded-mtext">manage Forms</span></a>
						<ul class="pcoded-submenu">
							<li><a href="bc_alert.html">Alert</a></li>
							<li><a href="bc_button.html">Button</a></li>
							<li><a href="bc_badges.html">Badges</a></li>
							<li><a href="bc_breadcrumb-pagination.html">Breadcrumb & paggination</a></li>
							<li><a href="bc_card.html">Cards</a></li>
							<li><a href="bc_collapse.html">Collapse</a></li>
							<li><a href="bc_carousel.html">Carousel</a></li>
							<li><a href="bc_grid.html">Grid system</a></li>
							<li><a href="bc_progress.html">Progress</a></li>
							<li><a href="bc_modal.html">Modal</a></li>
							<li><a href="bc_spinner.html">Spinner</a></li>
							<li><a href="bc_tabs.html">Tabs & pills</a></li>
							<li><a href="bc_typography.html">Typography</a></li>
							<li><a href="bc_tooltip-popover.html">Tooltip & popovers</a></li>
							<li><a href="bc_toasts.html">Toasts</a></li>
							<li><a href="bc_extra.html">Other</a></li>
						</ul>
					</li>
					
					
					
					
					<li class="nav-item pcoded-menu-caption">
						<label>Reports</label>
					</li>
					<li class="nav-item pcoded-hasmenu">
					    <a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-lock"></i></span><span class="pcoded-mtext">Excel Based Reports</span></a>
					    <ul class="pcoded-submenu">
					        <li><a href="auth-signup.html" target="_blank">Sign up</a></li>
					        <li><a href="auth-signin.html" target="_blank">Sign in</a></li>
					    </ul>
					</li>
                                        
                                        
                                        <li class="nav-item pcoded-hasmenu">
					    <a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-log-out"></i></span><span class="pcoded-mtext">Log Out</span></a>
					    <ul class="pcoded-submenu">
					        <li><a href="logout" target="_blank">Sign out</a></li>
					    </ul>
					</li>
                                        
                                        
					
				</ul>
				
				
				
			</div>
		</div>
	</nav>
