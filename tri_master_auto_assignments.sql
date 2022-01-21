CREATE OR REPLACE FUNCTION public.tri_master_auto_assignments()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
declare  	kayit_id numeric = new.t_id ;
			usdt_miktar numeric = (new.t_coin_fiyat) * (new.t_alinan_coin_toplam_miktar);
			durum numeric = 1 ;
			komisyon_oran numeric = new.t_coin_komisyon_yuzde_oran ;
			komisyon_miktar numeric = (new.t_alinan_coin_toplam_miktar * komisyon_oran ) / 100 ;
			coin_gercek_miktar numeric = new.t_alinan_coin_toplam_miktar - komisyon_miktar ; 
begin
		update crypto_trade_master set 
		t_acik_pozisyon_coin_miktar = coin_gercek_miktar , 
		t_alinan_coin_gercek_miktar = coin_gercek_miktar ,
		t_usdt_miktar = usdt_miktar , 
		t_trade_durum = durum ,
		t_alinan_coin_cinsi_komisyon = komisyon_miktar
		where t_id = kayit_id;
		return null;
end
$BODY$;

ALTER FUNCTION public.tri_master_auto_assignments()
    OWNER TO postgres;