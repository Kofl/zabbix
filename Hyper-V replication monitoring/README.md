# Hyper-V VM replication status

Based on the work and discussions of

<a href="https://www.zabbix.com/forum/zabbix-help/468172-hyper-v-replication-auto-discovery-help-first-time?__cf_chl_tk=YkMrIObVQpv1vshMuPeYZElhnSsFPjUsL.k3EEnsN6U-1732963932-1.0.1.1-kVe_cyqarKS9bGf.XOKuoSRe4rBxqS6KS4Zuq1fXjB8">Hyper V Replication Auto Discovery Help - First Time</a>

##### Setup:

- Put Get-HyperVReplicationStatus.ps1 at your Hyper-V host into the directory: *C:\Program Files\Zabbix Agent 2\scripts*
- Add to your *zabbix_agent2.conf* on the Hyper-V server:

`UserParameter=vm.replication.status[*],powershell -NoProfile -ExecutionPolicy Bypass -File "C:\Program Files\Zabbix Agent 2\scripts\Get-HyperVReplicationStatus.ps1" "$1"`

- Restart your Zabbix2 Agent
- Import the template into your Zabbix installation and apply it to your Hyper-V host.
- Template uses Zabbix 2 active agent, change to passive agent if required.
- The timeout for the item has already been increased to 10s to prevent failures if the script takes longer.
