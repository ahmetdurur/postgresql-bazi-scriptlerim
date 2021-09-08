create trigger trg_audit_crypto_transactions
after insert or update or delete 
on public.crypto_transactions 
for each row execute procedure audit_log.tri_auditlog();