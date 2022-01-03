using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class ExHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void EditInfo_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditExInfo.aspx");
        }

        protected void ListData_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListData.aspx"); 
        }

        protected void AddComment_Click(object sender, EventArgs e)
        {
            Response.Redirect("DefenseComment.aspx");
        }

        protected void AddGrade_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddDefenseGrade.aspx");
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            Response.Redirect("Search.aspx");
        }
    }
}