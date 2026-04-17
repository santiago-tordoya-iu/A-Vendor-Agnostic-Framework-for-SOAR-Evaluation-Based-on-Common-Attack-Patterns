param virtualMachines_dc01_name string = 'dc01'
param virtualMachines_ws01_name string = 'ws01'
param sshPublicKeys_wazuh_key_name string = 'wazuh_key'
param virtualMachines_wazuh01_name string = 'wazuh01'
param natGateways_soar_lab_nat_name string = 'soar_lab_nat'
param sshPublicKeys_wazuh01_key_name string = 'wazuh01_key'
param publicIPAddresses_nat_pip_name string = 'nat-pip'
param publicIPAddresses_pip_wazuh_name string = 'pip-wazuh'
param virtualNetworks_lab_network_name string = 'lab_network'
param bastionHosts_bastion_soarlab_name string = 'bastion-soarlab'
param networkInterfaces_dc01159_z1_name string = 'dc01159_z1'
param networkInterfaces_ws01785_z1_name string = 'ws01785_z1'
param networkSecurityGroups_nsg_dc_name string = 'nsg-dc'
param networkInterfaces_wazuh01240_z1_name string = 'wazuh01240_z1'
param networkSecurityGroups_nsg_wazuh_name string = 'nsg-wazuh'
param applicationSecurityGroups_asg_dc_name string = 'asg-dc'
param networkSecurityGroups_nsg_endpoint_name string = 'nsg-endpoint'
param applicationSecurityGroups_asg_wazuh_name string = 'asg-wazuh'
param publicIPAddresses_pip_bastion_soarlab_name string = 'pip-bastion-soarlab'
param applicationSecurityGroups_asg_workstation_name string = 'asg-workstation'

resource sshPublicKeys_wazuh_key_name_resource 'Microsoft.Compute/sshPublicKeys@2025-04-01' = {
  name: sshPublicKeys_wazuh_key_name
  location: 'germanywestcentral'
  properties: {
    publicKey: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDO3btcf3LEtX84ub/VVwRdtOgsMaU4yQ0V0LdCHPEhGhn/lXa8Rj1iHGeA8MWJtUKtNYPQxb3bH5WtfoiOmmCn2qZVMXiCYGvaV1NOkk/9C1gLP82Pb+jZEKwlOI0w/ozqBhz4bWt/7MsrgMVHGk7jITH6r0Eu6Ip1VhX+EX7DtQD52BWjycQFo5higc0G71LV1aU/UqAVjdQrkVIiz9Us+HZLsfphAfrxOdwNdBUHN0ca+Vd329yxH7FI9//4MKZnwRVGgC/J3mOPc+sNix7N8l7cF+N9oQmwi313/oZsW0yo9nkKFhz0Yzn+VPmThM45uhR5nY/zicBXhXDivDmpY55AHS/aDJOaRIQ6+Xy5ec88zvj64R/aXMXaogixvlMPZHw6FH+XZK9wASV8a8pKx1t9XlzALSzlY3F+2VPvanfRHZOzcaAOCS+VMjdG3uA0PdKsWunqLnQJHOl5KF2wI+2gk9dOnZSk8v+kySqTVXB7jsxteX/2hoY1IDWa07U= generated-by-azure'
  }
}

resource sshPublicKeys_wazuh01_key_name_resource 'Microsoft.Compute/sshPublicKeys@2025-04-01' = {
  name: sshPublicKeys_wazuh01_key_name
  location: 'germanywestcentral'
  properties: {
    publicKey: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDPlmv5PSd5Kp4p6IHHTmYoQTFidTlbTh9kzDE275XWLeeqja4au/0Y7ZwFuTzdjENtJ+ymEDeQfZq49PZHHudqh7+rOlGyFgw8fU3I5j4vv5DkCz5VmYGWxJDV3dM4pMeb6j8DMG/0d8AkMU3P7efMz49i1CDfMJ/XaYKhAAPbGo6io7sbkDwiqEmk4eZMZjvJUEEkfO2Zmz2nyAmtE21VTbIoOZf2e4y6vgWpqsde4kvKkbg+sNIYEETrzXXLXfCtD47FLY/7EmYEIi/f9wCGoiHcQMiBBXn/2+YaOvhyGmDqel238F3N2eP+zLfCCcKPr89ZL3Kpgwe1FO/Ct29JMBNqZdZ9FllNsFWdUDuO30loqBxSt6mxgfwkrjZ8Pjdz3d9ZEF7BoB8dV/FPLStyeVBgKPTHVj6PHx7cptCLobZ6bj0WMVxxKNw0y0/etngHj6lFnpPyHFbpiCMR1Oa0PVKugO112tnnZfp35f6exO+agm5cNh/J4OMtmH55B80= generated-by-azure'
  }
}

resource applicationSecurityGroups_asg_dc_name_resource 'Microsoft.Network/applicationSecurityGroups@2025-05-01' = {
  name: applicationSecurityGroups_asg_dc_name
  location: 'germanywestcentral'
  properties: {}
}

resource applicationSecurityGroups_asg_wazuh_name_resource 'Microsoft.Network/applicationSecurityGroups@2025-05-01' = {
  name: applicationSecurityGroups_asg_wazuh_name
  location: 'germanywestcentral'
  properties: {}
}

resource applicationSecurityGroups_asg_workstation_name_resource 'Microsoft.Network/applicationSecurityGroups@2025-05-01' = {
  name: applicationSecurityGroups_asg_workstation_name
  location: 'germanywestcentral'
  properties: {}
}

resource publicIPAddresses_pip_bastion_soarlab_name_resource 'Microsoft.Network/publicIPAddresses@2025-05-01' = {
  name: publicIPAddresses_pip_bastion_soarlab_name
  location: 'germanywestcentral'
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  zones: [
    '3'
    '2'
    '1'
  ]
  properties: {
    ipAddress: '131.189.24.79'
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
    ipTags: []
  }
}

resource publicIPAddresses_pip_wazuh_name_resource 'Microsoft.Network/publicIPAddresses@2025-05-01' = {
  name: publicIPAddresses_pip_wazuh_name
  location: 'germanywestcentral'
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  zones: [
    '3'
    '2'
    '1'
  ]
  properties: {
    ipAddress: '20.170.75.248'
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
    ipTags: []
    ddosSettings: {
      protectionMode: 'Disabled'
    }
  }
}

resource virtualMachines_dc01_name_resource 'Microsoft.Compute/virtualMachines@2025-04-01' = {
  name: virtualMachines_dc01_name
  location: 'germanywestcentral'
  zones: [
    '1'
  ]
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_D2ads_v7'
    }
    additionalCapabilities: {
      hibernationEnabled: false
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: '2022-datacenter-azure-edition'
        version: 'latest'
      }
      osDisk: {
        osType: 'Windows'
        name: '${virtualMachines_dc01_name}_OsDisk_1_3f4418f092054c0ab62e275d73f1a35a'
        createOption: 'FromImage'
        caching: 'ReadWrite'
        managedDisk: {
          storageAccountType: 'StandardSSD_LRS'
          id: resourceId(
            'Microsoft.Compute/disks',
            '${virtualMachines_dc01_name}_OsDisk_1_3f4418f092054c0ab62e275d73f1a35a'
          )
        }
        deleteOption: 'Delete'
        diskSizeGB: 127
      }
      dataDisks: []
      diskControllerType: 'NVMe'
    }
    osProfile: {
      computerName: virtualMachines_dc01_name
      adminUsername: 'dc_administrator'
      windowsConfiguration: {
        provisionVMAgent: true
        enableAutomaticUpdates: true
        patchSettings: {
          patchMode: 'AutomaticByOS'
          assessmentMode: 'ImageDefault'
          enableHotpatching: false
        }
      }
      secrets: []
      allowExtensionOperations: true
      requireGuestProvisionSignal: true
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterfaces_dc01159_z1_name_resource.id
          properties: {
            deleteOption: 'Delete'
          }
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
      }
    }
  }
}

resource virtualMachines_wazuh01_name_resource 'Microsoft.Compute/virtualMachines@2025-04-01' = {
  name: virtualMachines_wazuh01_name
  location: 'germanywestcentral'
  zones: [
    '1'
  ]
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_D4alds_v7'
    }
    additionalCapabilities: {
      hibernationEnabled: false
    }
    storageProfile: {
      imageReference: {
        publisher: 'canonical'
        offer: 'ubuntu-24_04-lts'
        sku: 'server'
        version: 'latest'
      }
      osDisk: {
        osType: 'Linux'
        name: '${virtualMachines_wazuh01_name}_OsDisk_1_ac46e4518c5a4caf9084ae48d62863fa'
        createOption: 'FromImage'
        caching: 'ReadWrite'
        managedDisk: {
          storageAccountType: 'StandardSSD_LRS'
          id: resourceId(
            'Microsoft.Compute/disks',
            '${virtualMachines_wazuh01_name}_OsDisk_1_ac46e4518c5a4caf9084ae48d62863fa'
          )
        }
        deleteOption: 'Delete'
        diskSizeGB: 64
      }
      dataDisks: []
      diskControllerType: 'NVMe'
    }
    osProfile: {
      computerName: virtualMachines_wazuh01_name
      adminUsername: 'azureuser'
      linuxConfiguration: {
        disablePasswordAuthentication: true
        ssh: {
          publicKeys: [
            {
              path: '/home/azureuser/.ssh/authorized_keys'
              keyData: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDPlmv5PSd5Kp4p6IHHTmYoQTFidTlbTh9kzDE275XWLeeqja4au/0Y7ZwFuTzdjENtJ+ymEDeQfZq49PZHHudqh7+rOlGyFgw8fU3I5j4vv5DkCz5VmYGWxJDV3dM4pMeb6j8DMG/0d8AkMU3P7efMz49i1CDfMJ/XaYKhAAPbGo6io7sbkDwiqEmk4eZMZjvJUEEkfO2Zmz2nyAmtE21VTbIoOZf2e4y6vgWpqsde4kvKkbg+sNIYEETrzXXLXfCtD47FLY/7EmYEIi/f9wCGoiHcQMiBBXn/2+YaOvhyGmDqel238F3N2eP+zLfCCcKPr89ZL3Kpgwe1FO/Ct29JMBNqZdZ9FllNsFWdUDuO30loqBxSt6mxgfwkrjZ8Pjdz3d9ZEF7BoB8dV/FPLStyeVBgKPTHVj6PHx7cptCLobZ6bj0WMVxxKNw0y0/etngHj6lFnpPyHFbpiCMR1Oa0PVKugO112tnnZfp35f6exO+agm5cNh/J4OMtmH55B80= generated-by-azure'
            }
          ]
        }
        provisionVMAgent: true
        patchSettings: {
          patchMode: 'ImageDefault'
          assessmentMode: 'ImageDefault'
        }
      }
      secrets: []
      allowExtensionOperations: true
      requireGuestProvisionSignal: true
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterfaces_wazuh01240_z1_name_resource.id
          properties: {
            deleteOption: 'Delete'
          }
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
      }
    }
  }
}

resource virtualMachines_ws01_name_resource 'Microsoft.Compute/virtualMachines@2025-04-01' = {
  name: virtualMachines_ws01_name
  location: 'germanywestcentral'
  zones: [
    '1'
  ]
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_D2ads_v7'
    }
    additionalCapabilities: {
      hibernationEnabled: false
    }
    storageProfile: {
      imageReference: {
        publisher: 'microsoftwindowsdesktop'
        offer: 'windows-11'
        sku: 'win11-25h2-ent'
        version: 'latest'
      }
      osDisk: {
        osType: 'Windows'
        name: '${virtualMachines_ws01_name}_OsDisk_1_b9f50839368b471584ef76d540538b3d'
        createOption: 'FromImage'
        caching: 'ReadWrite'
        managedDisk: {
          storageAccountType: 'StandardSSD_LRS'
          id: resourceId(
            'Microsoft.Compute/disks',
            '${virtualMachines_ws01_name}_OsDisk_1_b9f50839368b471584ef76d540538b3d'
          )
        }
        deleteOption: 'Delete'
        diskSizeGB: 127
      }
      dataDisks: []
      diskControllerType: 'NVMe'
    }
    osProfile: {
      computerName: virtualMachines_ws01_name
      adminUsername: 'ws_administrator'
      windowsConfiguration: {
        provisionVMAgent: true
        enableAutomaticUpdates: true
        patchSettings: {
          patchMode: 'AutomaticByOS'
          assessmentMode: 'ImageDefault'
          enableHotpatching: false
        }
      }
      secrets: []
      allowExtensionOperations: true
      requireGuestProvisionSignal: true
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterfaces_ws01785_z1_name_resource.id
          properties: {
            deleteOption: 'Delete'
          }
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
      }
    }
    licenseType: 'Windows_Client'
  }
}

resource virtualMachines_dc01_name_enablevmAccess 'Microsoft.Compute/virtualMachines/extensions@2025-04-01' = {
  parent: virtualMachines_dc01_name_resource
  name: 'enablevmAccess'
  location: 'germanywestcentral'
  properties: {
    autoUpgradeMinorVersion: true
    publisher: 'Microsoft.Compute'
    type: 'VMAccessAgent'
    typeHandlerVersion: '2.0'
    settings: {
      userName: 'dc_administrator'
    }
    protectedSettings: {}
  }
}

resource natGateways_soar_lab_nat_name_resource 'Microsoft.Network/natGateways@2025-05-01' = {
  name: natGateways_soar_lab_nat_name
  location: 'germanywestcentral'
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    idleTimeoutInMinutes: 4
    publicIpAddresses: [
      {
        id: publicIPAddresses_nat_pip_name_resource.id
      }
    ]
  }
}

resource networkSecurityGroups_nsg_dc_name_Deny_VNet_To_DC 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  name: '${networkSecurityGroups_nsg_dc_name}/Deny-VNet-To-DC'
  properties: {
    protocol: '*'
    sourcePortRange: '*'
    destinationPortRange: '*'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: '*'
    access: 'Deny'
    priority: 4000
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    networkSecurityGroups_nsg_dc_name_resource
  ]
}

resource networkSecurityGroups_nsg_wazuh_name_Deny_VNet_To_Wazuh 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  name: '${networkSecurityGroups_nsg_wazuh_name}/Deny-VNet-To-Wazuh'
  properties: {
    protocol: '*'
    sourcePortRange: '*'
    destinationPortRange: '*'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: '*'
    access: 'Deny'
    priority: 4000
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    networkSecurityGroups_nsg_wazuh_name_resource
  ]
}

resource publicIPAddresses_nat_pip_name_resource 'Microsoft.Network/publicIPAddresses@2025-05-01' = {
  name: publicIPAddresses_nat_pip_name
  location: 'germanywestcentral'
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    natGateway: {
      id: natGateways_soar_lab_nat_name_resource.id
    }
    ipAddress: '20.113.133.11'
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
    ipTags: []
    ddosSettings: {
      protectionMode: 'VirtualNetworkInherited'
    }
  }
}

resource virtualNetworks_lab_network_name_AzureBastionSubnet 'Microsoft.Network/virtualNetworks/subnets@2025-05-01' = {
  name: '${virtualNetworks_lab_network_name}/AzureBastionSubnet'
  properties: {
    addressPrefixes: [
      '10.0.0.0/26'
    ]
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_lab_network_name_resource
  ]
}

resource bastionHosts_bastion_soarlab_name_resource 'Microsoft.Network/bastionHosts@2025-05-01' = {
  name: bastionHosts_bastion_soarlab_name
  location: 'germanywestcentral'
  sku: {
    name: 'Basic'
  }
  properties: {
    dnsName: 'bst-fe734403-d669-4e03-af16-ff18627ed2bd.bastion.azure.com'
    scaleUnits: 2
    enableTunneling: false
    enableIpConnect: false
    disableCopyPaste: false
    enableShareableLink: false
    enableKerberos: false
    enableSessionRecording: false
    enablePrivateOnlyBastion: false
    ipConfigurations: [
      {
        name: 'IpConf'
        id: '${bastionHosts_bastion_soarlab_name_resource.id}/bastionHostIpConfigurations/IpConf'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPAddresses_pip_bastion_soarlab_name_resource.id
          }
          subnet: {
            id: virtualNetworks_lab_network_name_AzureBastionSubnet.id
          }
        }
      }
    ]
  }
}

resource networkSecurityGroups_nsg_dc_name_Allow_Bastion_RDP 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  name: '${networkSecurityGroups_nsg_dc_name}/Allow-Bastion-RDP'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '3389'
    sourceAddressPrefix: '10.0.0.0/26'
    access: 'Allow'
    priority: 100
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
    destinationApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_dc_name_resource.id
      }
    ]
  }
  dependsOn: [
    networkSecurityGroups_nsg_dc_name_resource
  ]
}

resource networkSecurityGroups_nsg_endpoint_name_Allow_Bastion_RDP 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  name: '${networkSecurityGroups_nsg_endpoint_name}/Allow-Bastion-RDP'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '3389'
    sourceAddressPrefix: '10.0.0.0/26'
    access: 'Allow'
    priority: 100
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
    destinationApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_workstation_name_resource.id
      }
    ]
  }
  dependsOn: [
    networkSecurityGroups_nsg_endpoint_name_resource
  ]
}

resource networkSecurityGroups_nsg_wazuh_name_Allow_Bastion_SSH 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  name: '${networkSecurityGroups_nsg_wazuh_name}/Allow-Bastion-SSH'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '22'
    sourceAddressPrefix: '10.0.0.0/26'
    access: 'Allow'
    priority: 100
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
    destinationApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_wazuh_name_resource.id
      }
    ]
  }
  dependsOn: [
    networkSecurityGroups_nsg_wazuh_name_resource
  ]
}

resource networkSecurityGroups_nsg_endpoint_name_Allow_Endpoint_To_Internet 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  name: '${networkSecurityGroups_nsg_endpoint_name}/Allow-Endpoint-To-Internet'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationAddressPrefix: 'Internet'
    access: 'Allow'
    priority: 150
    direction: 'Outbound'
    sourcePortRanges: []
    destinationPortRanges: [
      '80'
      '443'
    ]
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
    sourceApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_workstation_name_resource.id
      }
    ]
  }
  dependsOn: [
    networkSecurityGroups_nsg_endpoint_name_resource
  ]
}

resource networkSecurityGroups_nsg_wazuh_name_Allow_Internet_To_Wazuh 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  name: '${networkSecurityGroups_nsg_wazuh_name}/Allow-Internet-To-Wazuh'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '55000'
    sourceAddressPrefix: '*'
    access: 'Allow'
    priority: 130
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
    destinationApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_wazuh_name_resource.id
      }
    ]
  }
  dependsOn: [
    networkSecurityGroups_nsg_wazuh_name_resource
  ]
}

resource networkSecurityGroups_nsg_wazuh_name_Allow_Wazuh_To_Internet 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  name: '${networkSecurityGroups_nsg_wazuh_name}/Allow-Wazuh-To-Internet'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationAddressPrefix: 'Internet'
    access: 'Allow'
    priority: 100
    direction: 'Outbound'
    sourcePortRanges: []
    destinationPortRanges: [
      '80'
      '443'
    ]
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
    sourceApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_wazuh_name_resource.id
      }
    ]
  }
  dependsOn: [
    networkSecurityGroups_nsg_wazuh_name_resource
  ]
}

resource networkSecurityGroups_nsg_dc_name_Deny_DC_To_Internet 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  name: '${networkSecurityGroups_nsg_dc_name}/Deny-DC-To-Internet'
  properties: {
    protocol: '*'
    sourcePortRange: '*'
    destinationPortRange: '*'
    destinationAddressPrefix: 'Internet'
    access: 'Deny'
    priority: 4000
    direction: 'Outbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
    sourceApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_dc_name_resource.id
      }
    ]
  }
  dependsOn: [
    networkSecurityGroups_nsg_dc_name_resource
  ]
}

resource networkSecurityGroups_nsg_endpoint_name_Deny_Endpoint_To_Internet 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  name: '${networkSecurityGroups_nsg_endpoint_name}/Deny-Endpoint-To-Internet'
  properties: {
    protocol: '*'
    sourcePortRange: '*'
    destinationPortRange: '*'
    destinationAddressPrefix: 'Internet'
    access: 'Deny'
    priority: 4000
    direction: 'Outbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
    sourceApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_workstation_name_resource.id
      }
    ]
  }
  dependsOn: [
    networkSecurityGroups_nsg_endpoint_name_resource
  ]
}

resource networkSecurityGroups_nsg_endpoint_name_Deny_VNet_To_Endpoint 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  name: '${networkSecurityGroups_nsg_endpoint_name}/Deny-VNet-To-Endpoint'
  properties: {
    protocol: '*'
    sourcePortRange: '*'
    destinationPortRange: '*'
    sourceAddressPrefix: '*'
    access: 'Deny'
    priority: 4000
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
    destinationApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_workstation_name_resource.id
      }
    ]
  }
  dependsOn: [
    networkSecurityGroups_nsg_endpoint_name_resource
  ]
}

resource networkSecurityGroups_nsg_wazuh_name_Deny_Wazuh_To_Internet 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  name: '${networkSecurityGroups_nsg_wazuh_name}/Deny-Wazuh-To-Internet'
  properties: {
    protocol: '*'
    sourcePortRange: '*'
    destinationPortRange: '*'
    destinationAddressPrefix: 'Internet'
    access: 'Deny'
    priority: 4000
    direction: 'Outbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
    sourceApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_wazuh_name_resource.id
      }
    ]
  }
  dependsOn: [
    networkSecurityGroups_nsg_wazuh_name_resource
  ]
}

resource virtualNetworks_lab_network_name_snet_dc 'Microsoft.Network/virtualNetworks/subnets@2025-05-01' = {
  name: '${virtualNetworks_lab_network_name}/snet-dc'
  properties: {
    addressPrefixes: [
      '10.0.1.0/24'
    ]
    networkSecurityGroup: {
      id: networkSecurityGroups_nsg_dc_name_resource.id
    }
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
    defaultOutboundAccess: false
  }
  dependsOn: [
    virtualNetworks_lab_network_name_resource
  ]
}

resource networkInterfaces_dc01159_z1_name_resource 'Microsoft.Network/networkInterfaces@2025-05-01' = {
  name: networkInterfaces_dc01159_z1_name
  location: 'germanywestcentral'
  kind: 'Regular'
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        id: '${networkInterfaces_dc01159_z1_name_resource.id}/ipConfigurations/ipconfig1'
        type: 'Microsoft.Network/networkInterfaces/ipConfigurations'
        properties: {
          privateIPAddress: '10.0.1.4'
          privateIPAllocationMethod: 'Static'
          subnet: {
            id: virtualNetworks_lab_network_name_snet_dc.id
          }
          primary: true
          privateIPAddressVersion: 'IPv4'
          applicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_dc_name_resource.id
            }
          ]
        }
      }
    ]
    dnsSettings: {
      dnsServers: []
    }
    enableAcceleratedNetworking: false
    enableIPForwarding: false
    disableTcpStateTracking: false
    networkSecurityGroup: {
      id: networkSecurityGroups_nsg_dc_name_resource.id
    }
    nicType: 'Standard'
    auxiliaryMode: 'None'
    auxiliarySku: 'None'
  }
}

resource networkInterfaces_ws01785_z1_name_resource 'Microsoft.Network/networkInterfaces@2025-05-01' = {
  name: networkInterfaces_ws01785_z1_name
  location: 'germanywestcentral'
  kind: 'Regular'
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        id: '${networkInterfaces_ws01785_z1_name_resource.id}/ipConfigurations/ipconfig1'
        type: 'Microsoft.Network/networkInterfaces/ipConfigurations'
        properties: {
          privateIPAddress: '10.0.3.4'
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: virtualNetworks_lab_network_name_snet_endpoint.id
          }
          primary: true
          privateIPAddressVersion: 'IPv4'
          applicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_workstation_name_resource.id
            }
          ]
        }
      }
    ]
    dnsSettings: {
      dnsServers: []
    }
    enableAcceleratedNetworking: false
    enableIPForwarding: false
    disableTcpStateTracking: false
    networkSecurityGroup: {
      id: networkSecurityGroups_nsg_endpoint_name_resource.id
    }
    nicType: 'Standard'
    auxiliaryMode: 'None'
    auxiliarySku: 'None'
  }
}

resource networkSecurityGroups_nsg_dc_name_resource 'Microsoft.Network/networkSecurityGroups@2025-05-01' = {
  name: networkSecurityGroups_nsg_dc_name
  location: 'germanywestcentral'
  properties: {
    securityRules: [
      {
        name: 'Allow-Bastion-RDP'
        id: networkSecurityGroups_nsg_dc_name_Allow_Bastion_RDP.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '3389'
          sourceAddressPrefix: '10.0.0.0/26'
          access: 'Allow'
          priority: 100
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
          destinationApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_dc_name_resource.id
            }
          ]
        }
      }
      {
        name: 'Allow-Endpoint-To-DC-TCP'
        id: networkSecurityGroups_nsg_dc_name_Allow_Endpoint_To_DC_TCP.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          access: 'Allow'
          priority: 110
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: [
            '53'
            '88'
            '135'
            '389'
            '445'
          ]
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
          sourceApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_workstation_name_resource.id
            }
          ]
          destinationApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_dc_name_resource.id
            }
          ]
        }
      }
      {
        name: 'Allow-Endpoint-To-DC-UDP'
        id: networkSecurityGroups_nsg_dc_name_Allow_Endpoint_To_DC_UDP.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'UDP'
          sourcePortRange: '*'
          access: 'Allow'
          priority: 120
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: [
            '53'
            '389'
            '123'
          ]
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
          sourceApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_workstation_name_resource.id
            }
          ]
          destinationApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_dc_name_resource.id
            }
          ]
        }
      }
      {
        name: 'Allow-Endpoint-To-DC-RPC-Dynamic'
        id: networkSecurityGroups_nsg_dc_name_Allow_Endpoint_To_DC_RPC_Dynamic.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '1024-65535'
          access: 'Allow'
          priority: 130
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
          sourceApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_workstation_name_resource.id
            }
          ]
          destinationApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_dc_name_resource.id
            }
          ]
        }
      }
      {
        name: 'Deny-VNet-To-DC'
        id: networkSecurityGroups_nsg_dc_name_Deny_VNet_To_DC.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Deny'
          priority: 4000
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'Allow-DC-To-Wazuh-Agent'
        id: networkSecurityGroups_nsg_dc_name_Allow_DC_To_Wazuh_Agent.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          access: 'Allow'
          priority: 100
          direction: 'Outbound'
          sourcePortRanges: []
          destinationPortRanges: [
            '1514'
            '1515'
          ]
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
          sourceApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_dc_name_resource.id
            }
          ]
          destinationApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_wazuh_name_resource.id
            }
          ]
        }
      }
      {
        name: 'Deny-DC-To-Internet'
        id: networkSecurityGroups_nsg_dc_name_Deny_DC_To_Internet.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          destinationAddressPrefix: 'Internet'
          access: 'Deny'
          priority: 4000
          direction: 'Outbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
          sourceApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_dc_name_resource.id
            }
          ]
        }
      }
      {
        name: 'Allow-Wazuh-To-DC-DNS'
        id: networkSecurityGroups_nsg_dc_name_Allow_Wazuh_To_DC_DNS.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '53'
          access: 'Allow'
          priority: 140
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
          sourceApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_wazuh_name_resource.id
            }
          ]
          destinationApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_dc_name_resource.id
            }
          ]
        }
      }
      {
        name: 'wazuh-dc-ntp'
        id: networkSecurityGroups_nsg_dc_name_wazuh_dc_ntp.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'UDP'
          sourcePortRange: '*'
          destinationPortRange: '123'
          access: 'Allow'
          priority: 150
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
          sourceApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_wazuh_name_resource.id
            }
          ]
          destinationApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_dc_name_resource.id
            }
          ]
        }
      }
    ]
  }
}

resource networkSecurityGroups_nsg_endpoint_name_resource 'Microsoft.Network/networkSecurityGroups@2025-05-01' = {
  name: networkSecurityGroups_nsg_endpoint_name
  location: 'germanywestcentral'
  properties: {
    securityRules: [
      {
        name: 'Allow-Bastion-RDP'
        id: networkSecurityGroups_nsg_endpoint_name_Allow_Bastion_RDP.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '3389'
          sourceAddressPrefix: '10.0.0.0/26'
          access: 'Allow'
          priority: 100
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
          destinationApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_workstation_name_resource.id
            }
          ]
        }
      }
      {
        name: 'Deny-VNet-To-Endpoint'
        id: networkSecurityGroups_nsg_endpoint_name_Deny_VNet_To_Endpoint.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: '*'
          access: 'Deny'
          priority: 4000
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
          destinationApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_workstation_name_resource.id
            }
          ]
        }
      }
      {
        name: 'Allow-Endpoint-To-DC-TCP'
        id: networkSecurityGroups_nsg_endpoint_name_Allow_Endpoint_To_DC_TCP.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          access: 'Allow'
          priority: 100
          direction: 'Outbound'
          sourcePortRanges: []
          destinationPortRanges: [
            '53'
            '88'
            '135'
            '389'
            '445'
          ]
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
          sourceApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_dc_name_resource.id
            }
          ]
          destinationApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_workstation_name_resource.id
            }
          ]
        }
      }
      {
        name: 'Allow-Endpoint-To-DC-UDP'
        id: networkSecurityGroups_nsg_endpoint_name_Allow_Endpoint_To_DC_UDP.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'UDP'
          sourcePortRange: '*'
          access: 'Allow'
          priority: 110
          direction: 'Outbound'
          sourcePortRanges: []
          destinationPortRanges: [
            '53'
            '389'
            '123'
          ]
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
          sourceApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_dc_name_resource.id
            }
          ]
          destinationApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_workstation_name_resource.id
            }
          ]
        }
      }
      {
        name: 'Allow-Endpoint-To-DC-RPC-Dynamic'
        id: networkSecurityGroups_nsg_endpoint_name_Allow_Endpoint_To_DC_RPC_Dynamic.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '1024-65535'
          access: 'Allow'
          priority: 120
          direction: 'Outbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
          sourceApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_dc_name_resource.id
            }
          ]
          destinationApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_workstation_name_resource.id
            }
          ]
        }
      }
      {
        name: 'Allow-Endpoint-To-Wazuh-Agent'
        id: networkSecurityGroups_nsg_endpoint_name_Allow_Endpoint_To_Wazuh_Agent.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          access: 'Allow'
          priority: 130
          direction: 'Outbound'
          sourcePortRanges: []
          destinationPortRanges: [
            '1514'
            '1515'
          ]
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
          sourceApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_workstation_name_resource.id
            }
          ]
          destinationApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_wazuh_name_resource.id
            }
          ]
        }
      }
      {
        name: 'Allow-Endpoint-To-Wazuh-Dashboard'
        id: networkSecurityGroups_nsg_endpoint_name_Allow_Endpoint_To_Wazuh_Dashboard.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '443'
          access: 'Allow'
          priority: 140
          direction: 'Outbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
          sourceApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_workstation_name_resource.id
            }
          ]
          destinationApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_wazuh_name_resource.id
            }
          ]
        }
      }
      {
        name: 'Deny-Endpoint-To-Internet'
        id: networkSecurityGroups_nsg_endpoint_name_Deny_Endpoint_To_Internet.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          destinationAddressPrefix: 'Internet'
          access: 'Deny'
          priority: 4000
          direction: 'Outbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
          sourceApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_workstation_name_resource.id
            }
          ]
        }
      }
      {
        name: 'Allow-Endpoint-To-Internet'
        id: networkSecurityGroups_nsg_endpoint_name_Allow_Endpoint_To_Internet.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationAddressPrefix: 'Internet'
          access: 'Allow'
          priority: 150
          direction: 'Outbound'
          sourcePortRanges: []
          destinationPortRanges: [
            '80'
            '443'
          ]
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
          sourceApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_workstation_name_resource.id
            }
          ]
        }
      }
    ]
  }
}

resource networkSecurityGroups_nsg_wazuh_name_resource 'Microsoft.Network/networkSecurityGroups@2025-05-01' = {
  name: networkSecurityGroups_nsg_wazuh_name
  location: 'germanywestcentral'
  properties: {
    securityRules: [
      {
        name: 'Allow-Bastion-SSH'
        id: networkSecurityGroups_nsg_wazuh_name_Allow_Bastion_SSH.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: '10.0.0.0/26'
          access: 'Allow'
          priority: 100
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
          destinationApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_wazuh_name_resource.id
            }
          ]
        }
      }
      {
        name: 'Allow-Lab-To-Wazuh-Agent'
        id: networkSecurityGroups_nsg_wazuh_name_Allow_Lab_To_Wazuh_Agent.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          access: 'Allow'
          priority: 110
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: [
            '1514'
            '1515'
          ]
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
          sourceApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_dc_name_resource.id
            }
            {
              id: applicationSecurityGroups_asg_workstation_name_resource.id
            }
          ]
          destinationApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_wazuh_name_resource.id
            }
          ]
        }
      }
      {
        name: 'Allow-Endpoint-To-Wazuh-Dashboard'
        id: networkSecurityGroups_nsg_wazuh_name_Allow_Endpoint_To_Wazuh_Dashboard.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '443'
          access: 'Allow'
          priority: 120
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
          sourceApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_workstation_name_resource.id
            }
          ]
          destinationApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_wazuh_name_resource.id
            }
          ]
        }
      }
      {
        name: 'Deny-VNet-To-Wazuh'
        id: networkSecurityGroups_nsg_wazuh_name_Deny_VNet_To_Wazuh.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Deny'
          priority: 4000
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'Deny-Wazuh-To-Internet'
        id: networkSecurityGroups_nsg_wazuh_name_Deny_Wazuh_To_Internet.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          destinationAddressPrefix: 'Internet'
          access: 'Deny'
          priority: 4000
          direction: 'Outbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
          sourceApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_wazuh_name_resource.id
            }
          ]
        }
      }
      {
        name: 'Allow-Wazuh-To-Internet'
        id: networkSecurityGroups_nsg_wazuh_name_Allow_Wazuh_To_Internet.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationAddressPrefix: 'Internet'
          access: 'Allow'
          priority: 100
          direction: 'Outbound'
          sourcePortRanges: []
          destinationPortRanges: [
            '80'
            '443'
          ]
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
          sourceApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_wazuh_name_resource.id
            }
          ]
        }
      }
      {
        name: 'Allow-Wazuh-To-DC'
        id: networkSecurityGroups_nsg_wazuh_name_Allow_Wazuh_To_DC.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '53'
          access: 'Allow'
          priority: 110
          direction: 'Outbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
          sourceApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_wazuh_name_resource.id
            }
          ]
          destinationApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_workstation_name_resource.id
            }
          ]
        }
      }
      {
        name: 'wazuh-dc-ntp'
        id: networkSecurityGroups_nsg_wazuh_name_wazuh_dc_ntp.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'UDP'
          sourcePortRange: '*'
          destinationPortRange: '123'
          access: 'Allow'
          priority: 120
          direction: 'Outbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
          sourceApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_wazuh_name_resource.id
            }
          ]
          destinationApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_dc_name_resource.id
            }
          ]
        }
      }
      {
        name: 'Allow-Internet-To-Wazuh'
        id: networkSecurityGroups_nsg_wazuh_name_Allow_Internet_To_Wazuh.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '55000'
          sourceAddressPrefix: '*'
          access: 'Allow'
          priority: 130
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
          destinationApplicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_wazuh_name_resource.id
            }
          ]
        }
      }
    ]
  }
}

resource networkSecurityGroups_nsg_dc_name_Allow_DC_To_Wazuh_Agent 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  name: '${networkSecurityGroups_nsg_dc_name}/Allow-DC-To-Wazuh-Agent'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    access: 'Allow'
    priority: 100
    direction: 'Outbound'
    sourcePortRanges: []
    destinationPortRanges: [
      '1514'
      '1515'
    ]
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
    sourceApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_dc_name_resource.id
      }
    ]
    destinationApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_wazuh_name_resource.id
      }
    ]
  }
  dependsOn: [
    networkSecurityGroups_nsg_dc_name_resource
  ]
}

resource networkSecurityGroups_nsg_dc_name_Allow_Endpoint_To_DC_RPC_Dynamic 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  name: '${networkSecurityGroups_nsg_dc_name}/Allow-Endpoint-To-DC-RPC-Dynamic'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '1024-65535'
    access: 'Allow'
    priority: 130
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
    sourceApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_workstation_name_resource.id
      }
    ]
    destinationApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_dc_name_resource.id
      }
    ]
  }
  dependsOn: [
    networkSecurityGroups_nsg_dc_name_resource
  ]
}

resource networkSecurityGroups_nsg_endpoint_name_Allow_Endpoint_To_DC_RPC_Dynamic 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  name: '${networkSecurityGroups_nsg_endpoint_name}/Allow-Endpoint-To-DC-RPC-Dynamic'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '1024-65535'
    access: 'Allow'
    priority: 120
    direction: 'Outbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
    sourceApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_dc_name_resource.id
      }
    ]
    destinationApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_workstation_name_resource.id
      }
    ]
  }
  dependsOn: [
    networkSecurityGroups_nsg_endpoint_name_resource
  ]
}

resource networkSecurityGroups_nsg_dc_name_Allow_Endpoint_To_DC_TCP 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  name: '${networkSecurityGroups_nsg_dc_name}/Allow-Endpoint-To-DC-TCP'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    access: 'Allow'
    priority: 110
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: [
      '53'
      '88'
      '135'
      '389'
      '445'
    ]
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
    sourceApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_workstation_name_resource.id
      }
    ]
    destinationApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_dc_name_resource.id
      }
    ]
  }
  dependsOn: [
    networkSecurityGroups_nsg_dc_name_resource
  ]
}

resource networkSecurityGroups_nsg_endpoint_name_Allow_Endpoint_To_DC_TCP 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  name: '${networkSecurityGroups_nsg_endpoint_name}/Allow-Endpoint-To-DC-TCP'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    access: 'Allow'
    priority: 100
    direction: 'Outbound'
    sourcePortRanges: []
    destinationPortRanges: [
      '53'
      '88'
      '135'
      '389'
      '445'
    ]
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
    sourceApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_dc_name_resource.id
      }
    ]
    destinationApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_workstation_name_resource.id
      }
    ]
  }
  dependsOn: [
    networkSecurityGroups_nsg_endpoint_name_resource
  ]
}

resource networkSecurityGroups_nsg_dc_name_Allow_Endpoint_To_DC_UDP 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  name: '${networkSecurityGroups_nsg_dc_name}/Allow-Endpoint-To-DC-UDP'
  properties: {
    protocol: 'UDP'
    sourcePortRange: '*'
    access: 'Allow'
    priority: 120
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: [
      '53'
      '389'
      '123'
    ]
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
    sourceApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_workstation_name_resource.id
      }
    ]
    destinationApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_dc_name_resource.id
      }
    ]
  }
  dependsOn: [
    networkSecurityGroups_nsg_dc_name_resource
  ]
}

resource networkSecurityGroups_nsg_endpoint_name_Allow_Endpoint_To_DC_UDP 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  name: '${networkSecurityGroups_nsg_endpoint_name}/Allow-Endpoint-To-DC-UDP'
  properties: {
    protocol: 'UDP'
    sourcePortRange: '*'
    access: 'Allow'
    priority: 110
    direction: 'Outbound'
    sourcePortRanges: []
    destinationPortRanges: [
      '53'
      '389'
      '123'
    ]
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
    sourceApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_dc_name_resource.id
      }
    ]
    destinationApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_workstation_name_resource.id
      }
    ]
  }
  dependsOn: [
    networkSecurityGroups_nsg_endpoint_name_resource
  ]
}

resource networkSecurityGroups_nsg_endpoint_name_Allow_Endpoint_To_Wazuh_Agent 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  name: '${networkSecurityGroups_nsg_endpoint_name}/Allow-Endpoint-To-Wazuh-Agent'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    access: 'Allow'
    priority: 130
    direction: 'Outbound'
    sourcePortRanges: []
    destinationPortRanges: [
      '1514'
      '1515'
    ]
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
    sourceApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_workstation_name_resource.id
      }
    ]
    destinationApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_wazuh_name_resource.id
      }
    ]
  }
  dependsOn: [
    networkSecurityGroups_nsg_endpoint_name_resource
  ]
}

resource networkSecurityGroups_nsg_endpoint_name_Allow_Endpoint_To_Wazuh_Dashboard 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  name: '${networkSecurityGroups_nsg_endpoint_name}/Allow-Endpoint-To-Wazuh-Dashboard'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '443'
    access: 'Allow'
    priority: 140
    direction: 'Outbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
    sourceApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_workstation_name_resource.id
      }
    ]
    destinationApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_wazuh_name_resource.id
      }
    ]
  }
  dependsOn: [
    networkSecurityGroups_nsg_endpoint_name_resource
  ]
}

resource networkSecurityGroups_nsg_wazuh_name_Allow_Endpoint_To_Wazuh_Dashboard 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  name: '${networkSecurityGroups_nsg_wazuh_name}/Allow-Endpoint-To-Wazuh-Dashboard'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '443'
    access: 'Allow'
    priority: 120
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
    sourceApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_workstation_name_resource.id
      }
    ]
    destinationApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_wazuh_name_resource.id
      }
    ]
  }
  dependsOn: [
    networkSecurityGroups_nsg_wazuh_name_resource
  ]
}

resource networkSecurityGroups_nsg_wazuh_name_Allow_Wazuh_To_DC 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  name: '${networkSecurityGroups_nsg_wazuh_name}/Allow-Wazuh-To-DC'
  properties: {
    protocol: '*'
    sourcePortRange: '*'
    destinationPortRange: '53'
    access: 'Allow'
    priority: 110
    direction: 'Outbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
    sourceApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_wazuh_name_resource.id
      }
    ]
    destinationApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_workstation_name_resource.id
      }
    ]
  }
  dependsOn: [
    networkSecurityGroups_nsg_wazuh_name_resource
  ]
}

resource networkSecurityGroups_nsg_dc_name_Allow_Wazuh_To_DC_DNS 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  name: '${networkSecurityGroups_nsg_dc_name}/Allow-Wazuh-To-DC-DNS'
  properties: {
    protocol: '*'
    sourcePortRange: '*'
    destinationPortRange: '53'
    access: 'Allow'
    priority: 140
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
    sourceApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_wazuh_name_resource.id
      }
    ]
    destinationApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_dc_name_resource.id
      }
    ]
  }
  dependsOn: [
    networkSecurityGroups_nsg_dc_name_resource
  ]
}

resource networkSecurityGroups_nsg_dc_name_wazuh_dc_ntp 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  name: '${networkSecurityGroups_nsg_dc_name}/wazuh-dc-ntp'
  properties: {
    protocol: 'UDP'
    sourcePortRange: '*'
    destinationPortRange: '123'
    access: 'Allow'
    priority: 150
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
    sourceApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_wazuh_name_resource.id
      }
    ]
    destinationApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_dc_name_resource.id
      }
    ]
  }
  dependsOn: [
    networkSecurityGroups_nsg_dc_name_resource
  ]
}

resource networkSecurityGroups_nsg_wazuh_name_wazuh_dc_ntp 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  name: '${networkSecurityGroups_nsg_wazuh_name}/wazuh-dc-ntp'
  properties: {
    protocol: 'UDP'
    sourcePortRange: '*'
    destinationPortRange: '123'
    access: 'Allow'
    priority: 120
    direction: 'Outbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
    sourceApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_wazuh_name_resource.id
      }
    ]
    destinationApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_dc_name_resource.id
      }
    ]
  }
  dependsOn: [
    networkSecurityGroups_nsg_wazuh_name_resource
  ]
}

resource virtualNetworks_lab_network_name_snet_endpoint 'Microsoft.Network/virtualNetworks/subnets@2025-05-01' = {
  name: '${virtualNetworks_lab_network_name}/snet-endpoint'
  properties: {
    addressPrefixes: [
      '10.0.3.0/24'
    ]
    networkSecurityGroup: {
      id: networkSecurityGroups_nsg_endpoint_name_resource.id
    }
    natGateway: {
      id: natGateways_soar_lab_nat_name_resource.id
    }
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
    defaultOutboundAccess: false
  }
  dependsOn: [
    virtualNetworks_lab_network_name_resource
  ]
}

resource virtualNetworks_lab_network_name_snet_wazuh 'Microsoft.Network/virtualNetworks/subnets@2025-05-01' = {
  name: '${virtualNetworks_lab_network_name}/snet-wazuh'
  properties: {
    addressPrefixes: [
      '10.0.2.0/24'
    ]
    networkSecurityGroup: {
      id: networkSecurityGroups_nsg_wazuh_name_resource.id
    }
    natGateway: {
      id: natGateways_soar_lab_nat_name_resource.id
    }
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
    defaultOutboundAccess: false
  }
  dependsOn: [
    virtualNetworks_lab_network_name_resource
  ]
}

resource networkInterfaces_wazuh01240_z1_name_resource 'Microsoft.Network/networkInterfaces@2025-05-01' = {
  name: networkInterfaces_wazuh01240_z1_name
  location: 'germanywestcentral'
  kind: 'Regular'
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        id: '${networkInterfaces_wazuh01240_z1_name_resource.id}/ipConfigurations/ipconfig1'
        type: 'Microsoft.Network/networkInterfaces/ipConfigurations'
        properties: {
          privateIPAddress: '10.0.2.4'
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: virtualNetworks_lab_network_name_snet_wazuh.id
          }
          primary: true
          privateIPAddressVersion: 'IPv4'
          applicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_wazuh_name_resource.id
            }
          ]
        }
      }
      {
        name: 'pip-wazuh'
        id: '${networkInterfaces_wazuh01240_z1_name_resource.id}/ipConfigurations/pip-wazuh'
        type: 'Microsoft.Network/networkInterfaces/ipConfigurations'
        properties: {
          privateIPAddress: '10.0.2.5'
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPAddresses_pip_wazuh_name_resource.id
          }
          subnet: {
            id: virtualNetworks_lab_network_name_snet_wazuh.id
          }
          primary: false
          privateIPAddressVersion: 'IPv4'
          applicationSecurityGroups: [
            {
              id: applicationSecurityGroups_asg_wazuh_name_resource.id
            }
          ]
        }
      }
    ]
    dnsSettings: {
      dnsServers: []
    }
    enableAcceleratedNetworking: false
    enableIPForwarding: false
    disableTcpStateTracking: false
    networkSecurityGroup: {
      id: networkSecurityGroups_nsg_wazuh_name_resource.id
    }
    nicType: 'Standard'
    auxiliaryMode: 'None'
    auxiliarySku: 'None'
  }
}

resource networkSecurityGroups_nsg_wazuh_name_Allow_Lab_To_Wazuh_Agent 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  name: '${networkSecurityGroups_nsg_wazuh_name}/Allow-Lab-To-Wazuh-Agent'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    access: 'Allow'
    priority: 110
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: [
      '1514'
      '1515'
    ]
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
    sourceApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_dc_name_resource.id
      }
      {
        id: applicationSecurityGroups_asg_workstation_name_resource.id
      }
    ]
    destinationApplicationSecurityGroups: [
      {
        id: applicationSecurityGroups_asg_wazuh_name_resource.id
      }
    ]
  }
  dependsOn: [
    networkSecurityGroups_nsg_wazuh_name_resource
  ]
}

resource virtualNetworks_lab_network_name_resource 'Microsoft.Network/virtualNetworks@2025-05-01' = {
  name: virtualNetworks_lab_network_name
  location: 'germanywestcentral'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    encryption: {
      enabled: false
      enforcement: 'AllowUnencrypted'
    }
    privateEndpointVNetPolicies: 'Disabled'
    dhcpOptions: {
      dnsServers: [
        '10.0.1.4'
      ]
    }
    subnets: [
      {
        name: 'snet-dc'
        id: virtualNetworks_lab_network_name_snet_dc.id
        properties: {
          addressPrefixes: [
            '10.0.1.0/24'
          ]
          networkSecurityGroup: {
            id: networkSecurityGroups_nsg_dc_name_resource.id
          }
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
          defaultOutboundAccess: false
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'snet-wazuh'
        id: virtualNetworks_lab_network_name_snet_wazuh.id
        properties: {
          addressPrefixes: [
            '10.0.2.0/24'
          ]
          networkSecurityGroup: {
            id: networkSecurityGroups_nsg_wazuh_name_resource.id
          }
          natGateway: {
            id: natGateways_soar_lab_nat_name_resource.id
          }
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
          defaultOutboundAccess: false
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'snet-endpoint'
        id: virtualNetworks_lab_network_name_snet_endpoint.id
        properties: {
          addressPrefixes: [
            '10.0.3.0/24'
          ]
          networkSecurityGroup: {
            id: networkSecurityGroups_nsg_endpoint_name_resource.id
          }
          natGateway: {
            id: natGateways_soar_lab_nat_name_resource.id
          }
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
          defaultOutboundAccess: false
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'AzureBastionSubnet'
        id: virtualNetworks_lab_network_name_AzureBastionSubnet.id
        properties: {
          addressPrefixes: [
            '10.0.0.0/26'
          ]
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
    ]
    virtualNetworkPeerings: []
    enableDdosProtection: false
  }
}
