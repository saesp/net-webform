using System;
using System.Data.Entity;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using webapp.Models;


namespace net_webform
{
    public partial class _Default : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
        }

        private void BindGrid()
        {
            using (SystemContext entities = new SystemContext())
            {
                var systems = entities.Systems.ToList(); // Esegue la query e ottiene i risultati come lista
                GridView1.DataSource = systems; // Imposta la lista come origine dati per il GridView
                GridView1.DataBind();
            }
        }



        //CREATE
        protected void Create(object sender, EventArgs e)
        {
            using (SystemContext entities = new SystemContext())
            {
                webapp.Models.System system = new webapp.Models.System
                {
                    Name = txtName.Text,
                    OrderDate = DateTime.Parse(txtOrderDate.Text),
                    InsertionDate = DateTime.Parse(txtInsertionDate.Text),
                    ChangedDate = DateTime.Parse(txtChangedDate.Text),
                    Notes = txtNotes.Text,
                };
                entities.Systems.Add(system);
                entities.SaveChanges();
            }
            this.BindGrid();
        }


        //UPDATE
        protected void Edit(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }

        protected void Update(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int systemId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string name = (row.FindControl("txtName") as TextBox).Text;
            string country = (row.FindControl("txtCountry") as TextBox).Text;

            using (SystemContext entities = new SystemContext())
            {
                webapp.Models.System system = (from c in entities.Systems
                                     where c.Id == systemId
                                     select c).FirstOrDefault();
                system.Name = name;
                entities.SaveChanges();
            }
            GridView1.EditIndex = -1;
            this.BindGrid();
        }

        protected void CancelingEdit(object sender, EventArgs e)
        {
            GridView1.EditIndex = -1;
            this.BindGrid();
        }


        protected void Delete(object sender, GridViewDeleteEventArgs e)
        {
            int systemId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            using (SystemContext entities = new SystemContext())
            {
                webapp.Models.System system = (from c in entities.Systems
                                     where c.Id == systemId
                                     select c).FirstOrDefault();
                entities.Systems.Remove(system);
                entities.SaveChanges();
            }
            this.BindGrid();
        }
    }
}