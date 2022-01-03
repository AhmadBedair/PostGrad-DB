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
    public partial class Ongoing_Thesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["postgradDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand AdminViewAllThesesproc = new SqlCommand("AdminViewAllTheses", conn);
            AdminViewAllThesesproc.CommandType = System.Data.CommandType.StoredProcedure;

            conn.Open();
            AdminViewAllThesesproc.ExecuteNonQuery();
            SqlDataAdapter data = new SqlDataAdapter();
            data.SelectCommand = AdminViewAllThesesproc;
            System.Data.DataTable table = new DataTable();
            data.Fill(table);

            gridId.DataSource = table;
            gridId.DataBind();
        }

        protected void View_Ongoing_Thesis_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["postgradDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand AdminViewOnGoingThesesproc = new SqlCommand("AdminViewOnGoingTheses", conn);
            AdminViewOnGoingThesesproc.CommandType = System.Data.CommandType.StoredProcedure;


            SqlParameter ThesesCount = AdminViewOnGoingThesesproc.Parameters.Add("@thesesCount", SqlDbType.Int);
            ThesesCount.Direction =ParameterDirection.Output;

            

            conn.Open();
            AdminViewOnGoingThesesproc.ExecuteNonQuery();
            conn.Close();
            Response.Write(ThesesCount.Value);
        }
    }
}