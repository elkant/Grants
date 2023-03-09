/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package General;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.nio.file.CopyOption;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author SIXTYFOURBIT
 */
public class copytemplates extends HttpServlet {

   String host,dbase,user,password; 
  static   String dbsetup,masterdbsetup,tempdb;
 String url,dbconnpath;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        
        
       
      
      
//CREATE A PATH IN THE COMPUTER FOR STORING TEXT FILES
                            
    String sourcepath = getServletContext().getRealPath("/database_design.xlsx");
   // String sourcepath1 = getServletContext().getRealPath("/Females 15to24.xlsm");
        String mydrive = sourcepath.substring(0, 1);
        //dbconnpath=mydrive+":\\MNHC_SYSTEM_APHIA_PLUS\\"; 
        if(OSValidator.isWindows()){
      dbconnpath=mydrive+":\\HSDSA\\Grants\\"; 
        }
        else if(OSValidator.isUnix()){
        dbconnpath="/HSDSA/Grants/";     
        }
      //create a directory
      
      // new File(dbconnpath).mkdir();
     new File(dbconnpath).mkdirs();
        

        
    //dbsetup=ctx.getRealPath("/dbase.txt");
        
       
        
//try {
// System.out.println("===============================context "+getServletContext().getRealPath("/dbsettings.txt"));

 //dbsetup = getClass().getResource("dbase.txt").getFile();
      

  // } catch (IOException e) {}
   
   
  
  
      
        
        
        

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>


 
 //=======================================================================
public void transferdocs(String src1,String desteepath ){
        try {
            
            //the source of the application is known and is fixed.
            //however, the destination may change and is different.
            
                  String mydrive = desteepath.substring(0, 1);
                  //dbconnpath=mydrive+":\\MNHC_SYSTEM_APHIA_PLUS\\"; 
                  if(OSValidator.isWindows()){
                dbconnpath=mydrive+":\\HSDSA\\Grants\\";
                 }
                 else if(OSValidator.isUnix()){
                dbconnpath="/HSDSA/Grants/"; 
                         }
                //create a directory
                // new File(dbconnpath).mkdir();
               new File(dbconnpath).mkdirs();
                  
          /*        
          String sourcepath=dbconnpath+"\\Partnerbasedkepms.xlsm";
          String sourcepath1=dbconnpath+"\\Females 15to24.xlsm";
            */  
                  
              //dbsetup=ctx.getRealPath("/dbase.txt");
                  
      
             
              Path FROM = Paths.get(src1);
              Path TO = Paths.get(desteepath);
              //overwrite existing file, if exists
              CopyOption[] options = new CopyOption[]{
                StandardCopyOption.REPLACE_EXISTING,
                StandardCopyOption.COPY_ATTRIBUTES
              }; 
              Files.copy(FROM, TO, options);
              
         /**     
              Path FROM1 = Paths.get(sourcepath1);
              Path TO1 = Paths.get(desteepath1);
              //overwrite existing file, if exists
              CopyOption[] options1 = new CopyOption[]{
                StandardCopyOption.REPLACE_EXISTING,
                StandardCopyOption.COPY_ATTRIBUTES
              }; 
              
               Files.copy(FROM1, TO1, options1); */
        }
        //=======================================================================
        catch (IOException ex) {
            Logger.getLogger(copytemplates.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    
   



}
 
    
 
    
 //=======================================================================
  
 
    
public void copydocs(String sourcepath,String destpath ){
        try {
           
            System.out.println("~~~Passed dest path is "+destpath);
            
               
             
              Path FROM = Paths.get(sourcepath);
              Path TO = Paths.get(destpath);
              //overwrite existing file, if exists
              CopyOption[] options = new CopyOption[]{
                StandardCopyOption.REPLACE_EXISTING,
                StandardCopyOption.COPY_ATTRIBUTES
              }; 
              Files.copy(FROM, TO, options);
              
              
            
        }
        //=======================================================================
        catch (IOException ex) {
            System.out.println("Error while tranferring"+ex);
            Logger.getLogger(copytemplates.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    
   



}

 
 public String getFileName(Part part) 
     {
            String file_name="";
        String contentDisp = part.getHeader("content-disposition");
        System.out.println("content-disposition header= "+contentDisp);
        String[] tokens = contentDisp.split(";");
      
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                file_name = token.substring(token.indexOf("=") + 2, token.length()-1);
              break;  
            }
            
        }
         System.out.println("content-disposition final : "+file_name);
        return file_name;
    }
    
   public String uploadFile(HttpServletRequest request,String filename, String Folder) throws IOException, IllegalStateException, ServletException {
   
       HttpSession sess= request.getSession(true);
        String fu_pth="";
  String finame="";
  String np = "";
   
    final String upload_dir = "grantfiles";
       
   
               String applicationPath = request.getServletContext().getRealPath("");
         String uploadFilePath = applicationPath + File.separator + upload_dir;
         
          File fileSaveDir = new File(uploadFilePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }
        
        for (Part part : request.getParts()) {
            if(!getFileName(part).equals("")){
           finame = (String) getFileName(part);
            part.write(uploadFilePath + File.separator + finame);
            }
         
        if(!(finame.endsWith(".pptx")||finame.endsWith(".ppt")||finame.endsWith(".pdf")||finame.endsWith(".docx")||finame.endsWith(".doc")||finame.endsWith(".xlsx")||finame.endsWith(".xls")||finame.endsWith(".xlsm")||finame.endsWith(".zip")||finame.endsWith(".gz"))){
          sess.setAttribute("file_upload", "<font color=\"red\">Error: File type not supported.</font>");   
        }
        else {
            sess.setAttribute("file_upload","<font color=\"green\">Error: File type not supported.</font>");
            
            fu_pth=fileSaveDir.getAbsolutePath()+"/"+finame;
            
       
  
  
   URL location = copytemplates.class.getProtectionDomain().getCodeSource().getLocation();


            
   String mydrive = location.getFile().substring(1, 2);
  
  

            
            if (OSValidator.isWindows()) 
            {
                np = mydrive + ":\\HSDSA\\Grants\\"+Folder+"\\" + filename+finame;
                 
            }
            else if (OSValidator.isUnix()) 
            {
                np = "/HSDSA/Grants/"+Folder+"/" + filename+finame;
             
                
            }
            
        String sr = fu_pth;
            
             File f = new File(np);
            if (!f.exists() && !f.isDirectory()) 
            {
                /* do something */
                copytemplates ct = new copytemplates();
                ct.transferdocs(sr, np);
                //rem np is the destination file name  

                System.out.println("Copying  template..");

            } 
            
            else //copy the file alone  
            {
                copytemplates ct = new copytemplates();

                ct.copydocs(sr, np);

            }
  
            
             }//end of file upload
        }//end of for loop
        
        
        //return the full path where the file is saved
       return np;
   } 
    
 
 
 
}

