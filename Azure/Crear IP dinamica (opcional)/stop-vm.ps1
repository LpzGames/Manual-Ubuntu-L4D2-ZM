$resourceGroup = "misifus-server_group_12270944"  #Grupo
$vmName = "misifus-server"			#Nombre de la VM
$nicName = "misifus-server363"		#Network Interface(NIC)
$ipName = "ip-misifus"				#Nombre de la IP

# Desasociar IP
az network nic ip-config update `
  --resource-group $resourceGroup `
  --nic-name $nicName `
  --name ipconfig1 `
  --remove publicIpAddress

# Deallocate VM
az vm deallocate `
  --resource-group $resourceGroup `
  --name $vmName

# Borrar IP
az network public-ip delete `
  --resource-group $resourceGroup `
  --name $ipName