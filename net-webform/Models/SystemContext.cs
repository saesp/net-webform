
using System.Collections.Generic;
using System.Data.Entity;

namespace webapp.Models
{
    public class SystemContext : DbContext
    {
        public SystemContext() : base("DbSystemsConnection")
        {
        }

        public DbSet<System> Systems { get; set; }
        public DbSet<Typology> Typologies { get; set; }
    }
}
