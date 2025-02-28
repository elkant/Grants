/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ajax;


import database.dbConnweb;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Emmanuel Kaunda
 */
public class dataPulls extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            HttpSession sess=request.getSession(true);
            
            dbConnweb conn = new dbConnweb();
            
            String fac="";
            
            //below variable will tell this servlet what to do
            //it will call various methods and return different values in json format
            
            
            String userregion="";
            
           
            
            String act="";
            String loadmtrs_sel_val="";
            String fm="";
            String table_docker="";
            String tablepkid="";
            String pkidval="";
            String maintablename="";
            String vwtable="";
            //loadmtrs_sel_val,act=loadmothers,fac
            
            if(request.getParameter("act")!=null){act=request.getParameter("act");}
            if(request.getParameter("fac")!=null){fac=request.getParameter("fac");}
            if(request.getParameter("pkid")!=null){tablepkid=request.getParameter("pkid");}
            if(request.getParameter("tablename")!=null){maintablename=request.getParameter("tablename");}
            if(request.getParameter("vwtable")!=null){vwtable=request.getParameter("vwtable");}
            if(request.getParameter("pkidval")!=null){pkidval=request.getParameter("pkidval");}
           
            if(request.getParameter("loadmtrs_sel_val")!=null){loadmtrs_sel_val=request.getParameter("loadmtrs_sel_val");}
            
            
            if(act.equals("loadmothers")){out.println(buildoptsFromDbResultSet(pullAddedMothers(conn, fac),loadmtrs_sel_val));}
            
             if(request.getParameter("fm")!=null){fm=request.getParameter("fm");}
             if(request.getParameter("table_docker")!=null){table_docker=request.getParameter("table_docker");}
             
             //A table will load both headers and data values dynamically
            if(act.equals("loadedits"))
            {               
             //The idea here is to load data from multiple datatables dynamically into a web view. We are working with an assumption that each table has a unique Primary key id called tablepkid. We also have an assumption that the main table where the data is saved might be different from the view . 
               // For that reason we are sourcing for two tables/sources , 1 view for pulling preview data and a table which will be used as a destination
               ResultSet rs1=pullDataFromDbGivenQuery(conn,"select * from "+vwtable);
                System.out.println("______Pulling Data from Grants");
                out.println(buildDataTable(conn,rs1,table_docker,tablepkid,maintablename));                                               
    
            }
            
            
            //get
            if(act.equals("loadrecordx"))
            {               
             //The idea here is to load data from multiple datatables dynamically into a web view. We are working with an assumption that each table has a unique Primary key id called tablepkid. We also have an assumption that the main table where the data is saved might be different from the view . 
               // For that reason we are sourcing for two tables/sources , 1 view for pulling preview data and a table which will be used as a destination
               ResultSet rs1=pullDataFromDbGivenQuery(conn,"select * from "+maintablename+" where "+tablepkid+"='"+pkidval+"' limit 1");
                System.out.println("______Pulling Data from "+maintablename);
                out.println(toJsonFormatDynamic(rs1));                                               
    
            }
            
            
            
            if(act.equals("getcurrency"))
            {               
                
               ResultSet rs1=pullDataFromDbGivenQuery(conn,"select concat(code,',',currency) as rcd from grants.opts_currency where active=1; ");

                out.println(buildoptsFromDbResultSet(rs1,""));                                               
    
            }
            if(act.equals("getreportingfrequency"))
            {               
                
               ResultSet rs1=pullDataFromDbGivenQuery(conn,"select concat(id,',',reportingfrequency) as rcd from grants.opts_reportingfrequency where active=1; ");

                out.println(buildoptsFromDbResultSet(rs1,""));                                               
    
            }
            if(act.equals("getapplicableindirectcost"))
            {               
                
               ResultSet rs1=pullDataFromDbGivenQuery(conn,"select concat(id,',',cost) as rcd from grants.opts_applicable_indirect_cost where active=1; ");

                out.println(buildoptsFromDbResultSet(rs1,""));                                               
    
            }
            if(act.equals("getentitytype"))
            {               
                
               ResultSet rs1=pullDataFromDbGivenQuery(conn,"select concat(id,',',entitytype) as rcd from grants.opts_entitytype where active=1; ");

                out.println(buildoptsFromDbResultSet(rs1,""));                                               
    
            }
            if(act.equals("getsubrecipientstatus"))
            {               
                
               ResultSet rs1=pullDataFromDbGivenQuery(conn,"select concat(id,',',status) as rcd from grants.opts_subrecipientstatus where active=1; ");

                out.println(buildoptsFromDbResultSet(rs1,""));                                               
    
            }
            
            //________________________________________Solicitation Forms_________________________________________
            if(act.equals("getsubmissionmeans"))
            {               
                
               ResultSet rs1=pullDataFromDbGivenQuery(conn,"select concat(id,',',submissionmeans) as rcd from grants.opts_submissionmeans where active=1; ");

                out.println(buildoptsFromDbResultSet(rs1,""));                                               
    
            }
            
            if(act.equals("getgrant"))
            {               
                
               ResultSet rs1=pullDataFromDbGivenQuery(conn,"select concat(grant_id,',',mechanism_name,' [',prime_award_number,'] ') as granti from grants.grants_infor");

                out.println(buildoptsFromDbResultSet(rs1,""));                                               
    
            }
            if(act.equals("dlt"))
            {               
             //This act deletes data that is shared per row id and per table
                System.out.println("Deleting data for "+pkidval);
                out.println(deleteRow(conn,pkidval,tablepkid,maintablename));  
                
                //Log the delete action into the Logs table
                  if (sess.getAttribute("kd_session") != null) {

                    HashMap<String, String> hm = new HashMap<>();

                    hm = (HashMap<String, String>) sess.getAttribute("kd_session");

                    AuditTrail ad = new AuditTrail();
                    ad.addTrail(conn, hm, "Deleted a Record "+pkidval+" from the table "+ " " + maintablename);

                }
                
    
            }
            //________________________________________________Applicant Details__________________________________
            
             if(act.equals("getorgtypes"))
            {               
                
               ResultSet rs1=pullDataFromDbGivenQuery(conn,"select concat(id,',',organizationtypes) as rcd from grants.opts_organizationtypes where active=1; ");

                out.println(buildoptsFromDbResultSet(rs1,""));                                               
    
            }
             
             
              if(act.equals("getsolicitation"))
            {               
                
               ResultSet rs1=pullDataFromDbGivenQuery(conn,"select concat(table_id,',',award_mechanism,' [',nofo_number,'] ') as nofo from grants.solicitation_infor");

                out.println(buildoptsFromDbResultSet(rs1,""));                                               
    
            }
              if(act.equals("getapplicants"))
            {               
                
               ResultSet rs1=pullDataFromDbGivenQuery(conn,"select concat(table_id,',',organization_name) as applicant from grants.applicants_details");

                out.println(buildoptsFromDbResultSet(rs1,""));                                               
    
            }
              if(act.equals("getQualifiedApplicants"))
            {               
                
               ResultSet rs1=pullDataFromDbGivenQuery(conn,"select concat(ad.table_id,',',organization_name,'/',nofo_number,' [',performance_start_date,' to ',performance_end_date,']')  as applicant from  "
                       + "`applicants_details` ad  JOIN `solicitation_infor` `si` ON `si`.`table_id` = ad.`solicitation_id`  "
                       + " JOIN `evaluation_details` `ed` ON `ed`.`applicate_id` = ad.`table_id` "
                       + " WHERE        `ed`.`is_applicant_selected` = 'Yes'");

                out.println(buildoptsFromDbResultSet(rs1,""));                                               
    
            }
              if(act.equals("getACtiveQualifiedApplicants"))
            {               
                
               ResultSet rs1=pullDataFromDbGivenQuery(conn,"select concat(ad.table_id,',',organization_name,'/',nofo_number,'/',subrecipient_status,' [',performance_start_date,' to ',performance_end_date,']')  as applicant from  "
                       + "`applicants_details` ad  JOIN `solicitation_infor` `si` ON `si`.`table_id` = ad.`solicitation_id`  "
                       + " JOIN `evaluation_details` `ed` ON `ed`.`applicate_id` = ad.`table_id` "
                       + " JOIN `subrecipient_infor` `sr` ON `sr`.`subrec_name` = ad.`table_id` "
                       + " WHERE        `ed`.`is_applicant_selected` = 'Yes'");

                out.println(buildoptsFromDbResultSet(rs1,""));                                               
    
            }
              if(act.equals("getrecomendations"))
            {               
                
               ResultSet rs1=pullDataFromDbGivenQuery(conn,"select concat(id,',',recommendation) as recommends from grants.opts_recommendation");

                out.println(buildoptsFromDbResultSet(rs1,""));                                               
    
            }
              if(act.equals("getmodificationnumber"))
            {               
                
               ResultSet rs1=pullDataFromDbGivenQuery(conn,"select concat(id,',',modification_number) as recommends from grants.opts_modification_number order by orodha asc");

                out.println(buildoptsFromDbResultSet(rs1,""));                                               
    
            }
              
                 if(act.equals("getsubawardtypes_grants"))
            {               
                
               ResultSet rs1=pullDataFromDbGivenQuery(conn,"select concat(id,',',type) as recommends from grants.opts_subaward_type where active=1  and category='grants'");

                out.println(buildoptsFromDbResultSet(rs1,""));                                               
    
            }
                 
                      if(act.equals("getsubawardtypes_subrecipients"))
            {               
                
               ResultSet rs1=pullDataFromDbGivenQuery(conn,"select concat(id,',',type) as recommends from grants.opts_subaward_type where active=1 and category='subrecipient'");

                out.println(buildoptsFromDbResultSet(rs1,""));                                               
    
            }
                      if(act.equals("getyearmonths"))
            {               
                
              
                out.println(getYearMonths(conn));                                               
    
            }
                      
                      if(conn.rs!=null){conn.rs.close();}
                      if(conn.rs1!=null){conn.rs1.close();}
                      if(conn.rs2!=null){conn.rs2.close();}
                      if(conn.st!=null){conn.st.close();}
                      if(conn.st1!=null){conn.st1.close();}
                      if(conn.st2!=null){conn.st2.close();}
            
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(dataPulls.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(dataPulls.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    
    public ResultSet pullAddedMothers(dbConnweb conn, String facilid) throws SQLException 
{
    
    //This method gets data that belongs to a specific form only
    String where="";

    
    
String qry="call internal_system.sp_pmtct_ovc_pull_mothers('"+facilid+"');";

    System.out.println(""+qry);
conn.rs=conn.st.executeQuery(qry);


return conn.rs;

}

    
    
        
       public ResultSet pullDataFromDbGivenQuery(dbConnweb conn,String qr) throws SQLException 
{
    
    //This method gets data from db


    
    
String qry=qr;

    System.out.println("_called_query:"+qry);
conn.rs4=conn.st4.executeQuery(qry);


return conn.rs4;

}
    
    
       public ResultSet pullAddedDataPerFormForEditing(dbConnweb conn,String form, String facilid,String sp) throws SQLException 
{
    
    //This method gets data that belongs to a specific form only


    
    
String qry="call internal_system."+sp+"('"+facilid+"','"+form+"');";

    System.out.println("_called_query:"+qry);
conn.rs=conn.st.executeQuery(qry);


return conn.rs;

}
       public ResultSet pullFormElementdeadersForEditing(dbConnweb conn,String form) throws SQLException 
{
    
    //This method gets data that belongs to a specific form only
    String where="";

    
    
String qry="call internal_system.sp_pmtct_ovc_pull_form_headers_for_editing('"+form+"');";

    System.out.println(""+qry);
conn.rs=conn.st.executeQuery(qry);


return conn.rs;

}


public  String buildoptsFromDbResultSet(ResultSet res, String selectedvalue){

    
     String finalopts="<option value=''>select option</option>";
        try {
            //this method gets data from db and converts it to jsonArray, the from JSON array, get the JSONObjects in place
            
     

while(res.next()){
    
    
    String valkey_in[]=res.getString(1).split(",");
    
  
    String selected="";
    if(selectedvalue.equals(valkey_in[0])){selected="selected";}
    
    finalopts+="<option "+selected+" value='"+valkey_in[0]+"'>"+valkey_in[1]+"</option>";
  
    
                             }




        } catch (SQLException ex) {
            Logger.getLogger(dataPulls.class.getName()).log(Level.SEVERE, null, ex);
        }
  return finalopts;  
    
}
  



public JSONArray toJsonFormatDynamic(ResultSet res) 
        throws SQLException
{

    
int count1=0;

  ResultSetMetaData metaData = res.getMetaData();
        int columnCount = metaData.getColumnCount();

         
        int count = count1;
        ArrayList mycolumns = new ArrayList();
    
    
    
JSONArray jo2 = new JSONArray();




while(res.next())
{
    
     if (count == (count1)) 
     {

                for (int i = 1; i <= columnCount; i++) {
                    mycolumns.add(metaData.getColumnLabel(i));                    
                  
                }//end of for loop
                count++;
            }//end of if
    
    
    
JSONObject jo = new JSONObject(); 

for(int c=0;c<mycolumns.size();c++){
    String vl="";
    if(res.getString(mycolumns.get(c).toString())!=null){vl=res.getString(mycolumns.get(c).toString());}
jo.put(mycolumns.get(c).toString(),vl);

    
}



jo2.put(jo);
    
count++;
    
}
    
return jo2;    
}


//[{"Tablecolumn1":"Row1Value1","Tablecolumn2":"Row1Value2"},{"Tablecolumn1":"Row2Value1","Tablecolumn2":"Row2Value2"},{"Tablecolumn1":"Row2Value1","Tablecolumn2":"Row2Value2"}]



public String buildDataTable(dbConnweb con, ResultSet res, String elementtoappend,String tablecolid,String sourcetable) throws SQLException{
    
String finaltbl="";
String hdslist_html="";
String dtlist_html="";

String primarykeycolumnname="";



 
int count1=0;

  ResultSetMetaData metaData = res.getMetaData();
        int columnCount = metaData.getColumnCount();

         
        int count = count1;
        ArrayList mycolumns = new ArrayList();
    
    

while(res.next())
{
    
     if (count == (count1)) 
     {

                for (int i = 1; i <= columnCount; i++) 
                {
                    if(i==1){primarykeycolumnname=metaData.getColumnLabel(i);}
                       mycolumns.add(metaData.getColumnLabel(i));             
                     hdslist_html+="<th>"+metaData.getColumnLabel(i)+"</th>";
                }//end of for loop
                count++;
     }//end of if
     else { }
    
    


for(int c=0;c<mycolumns.size();c++)
{
    
      

      String id="";
      if(c==0){id="id='"+res.getString(mycolumns.get(c).toString())+"'";   dtlist_html+="<tr "+id+">";}
      dtlist_html+="<td>"+res.getString(mycolumns.get(c).toString())+"</td>";
      if(c==mycolumns.size()-1){ dtlist_html+="<td><label onclick='loadExistingData(\""+res.getString(tablecolid)+"\",\""+sourcetable+"\",\""+primarykeycolumnname+"\");' class='btn btn-info'>Edit</label></td><td><label onclick='dltrw(\""+res.getString(tablecolid)+"\",\""+sourcetable+"\",\"dlt\",\""+primarykeycolumnname+"\");' class='btn btn-danger'>Delete</label></td></tr>";}
//dltrw
}
    



count++;
    
}




finaltbl= "<table id='searchtable_"+elementtoappend+"' class='table table-striped table-bordered' border='1px'><thead><tr>"+hdslist_html+"<th>Edit</th><th>Delete</th></tr></thead><tbody>"+dtlist_html+"</tbody></table>";




return finaltbl;
}
    


public int getRandNo(int start, int end ){
        Random random = new Random();
        long fraction = (long) ((end - start + 1 ) * random.nextDouble());
        return ((int)(fraction + start));
    }



public String deleteRow(dbConnweb con, String rowid,String primarykeycolumn, String tbl)
{
     String status="Data deleted";
        try {
           
            
            String qry="delete from "+tbl+" where "+primarykeycolumn+"="+rowid;
            
            con.st.executeUpdate(qry);
            
            
           
        } catch (SQLException ex) {
            Logger.getLogger(dataPulls.class.getName()).log(Level.SEVERE, null, ex);
            
              status="Error while deleting data:"+ex;
        }
        
         return status;
}



         public JSONObject getYearMonths(dbConnweb conn) throws SQLException{
    
        JSONArray armain = new JSONArray();
        JSONObject jomain = new JSONObject();
        
        
             IdGenerator ig= new IdGenerator();
        
        
        String qry="select * from yearmonth where id <="+ig.CurrentYearMonth()+" order by id desc limit 12";
        
             System.out.println(qry);
        
        conn.rs= conn.st.executeQuery(qry);
        
        while(conn.rs.next()){
            
          JSONObject jo = new JSONObject();
            jo.put("id", conn.rs.getString("id"));
            jo.put("year", conn.rs.getString("year"));
            jo.put("month", conn.rs.getString("month"));
          
        armain.put(jo);
        }
        
    jomain.put("periods",armain);
        
    return jomain;
    
    }
    


}
