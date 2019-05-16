using QuanLyQuanCafe.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanCafe.DAO
{
    public class MenuShowBillDAO
    {
        private static MenuShowBillDAO instance;

        internal static MenuShowBillDAO Instance
        {
            get {
                if (instance == null)
                {
                    instance = new MenuShowBillDAO();
                }
                return MenuShowBillDAO.instance; 
            }
            private set { MenuShowBillDAO.instance = value; }
        }

        private MenuShowBillDAO() { }

        public List<MenuShowBill> getListMenuByTable(int maban)
        {
            List<MenuShowBill> lisMenu = new List<MenuShowBill>();

            DataTable data = DataProvider.Instance.ExecuteQuery("exec MenuShowBill @MaBan = " + maban);

            foreach (DataRow item in data.Rows)
            {
                MenuShowBill menu = new MenuShowBill(item);
                lisMenu.Add(menu);
            }

            return lisMenu;
        }
    }
}
