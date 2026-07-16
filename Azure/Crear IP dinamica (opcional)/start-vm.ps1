$resourceGroup = "misifus-server_group_12270944" #Grupo
$vmName = "misifus-server"     #Nombre de la VM
$nicName = "misifus-server363" #Network Interface(NIC)
$ipName = "ip-misifus"         #Nombre de la IP
$location = "chilecentral"     #Locación la VM


# Crear IP pública
az network public-ip create `
  --resource-group $resourceGroup `
  --name $ipName `
  --sku Standard `
  --allocation-method Static `
  --location $location

# Asociarla a la NIC
az network nic ip-config update `
  --resource-group $resourceGroup `
  --nic-name $nicName `
  --name ipconfig1 `
  --public-ip-address $ipName

# Iniciar VM
az vm start `
  --resource-group $resourceGroup `
  --name $vmName

# Mostrar IP
az vm list-ip-addresses `
  --resource-group $resourceGroup `
  --name $vmName `
  --output table