CREATE OR REPLACE PROCEDURE public.master_ekle(
	borsa_id numeric,
	coin_id numeric,
	coin_fiyat numeric,
	coin_komisyon_oran numeric,
	alinan_coin_toplam_miktar numeric,
	tarih timestamp without time zone)
LANGUAGE 'plpgsql'
AS $BODY$
begin
insert into crypto_trade_master (t_borsa_id , t_coin_id, t_coin_fiyat , t_alinan_coin_toplam_miktar,t_tarih ,t_kayit_tarihi, t_coin_komisyon_yuzde_oran) 
values (borsa_id, coin_id , coin_fiyat , alinan_coin_toplam_miktar ,tarih, (select current_timestamp), coin_komisyon_oran ) ;
end
$BODY$;