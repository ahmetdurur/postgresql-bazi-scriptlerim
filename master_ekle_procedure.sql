CREATE OR REPLACE PROCEDURE public.master_ekle(
	borsa_id numeric,
	coin_id numeric,
	coin_fiyat numeric,
	alinan_coin_cinsi_komisyon numeric,
	alinan_coin_toplam_miktar numeric , 
	tarih timestamp
)
LANGUAGE 'plpgsql'
AS $BODY$
begin
insert into crypto_trade_master (t_borsa_id , t_coin_id, t_coin_fiyat ,t_alinan_coin_cinsi_komisyon, t_alinan_coin_toplam_miktar,t_tarih ,t_kayit_tarihi) 
values (borsa_id, coin_id , coin_fiyat , alinan_coin_cinsi_komisyon , alinan_coin_toplam_miktar ,tarih, (select current_timestamp)) ;
end
$BODY$;