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
    public partial class listNonGucianCourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["WebApplication"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int id = (int)Session["user"];


            SqlCommand ViewCoursesGrades = new SqlCommand("ViewCoursesGrades", conn);
            ViewCoursesGrades.CommandType = System.Data.CommandType.StoredProcedure;

            ViewCoursesGrades.Parameters.Add(new SqlParameter("@studentID", id));

            conn.Open();
           

            SqlDataAdapter data = new SqlDataAdapter();
            data.SelectCommand = ViewCoursesGrades;
            ViewCoursesGrades.ExecuteNonQuery();

            DataTable table = new DataTable();
            data.Fill(table);

            gridId.DataSource = table;
            gridId.DataBind();
            conn.Close();

        }
    }
}