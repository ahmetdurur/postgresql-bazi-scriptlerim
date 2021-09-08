create trigger trg_audit_eth_mining_pools
after insert or update or delete 
on public.eth_mining_pools 
for each row execute procedure audit_log.tri_auditlog();