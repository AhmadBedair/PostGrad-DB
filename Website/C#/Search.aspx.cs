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
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SFT_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["WebApplication"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            String word = KWord.Text;
            SqlCommand searchforthesis = new SqlCommand("searchforthesis", conn);
            searchforthesis.CommandType = System.Data.CommandType.StoredProcedure;

            try
            {
                searchforthesis.Parameters.Add(new SqlParameter("@exid", Session["user"]));
                searchforthesis.Parameters.Add(new SqlParameter("@word", word));
                conn.Open();
                searchforthesis.ExecuteNonQuery();
                SqlDataAdapter data = new SqlDataAdapter();
                data.SelectCommand = searchforthesis;
                DataTable table = new DataTable();
                data.Fill(table);

                gridId.DataSource = table;
                gridId.DataBind();
            }
            catch (Exception ex) { };


        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("ExHomePage.aspx");
        }
    }
}