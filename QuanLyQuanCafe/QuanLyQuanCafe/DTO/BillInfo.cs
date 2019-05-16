using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanCafe.DTO
{
    public class BillInfo
    {
        public BillInfo(int maCTBill, int maSP, int soLuong, int maTV)
        {
            this.MaCTBill = maCTBill;
            this.MaBill = maBill;
            this.MaSP = maSP;
            this.SoLuong = soLuong;
            //this.MaTV = maTV;
        }

        public BillInfo(DataRow row)
        {
            this.MaCTBill = (int)row["MaCTBill"];
            this.MaBill = (int)row["MaBill"];
            this.MaSP = (int)row["MaSP"];
            this.SoLuong = (int)row["SoLuong"];
           // this.MaTV = (int)row["MaTV"];
        }

        private int maCTBill;

        public int MaCTBill
        {
            get { return maCTBill; }
            set { maCTBill = value; }
        }

        private int maBill;

        public int MaBill
        {
            get { return maBill; }
            set { maBill = value; }
        }

        private int maSP;

        public int MaSP
        {
            get { return maSP; }
            set { maSP = value; }
        }

        private int soLuong;

        public int SoLuong
        {
            get { return soLuong; }
            set { soLuong = value; }
        }

        //private int maTV;

        //public int MaTV
        //{
        //    get { return maTV; }
        //    set { maTV = value; }
        //}
    }
}
