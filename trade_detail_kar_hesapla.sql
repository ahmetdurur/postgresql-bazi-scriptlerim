create trigger trade_detail_kar_hesapla
after insert on public.crypto_trade_detail
for each row 
execute procedure public.tri_detail_net_kar();