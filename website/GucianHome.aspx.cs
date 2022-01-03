﻿using System;
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
    public partial class GucianHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void add_Click(object sender, EventArgs e)
        {

            Response.Redirect("addPhoneNumber.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewProfile.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("listMyThesis.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("addProgressReport.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("fillProgressReport.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("addPublication.aspx");
        }
    }
}