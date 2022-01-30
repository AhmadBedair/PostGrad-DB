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
    public partial class viewSuperVisorProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["WebApplication"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int id = Int16.Parse(Session["user"].ToString());

            SqlCommand proc = new SqlCommand("SupViewProfile", conn);
            proc.CommandType = System.Data.CommandType.StoredProcedure;
            proc.Parameters.Add(new SqlParameter("@supervisorID", id));
            conn.Open();
            proc.ExecuteNonQuery();



            SqlDataAdapter data = new SqlDataAdapter();
            data.SelectCommand = proc;
           
            DataTable table = new DataTable();
            data.Fill(table);

            gridId.DataSource = table;
            gridId.DataBind();
            conn.Close();
        }
    }
}