using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanCafe.DTO
{
    public class Product
    {
        public Product(int id, string name, int idCategory, float price)
        {
            this.Id = id;
            this.Name = name;
            this.IdCategory = idCategory;
            this.Price = price;
        }

        public Product(DataRow row)
        {
            this.Id = (int)row["MaSP"];
            this.Name = row["TenSP"].ToString();
            this.IdCategory = (int)row["MaLoaiSP"];
            this.Price = (float)Convert.ToDouble(row["Gia"].ToString());
        }

        private int id;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        private string name;

        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        private int idCategory;

        public int IdCategory
        {
            get { return idCategory; }
            set { idCategory = value; }
        }

        private float price;

        public float Price
        {
            get { return price; }
            set { price = value; }
        }
    }
}
