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
    public partial class ListData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["WebApplication"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


           SqlCommand listExWorkDataproc = new SqlCommand("listExWorkData", conn);
           listExWorkDataproc.CommandType = System.Data.CommandType.StoredProcedure;
           listExWorkDataproc.Parameters.Add(new SqlParameter("@Exid", Session["user"]));

           
                conn.Open();
                listExWorkDataproc.ExecuteNonQuery();
                SqlDataAdapter data = new SqlDataAdapter();
                data.SelectCommand = listExWorkDataproc;
                DataTable table = new DataTable();
                data.Fill(table);

                gridId.DataSource = table;
                gridId.DataBind();
            








            //conn.Open();
            /* SqlDataReader rdr = listExWorkDataproc.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
             while (rdr.Read())
             {
                 String x = rdr.GetString(rdr.GetOrdinal("x"));
                 Label forX = new Label();
                 forX.Text = x;
                 form1.Controls.Add(forX);
             }*/

        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("ExHomePage.aspx");
        }
    }
}