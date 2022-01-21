CREATE OR REPLACE FUNCTION public.tri_detail_net_kar()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
declare master_id numeric = new.t_master_id ;
		detay_id numeric = new.t_id;
		alim_fiyati numeric ;
		satis_fiyati numeric ;
		kar numeric ;
		usdt_miktar numeric = (new.t_satilan_coin_fiyat) * (new.t_satilan_coin_miktar);
		usdt_komisyon_oran numeric = new.t_usdt_komisyon_yuzde_oran ;
		usdt_komisyon_miktar numeric = usdt_miktar * usdt_komisyon_oran / 100 ;
		net_usdt_miktar numeric = usdt_miktar - usdt_komisyon_miktar;
begin	
	alim_fiyati = (select t_coin_fiyat from crypto_trade_master  where t_id = master_id );
	satis_fiyati = new.t_satilan_coin_fiyat;
	kar = ((satis_fiyati - alim_fiyati) * new.t_satilan_coin_miktar ) - usdt_komisyon_miktar ;
	update crypto_trade_detail set 
	t_net_usdt_kar = kar  ,
	t_usdt_miktar = usdt_miktar ,
	t_usdt_cinsi_borsa_komisyonu = usdt_komisyon_miktar , 
	t_net_usdt_miktar = net_usdt_miktar 
	
	where t_id = detay_id ;
	return null;
end
$BODY$;