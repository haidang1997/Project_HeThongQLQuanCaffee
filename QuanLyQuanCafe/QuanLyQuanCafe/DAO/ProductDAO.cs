using QuanLyQuanCafe.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanCafe.DAO
{
    class ProductDAO
    {
        private static ProductDAO instance;

        public static ProductDAO Instance
        {
            get {
                if (instance == null)
                {
                    instance = new ProductDAO();
                }
                return ProductDAO.instance; 
            }
            private set { ProductDAO.instance = value; }
        }

        private ProductDAO() { }

        public List<Product> getProductByCategoryID(int id)
        {
            List<Product> list = new List<Product>();

            string query = "exec sanpham_maloaisp @MaLoaiSP = " + id;

            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                Product product = new Product(item);
                list.Add(product);
            }

            return list;
        }

        public List<Product> getProductByFoodsOrDrinks(int maphanloai)
        {
            List<Product> list = new List<Product>();
            DataTable data = DataProvider.Instance.ExecuteQuery("exec SanPham_PhanLoai @MaPhanLoai" + maphanloai);
            foreach (DataRow item in data.Rows)
            {
                Product product = new Product(item);
                list.Add(product);
            }

            return list;
        }
    }
}
