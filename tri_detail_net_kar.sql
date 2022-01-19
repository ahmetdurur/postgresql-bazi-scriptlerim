create or replace function public.tri_detail_net_kar()
returns trigger
language plpgsql
as $$
declare master_id numeric = new.t_master_id ;
		detay_id numeric = new.t_id;
		alim_fiyati numeric ;
		satis_fiyati numeric ;
		kar numeric ;
		usdt_miktar numeric = (new.t_satilan_coin_fiyat) * (new.t_satilan_coin_miktar);
begin	
	alim_fiyati = (select t_coin_fiyat from crypto_trade_master  where t_id = master_id );
	satis_fiyati = new.t_satilan_coin_fiyat;
	kar = (satis_fiyati - alim_fiyati) * new.t_satilan_coin_miktar ;
	update crypto_trade_detail set t_net_usdt_kar = kar  , t_usdt_miktar = usdt_miktar 
	where t_id = detay_id ;
	return null;
end 
$$