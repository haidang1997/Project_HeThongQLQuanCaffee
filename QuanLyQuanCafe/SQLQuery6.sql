USE [QLQuanCafe]
GO
/****** Object:  StoredProcedure [dbo].[thanhtoan]    Script Date: 05/05/2019 6:48:51 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[thanhtoan]
@MaBill int
as 
begin
	update Bill set TrangThai = 1 where MaBill = @MaBill
	declare @maban int 
	select @maban = MaBan from Bill where MaBill = @MaBill
	update Ban set TrangThai = 0 where MaBan = @maban
end
