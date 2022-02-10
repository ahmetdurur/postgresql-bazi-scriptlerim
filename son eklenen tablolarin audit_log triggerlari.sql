create trigger trg_audit_crypto_borsa
after insert or delete or update on public.crypto_borsa
for each row execute procedure audit_log.tri_auditlog();

create trigger trg_audit_crypto_coin
after insert or delete or update on public.crypto_coin
for each row execute procedure audit_log.tri_auditlog();

create trigger trg_audit_crypto_trade_detail
after insert or delete or update on public.crypto_trade_detail
for each row execute procedure audit_log.tri_auditlog();

create trigger trg_audit_crypto_trade_master
after insert or delete or update on public.crypto_trade_master
for each row execute procedure audit_log.tri_auditlog();

create trigger trg_audit_crypto_trade_durum
after insert or delete or update on public.crypto_trade_durum
for each row execute procedure audit_log.tri_auditlog();