using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace TRAVEL.Models
{
    public class Image
    {
        public byte[] image { get; set; }
        public string urlImage { get; set; }

    }
}