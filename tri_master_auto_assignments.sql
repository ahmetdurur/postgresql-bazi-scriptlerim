create or replace function tri_master_auto_assignments()
returns trigger
language plpgsql
as $BODY$
declare  	kayit_id numeric = new.t_id ;
			acik_pozisyon numeric = new.t_alinan_coin_toplam_miktar ;
			usdt_miktar numeric = (new.t_coin_fiyat) * (new.t_alinan_coin_toplam_miktar);
			durum numeric = 1 ;
begin
		update crypto_trade_master set t_acik_pozisyon_coin_miktar = acik_pozisyon , t_usdt_miktar = usdt_miktar , t_trade_durum = durum
		where t_id = kayit_id;
		return null;
end
$BODY$ ;