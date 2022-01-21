CREATE OR REPLACE FUNCTION public.tri_detail_delete_to_master()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
declare  master_id numeric = old.t_master_id;
		 acik_pozisyon numeric ;
		 silinen_miktar numeric;
		 durum numeric;
		 master_toplam_usdt_profit numeric ;
begin 	
		 master_toplam_usdt_profit = (select t_toplam_usdt_profit from crypto_trade_master where t_id = master_id);
		 silinen_miktar = old.t_satilan_coin_miktar ;
		 acik_pozisyon = (select t_acik_pozisyon_coin_miktar from crypto_trade_master where t_id = master_id);
		 --if (acik_pozisyon + silinen_miktar <> 0 ) then master_toplam_usdt_profit = null; endif ;
		 if(acik_pozisyon + silinen_miktar = acik_pozisyon)  then durum = 1  ; 
		 elseif (acik_pozisyon + silinen_miktar > 0) then durum = 3 ; master_toplam_usdt_profit = null;
		 elseif (acik_pozisyon + silinen_miktar = 0 ) then durum = 2 ; master_toplam_usdt_profit = null;
		 end if;
			update crypto_trade_master set t_acik_pozisyon_coin_miktar = (acik_pozisyon + silinen_miktar ) ,
		 	t_trade_durum = durum , t_toplam_usdt_profit = master_toplam_usdt_profit
			where t_id = master_id ; 
		 return null ;
end
$BODY$;

ALTER FUNCTION public.tri_detail_delete_to_master()
    OWNER TO postgres;