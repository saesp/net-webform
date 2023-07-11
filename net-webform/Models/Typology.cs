using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace webapp.Models
{
    public class Typology
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }

        //one-to-many relation with System
        public List<System> Systems { get; set; }


        public Typology() { }
    }
}