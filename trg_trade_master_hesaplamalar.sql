create trigger trg_trade_master_hesaplamalar
after insert on public.crypto_trade_master
for each row 
execute procedure tri_master_auto_assignments();