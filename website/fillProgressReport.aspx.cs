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
    public partial class fillProgressReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["postgradDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int id = (int)Session["user"];

            SqlCommand listGoingThesis = new SqlCommand("listGoingThesis", conn);
            listGoingThesis.CommandType = System.Data.CommandType.StoredProcedure;
            listGoingThesis.Parameters.Add(new SqlParameter("@id", id));
            conn.Open();


            SqlDataAdapter data = new SqlDataAdapter();
            data.SelectCommand = listGoingThesis;
            listGoingThesis.ExecuteNonQuery();

            DataTable table = new DataTable();
            data.Fill(table);

            gridId.DataSource = table;
            gridId.DataBind();
            conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["postgradDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int serialNum = 0;
            int progressNo = 0;
            int state = 0;
            String description = "";
            try
            {
                serialNum = Int16.Parse(TextBox1.Text);
                progressNo = Int16.Parse(TextBox2.Text);
                state = Int16.Parse(TextBox3.Text);
                description = TextBox4.Text;
            }
            catch (Exception ex) {
                MessageBox.Show("Enter Valid Input");
                Response.Redirect("fillProgressReport.aspx");
            }

            SqlCommand FillProgressReport = new SqlCommand("FillProgressReport", conn);
            FillProgressReport.CommandType = System.Data.CommandType.StoredProcedure;
            FillProgressReport.Parameters.Add(new SqlParameter("@thesisSerialNo", serialNum));
            FillProgressReport.Parameters.Add(new SqlParameter("@progressReportNo", progressNo));
            FillProgressReport.Parameters.Add(new SqlParameter("@state", state));
            FillProgressReport.Parameters.Add(new SqlParameter("@description", description));

            SqlParameter output = FillProgressReport.Parameters.Add("@output", System.Data.SqlDbType.Int);
            output.Direction = System.Data.ParameterDirection.Output;

            conn.Open();
            FillProgressReport.ExecuteNonQuery();
            conn.Close();

            if (output.Value.ToString() == "1")
            {
                MessageBox.Show("fill correct input");
                Response.Redirect("fillProgressReport.aspx");
            }
            else {
                MessageBox.Show("filled successfully");
                    
            }

            
        }

       
    }
}