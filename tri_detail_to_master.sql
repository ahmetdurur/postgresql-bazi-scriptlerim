create or replace FUNCTION public.tri_detail_to_master ()
returns trigger
language plpgsql
as $BODY$
declare  master_id numeric = new.t_master_id;
		 acik_pozisyon numeric ;
		 kapatilan_miktar numeric;
begin 	
		 kapatilan_miktar = new.t_satilan_coin_miktar;
		 acik_pozisyon = (select t_acik_pozisyon_miktar from crypto_trade_master where t_id = master_id);	
		 update crypto_trade_master set t_acik_pozisyon_miktar = (acik_pozisyon - kapatilan_miktar ) where t_id = master_id ; 
		 return null ;
end
$BODY$
	