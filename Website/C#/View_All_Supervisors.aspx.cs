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
    public partial class View_All_Supervisors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["WebApplication"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand AdminListSupproc = new SqlCommand("AdminListSup", conn);
            AdminListSupproc.CommandType = System.Data.CommandType.StoredProcedure;

            conn.Open();
            AdminListSupproc.ExecuteNonQuery();
            SqlDataAdapter data = new SqlDataAdapter();
            data.SelectCommand = AdminListSupproc;
            DataTable table = new DataTable();
            data.Fill(table);

            gridId.DataSource = table;
            gridId.DataBind();
        }
    }
}