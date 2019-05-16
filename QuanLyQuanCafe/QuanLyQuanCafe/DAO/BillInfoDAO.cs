using QuanLyQuanCafe.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanCafe.DAO
{
    public class BillInfoDAO
    {
        private static BillInfoDAO instance;

        internal static BillInfoDAO Instance
        {
            get {
                if (instance == null)
                {
                    instance = new BillInfoDAO();
                }
                return BillInfoDAO.instance; 
            }
            private set { BillInfoDAO.instance = value; }
        }

        private BillInfoDAO() { }

        public List<BillInfo> getListBillInfo(int maBill){
            List<BillInfo> listBillInfo = new List<BillInfo>();

            DataTable data = DataProvider.Instance.ExecuteQuery("exec ctbill_idbill @idBill =" + maBill);
            foreach (DataRow item in data.Rows)
            {
                BillInfo billInfo = new BillInfo(item);
                listBillInfo.Add(billInfo);
            }

            return listBillInfo;
        }

        public void InsertBillinfo(int mabill, int masp, int soluong)
        {
            String a = "USP_InsertBillInfo"+ mabill +','+ masp +',' + soluong;
            DataProvider.Instance.ExecuteNonQuery("USP_InsertBillInfo @MaBill , @MaSP , @SoLuong", new object[] { mabill, masp, soluong });
        }

        public void UpdateBillInfo(int matv)
        {
            
        }
    }
}
