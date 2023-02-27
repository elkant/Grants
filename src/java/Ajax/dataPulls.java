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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
            
            
            
            dbConnweb conn = new dbConnweb();
            
            String fac="";
            
            //below variable will tell this servlet what to do
            //it will call various methods and return different values in json format
            
            
            String userregion="";
            
           
            
            String act="";
            String loadmtrs_sel_val="";
            String fm="";
            String table_docker="";
            //loadmtrs_sel_val,act=loadmothers,fac
            
            if(request.getParameter("act")!=null){act=request.getParameter("act");}
            if(request.getParameter("fac")!=null){fac=request.getParameter("fac");}
           
            if(request.getParameter("loadmtrs_sel_val")!=null){loadmtrs_sel_val=request.getParameter("loadmtrs_sel_val");}
            
            
            if(act.equals("loadmothers")){out.println(buildoptsFromDbResultSet(conn,pullAddedMothers(conn, fac),loadmtrs_sel_val));}
            
             if(request.getParameter("fm")!=null){fm=request.getParameter("fm");}
             if(request.getParameter("table_docker")!=null){table_docker=request.getParameter("table_docker");}
             
             //A table will load both headers and data values dynamically
            if(act.equals("showedits"))
            {               
                
               ResultSet rs1=pullAddedDataPerFormForEditing(conn,fm,fac,"sp_pmtct_ovc_pull_all_editing_data_dynamically");

                out.println(buildDataTable(conn,rs1,table_docker,fm));                                               
    
            }
            if(act.equals("getCurency"))
            {               
                
               ResultSet rs1=pullDataFromDbGivenQuery(conn,"select * from grants.opts_currency; ");

                out.println(buildoptsFromDbResultSet(conn,rs1,""));                                               
    
            }
            
            
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
conn.rs=conn.st.executeQuery(qry);


return conn.rs;

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


public  String buildoptsFromDbResultSet(dbConnweb cn,ResultSet res, String selectedvalue){

    
     String finalopts="<option value=''>select option</option>";
        try {
            //this method gets data from db and converts it to jsonArray, the from JSON array, get the JSONObjects in place
            
            JSONArray ja=new JSONArray();
            
            ja=toJsonFormatDynamic(res);
            
            
                    
            String opts="";     
                    for(int h=0;h<ja.length();h++){
                        JSONObject jo=ja.getJSONObject(h);
                    for(int i = 0; i<jo.names().length(); i++){
                    opts+=jo.get(jo.names().getString(i))+":";
                    }
                    }
                    
                    
                    
                   
//Yes|Yes:No|No
//System.out.println(""+opts);

String valkey[]=opts.split(":");
            System.out.println("val_key_length:"+valkey.length);

for(int s=0;s<valkey.length;s++){
    
    String valkey_in[]=valkey[s].split(",");
    
    if(valkey[s].contains(",")){
    String selected="";
    if(selectedvalue.equals(valkey_in[0])){selected="selected";}
    
    finalopts+="<option "+selected+" value='"+valkey_in[0]+"'>"+valkey_in[1]+"</option>";
    
    }
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
    
jo.put(mycolumns.get(c).toString(),res.getString(mycolumns.get(c).toString()));


}



jo2.put(jo);
    
count++;
    
}
    
return jo2;    
}


//[{"Tablecolumn1":"Row1Value1","Tablecolumn2":"Row1Value2"},{"Tablecolumn1":"Row2Value1","Tablecolumn2":"Row2Value2"},{"Tablecolumn1":"Row2Value1","Tablecolumn2":"Row2Value2"}]



public String buildDataTable(dbConnweb con, ResultSet res, String elementtoappend,String frm) throws SQLException{
    
String finaltbl="";
String hdslist_html="";
String dtlist_html="<tr>";





 
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
                       mycolumns.add(metaData.getColumnLabel(i));             
                     hdslist_html+="<th>"+metaData.getColumnLabel(i)+"</th>";
                }//end of for loop
                count++;
     }//end of if
     else { }
    
    


for(int c=0;c<mycolumns.size();c++)
{
    
      dtlist_html+="<td>"+res.getString(mycolumns.get(c).toString())+"</td>";

      if(c==mycolumns.size()-1){ dtlist_html+="<td><label onclick='loadExistingClient(\""+res.getString("patient_id")+"\",\""+frm+"\");' class='btn btn-info'>Edit</label></td></tr><tr>";}

}
    



count++;
    
}




finaltbl= "<table id='searchtable_"+elementtoappend+"' class='table table-striped table-bordered'><thead><tr>"+hdslist_html+"<th>Edit</th></tr></thead><tbody>"+dtlist_html+"</tbody></table>";




return finaltbl;
}
    
}
