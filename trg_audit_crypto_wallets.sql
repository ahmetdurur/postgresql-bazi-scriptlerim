create trigger trg_audit_crypto_wallets
after insert or update or delete 
on public.crypto_wallets 
for each row execute procedure audit_log.tri_auditlog();