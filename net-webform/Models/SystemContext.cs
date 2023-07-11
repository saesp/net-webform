
using Microsoft.Ajax.Utilities;
using System.Collections.Generic;
using System.Data.Entity;

namespace webapp.Models
{
    public class SystemContext : DbContext
    {
        //fornire un contesto di database per l'applicazione
        public SystemContext() : base("DbSystemsConnection")
        {
        }

        public DbSet<System> Systems { get; set; }
        public DbSet<Typology> Typologies { get; set; }
    }
}
