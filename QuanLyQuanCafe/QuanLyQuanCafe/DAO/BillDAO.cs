using QuanLyQuanCafe.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanCafe.DAO
{
    class BillDAO
    {
        private static BillDAO instance;

        internal static BillDAO Instance
        {
            get {
                if (instance == null)
                {
                    instance = new BillDAO();
                }
                return BillDAO.instance; 
            }
            private set { BillDAO.instance = value; }
        }

        private BillDAO() { }
        

        //Thành công: Mã Bill
        //Thất bại: -1
        public int GetUncheckedBillIDByTableID(int maban)
        {
            DataTable data = DataProvider.Instance.ExecuteQuery("exec getUncheckedID @MaBan =" + maban);
            if (data.Rows.Count > 0)
            {
                Bill bill = new Bill(data.Rows[0]);
                return bill.MaBill;
            }


            return -1;
        }

        public void InsertBill(int id)
        {
            DataProvider.Instance.ExecuteNonQuery("exec insertBill " + id);
        }

        public int getLatestIdBill()
        {
            try
            {
               return (int)DataProvider.Instance.ExecuteSclalar("Select Max(MaBill) from Bill");
            }
            catch
            {
                return 1;
            }
        }

        public void ThanhToan(int id)
        {
            string query = "exec thanhtoan @MaBill = " + id;
            DataProvider.Instance.ExecuteNonQuery(query);
        }
    }
}
