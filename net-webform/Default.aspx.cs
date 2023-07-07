using System;
using System.Data.Entity;
using System.Linq;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
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
                    OrderDate = DateTime.Parse(txtOrderDate.Text), //DateTime.Parse converte il testo in data
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

            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string name = (row.FindControl("txtName") as TextBox).Text;
            string orderDate = (row.FindControl("txtOrderDate") as TextBox).Text;
            string insertionDate = (row.FindControl("txtInsertionDate") as TextBox).Text;
            string changedDate = (row.FindControl("txtChangedDate") as TextBox).Text;
            string notes = (row.FindControl("txtNotes") as TextBox).Text;

            using (SystemContext entities = new SystemContext())
            {
                webapp.Models.System system = (from c in entities.Systems
                                               where c.Id == id
                                               select c).FirstOrDefault();
                system.Name = name;
                system.OrderDate = DateTime.Parse(orderDate);
                system.InsertionDate = DateTime.Parse(insertionDate);
                system.ChangedDate = DateTime.Parse(changedDate);
                system.Notes = notes;

                entities.SaveChanges();
            }
            GridView1.EditIndex = -1;
            this.BindGrid();
        }

        protected void CancelingEdit(object sender, EventArgs e) //metodo per gestire l'evento di annullamento della modifica di una riga della griglia
        {
            //imposta l'indice di modifica della griglia a -1 per annullare la modifica e richiama il metodo BindGrid() per ripristinare i dati originali nella griglia.
            GridView1.EditIndex = -1;
            this.BindGrid();
        }


        //DELETE
        protected void Delete(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            using (SystemContext entities = new SystemContext())
            {
                webapp.Models.System system = (from c in entities.Systems
                                     where c.Id == id
                                     select c).FirstOrDefault();

                entities.Systems.Remove(system);
                entities.SaveChanges();
            }
            this.BindGrid();
        }
    }
}