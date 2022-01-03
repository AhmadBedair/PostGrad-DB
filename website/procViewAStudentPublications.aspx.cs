using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace GucianPostGradSystem
{
    public partial class procViewAStudentPublications : System.Web.UI.Page
    {
        string connStr = WebConfigurationManager.ConnectionStrings["postgradDB"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
































            int studentId = 0;
            try
            {
                 studentId = Int16.Parse(TextBox1.Text);
            }
            catch (Exception ex) 
            { MessageBox.Show("PLease enter a valid id!");
                TextBox1.Text = "";
            }

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand proc = new SqlCommand("ViewAStudentPublications", conn);
            proc.CommandType = System.Data.CommandType.StoredProcedure;
            proc.Parameters.Add(new SqlParameter("@StudentID", studentId));
            try
            {
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