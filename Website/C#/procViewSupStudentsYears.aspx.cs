using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class procViewSupStudentsYears : System.Web.UI.Page
    {
      
        public SqlDataAdapter SqlDataAdapter { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["WebApplication"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int supervisorId = (int)Session["user"];
            try
            {
               
                SqlCommand proc = new SqlCommand("ViewSupStudentsYears", conn);
                proc.CommandType = System.Data.CommandType.StoredProcedure;
                proc.Parameters.Add(new SqlParameter("@supervisorID", supervisorId));
                conn.Open();
             
                
                
                    SqlDataAdapter data = new SqlDataAdapter();
                    data.SelectCommand = proc;
                    proc.ExecuteNonQuery();

                DataTable table = new DataTable();
                    data.Fill(table);

                    gridId.DataSource = table;
                    gridId.DataBind();
                conn.Close();
                
                }
            
            catch (Exception ex) { };
         
            


        }
    }
}