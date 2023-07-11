using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace webapp.Models
{
    public class System
    {
        [Key]
        public int Id { get; set; }

        [Required, StringLength(100)]
        public string Name { get; set; }

        [Required]
        public DateTime OrderDate { get; set; }

        [Required]
        public DateTime InsertionDate { get; set; }

        [Required]
        public DateTime ChangedDate { get; set; }

        [StringLength(1000)]
        public string Notes { get; set; }


        //many-to-one relation with Typology
        public int? TypologyId { get; set; }

        public Typology Typology { get; set; }


        public System() { }
    }
}