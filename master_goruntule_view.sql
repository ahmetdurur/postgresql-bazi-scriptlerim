create or replace view master_goruntule as 
select  master.t_id as masterId ,
		borsa.t_borsa_ad as borsa,
		coin.t_kisaltma_ad as coin , 
		master.t_coin_fiyat as coinFiyat,
		master.t_alinan_coin_cinsi_komisyon as coinCinsiKomisyon,
		master.t_alinan_coin_toplam_miktar as toplamCoinMiktar,
		master.t_acik_pozisyon_coin_miktar as coinAcikPozisyon,
		master.t_usdt_miktar as usdtMiktar,
		master.t_toplam_usdt_profit as karZarar, 
		durum.t_durum as durum,
		master.t_tarih as tarih,
		master.t_kayit_tarihi as kayitTarihi
from crypto_trade_master master 
join crypto_borsa borsa ON borsa.t_id = master.t_borsa_id
join crypto_coin coin ON coin.t_id = master.t_coin_id
join crypto_trade_durum durum on durum.t_id = master.t_trade_durum