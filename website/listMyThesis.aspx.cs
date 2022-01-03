using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GucianPostGradSystem
{
    public partial class listMyThesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["postgradDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int id = (int)Session["user"];



            SqlCommand listMyThesis = new SqlCommand("listMyThesis", conn);
            listMyThesis.CommandType = System.Data.CommandType.StoredProcedure;

            listMyThesis.Parameters.Add(new SqlParameter("@id", id));

            conn.Open();
            

            SqlDataAdapter data = new SqlDataAdapter();
            data.SelectCommand = listMyThesis;
            listMyThesis.ExecuteNonQuery();

            DataTable table = new DataTable();
            data.Fill(table);

            gridId.DataSource = table;
            gridId.DataBind();
            conn.Close();
        }
    }
}