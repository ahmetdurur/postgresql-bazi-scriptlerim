create trigger trg_audit_eth_gunluk_gelir 
after insert or update or delete 
on public.eth_gunluk_gelir 
for each row execute procedure audit_log.tri_auditlog();