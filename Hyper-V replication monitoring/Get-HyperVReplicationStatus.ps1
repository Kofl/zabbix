# Function to get Hyper-V VM replication status and output LLD JSON data
function Get-HyperVReplicationStatus {
    $vms = Get-VM
    
    $lldData = @()
    foreach ($vm in $vms) {
        $replication = Get-VMReplication -VMName $vm.VMName -ErrorAction SilentlyContinue
        
        $vmData = @{
            "VMName" = $vm.VMName
            "ReplicationEnabled" = if ($replication) { $true } else { $false }
            "ReplicationMode" = if ($replication) { $replication.ReplicationMode } else { "Disabled" }
            "ReplicationState" = if ($replication) { $replication.ReplicationState } else { "N/A" }
            "HealthStatus" = if ($replication) { $replication.Health } else { "N/A" }
        }
        $lldData += $vmData
    }
    
    $lldJson = $lldData | ConvertTo-Json -Depth 100
    Write-Output $lldJson
}

# Get Hyper-V VM replication status and output LLD JSON data
Get-HyperVReplicationStatus