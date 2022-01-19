CREATE OR REPLACE PROCEDURE public.detail_ekle(
	master_id numeric,
	coin_fiyat numeric,
	coin_miktar numeric,
	usdt_cinsi_komisyon numeric,
	tarih timestamp
)
LANGUAGE 'plpgsql'
AS $BODY$
begin
insert into crypto_trade_detail (t_master_id , t_satilan_coin_fiyat ,t_satilan_coin_miktar, t_usdt_cinsi_borsa_komisyonu,t_islem_tarihi ,t_kayit_tarihi) 
values (master_id, coin_fiyat , coin_miktar , usdt_cinsi_komisyon ,tarih, (select current_timestamp)) ;
end
$BODY$;