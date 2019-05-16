using QuanLyQuanCafe.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanCafe.DAO
{
    public class TableDAO
    {
        private static TableDAO instance;

        public static int TableWidth = 70;
        public static int TableHeight = 70;

        public static TableDAO Instance
        {
            get {
                if (instance == null)
                {
                    instance = new TableDAO();
                }
                return instance; 
            }
            private set { instance = value; }
        }

        

        private TableDAO() { }

        public List<Table> LoadTakeAway()
        {
            List<Table> takeAway = new List<Table>();

            DataTable vip = DataProvider.Instance.ExecuteQuery("exec ban_maloai @MaLoaiBan = 3");
            foreach (DataRow item in vip.Rows)
            {
                Table table = new Table(item);
                takeAway.Add(table);
            }

            return takeAway;
        }

        public List<Table> LoadTableListThuong()
        {
            List<Table> tableListThuong = new List<Table>();

            DataTable thuong = DataProvider.Instance.ExecuteQuery("exec ban_maloai @MaLoaiBan = 1");
            foreach (DataRow item in thuong.Rows)
            {
                Table table = new Table(item);
                tableListThuong.Add(table);
            }

            return tableListThuong;
        }

        public List<Table> LoadTableListVip()
        {
            List<Table> tableListVip = new List<Table>();

            DataTable vip = DataProvider.Instance.ExecuteQuery("exec ban_maloai @MaLoaiBan = 2");
            foreach (DataRow item in vip.Rows)
            {
                Table table = new Table(item);
                tableListVip.Add(table);
            }

            return tableListVip;
        }


    }
}
