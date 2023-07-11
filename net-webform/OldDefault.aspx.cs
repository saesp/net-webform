//using System;
//using System.Collections.Generic;
//using System.Data.Entity;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using webapp.Models;

//namespace net_webform
//{
//    public partial class About : Page
//    {
//        protected void Page_Load(object sender, EventArgs e)
//        {
//            if (!this.IsPostBack)
//            {
//                this.BindGrid();
//            }
//        }

//        //READ
//        private void BindGrid()
//        {
//            using (SystemContext entities = new SystemContext())
//            {
//                var systems = entities.Systems.Include(s => s.Typology).ToList(); //esegue la query e ottiene i risultati come lista
//                GridView.DataSource = systems; //imposta la lista come origine dati per il GridView
//                GridView.DataBind();
//            }
//        }
//    }
//}