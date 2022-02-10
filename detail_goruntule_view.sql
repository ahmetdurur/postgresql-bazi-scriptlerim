CREATE OR REPLACE VIEW public.detail_goruntule
 AS
select  detail.t_id as id,
		master.t_id as masterId,
		borsa.t_borsa_ad as borsa,
		coin.t_kisaltma_ad as coin,
		detail.t_satilan_coin_fiyat as fiyat ,
		detail.t_satilan_coin_miktar as coinSatisMiktari,
		detail.t_usdt_miktar as usdtMiktar,
		detail.t_usdt_cinsi_borsa_komisyonu as usdtKomisyon, 
		detail.t_net_usdt_kar as netKar ,
		detail.t_islem_tarihi as islemTarihi,
		detail.t_kayit_tarihi as kayitTarihi
from crypto_trade_detail detail
join crypto_trade_master master ON master.t_id = detail.t_master_id
join crypto_coin coin on coin.t_id = master.t_coin_id
join crypto_borsa borsa on borsa.t_id = master.t_borsa_id