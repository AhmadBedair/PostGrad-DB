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
    public partial class viewProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["postgradDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int id = (int)Session["user"];

            SqlCommand checkId = new SqlCommand("checkId", conn);
            checkId.CommandType = System.Data.CommandType.StoredProcedure;
            checkId.Parameters.Add(new SqlParameter("@id", id));
            SqlParameter type = checkId.Parameters.Add("@output", System.Data.SqlDbType.Int);
            type.Direction = System.Data.ParameterDirection.Output;


            conn.Open();
            checkId.ExecuteNonQuery();
            conn.Close();


            if (type.Value.ToString() == "0")
            {
                Response.Redirect("viewGucianProfile.aspx");
            }
            else if (type.Value.ToString() == "1")
            {
                Response.Redirect("viewNonGucianProfile.aspx");
            }
            else
            {
                Response.Redirect("viewSuperVisorProfile.aspx");
            }


        }
    }
}