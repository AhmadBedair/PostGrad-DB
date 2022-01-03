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
    public partial class Admin_Home_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void List_sups_Click(object sender, EventArgs e)
        {
            Response.Redirect("View_All_Supervisors.aspx");
        }

        protected void Admin_view_Click(object sender, EventArgs e)
        {
            Response.Redirect("View_All_Thesis.aspx");
        }

        protected void Issue_Payment_Click(object sender, EventArgs e)
        {
            Response.Redirect("IssuePayment.aspx");
        }

        protected void Issue_Installment_Click(object sender, EventArgs e)
        {
            Response.Redirect("Issue_Installment.aspx");
        }

        protected void Update_Extension_Click(object sender, EventArgs e)
        {
            Response.Redirect("Update_Extension.aspx");
        }
    }
}