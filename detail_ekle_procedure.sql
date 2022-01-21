CREATE OR REPLACE PROCEDURE public.detail_ekle(
	master_id numeric,
	coin_fiyat numeric,
	coin_miktar numeric,
	usdt_komisyon_yuzde_oran numeric,
	tarih timestamp without time zone)
LANGUAGE 'plpgsql'
AS $BODY$
begin
insert into crypto_trade_detail (t_master_id , t_satilan_coin_fiyat ,t_satilan_coin_miktar, t_islem_tarihi ,t_kayit_tarihi , t_usdt_komisyon_yuzde_oran ) 
values (master_id, coin_fiyat , coin_miktar  ,tarih, (select current_timestamp) , usdt_komisyon_yuzde_oran) ;
end
$BODY$;