create or replace function iki_transaction_arasi_gunluk_ortalama_gelir(oncekiid numeric , sonrakiid numeric) 
returns table (idd numeric , eth numeric , gun_fark integer , ortalama_gunluk numeric , tarih timestamptz)
language plpgsql
as $$
begin
	return query
	(select
		sonraki.t_id ,
		sonraki.t_eth_value ,
		(EXTRACT(epoch FROM (age(sonraki.t_tarih , onceki.t_tarih)))/86400)::int gun_fark , 
		((sonraki.t_eth_value	) / (EXTRACT(epoch FROM (age(sonraki.t_tarih , onceki.t_tarih)))/86400)::int ) ortalama_gunluk,
		sonraki.t_tarih
	from 
		(select * from crypto_transactions where t_id =sonrakiid) as sonraki ,
		(select * from crypto_transactions where t_id =oncekiid) as onceki 	
	union 
	select 
		onceki.t_id ,
		onceki.t_eth_value ,
		null gun_fark ,
		null ortalama_gunluk,
		onceki.t_tarih
	from 
		(select * from crypto_transactions where t_id =sonrakiid) as sonraki ,
		(select * from crypto_transactions where t_id =oncekiid) as onceki ) ;
end $$