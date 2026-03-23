param virtualMachines_dc01_name string = 'dc01'
param virtualMachines_ws01_name string = 'ws01'
param sshPublicKeys_wazuh_key_name string = 'wazuh_key'
param virtualMachines_wazuh01_name string = 'wazuh01'
param virtualNetworks_lab_network_name string = 'lab_network'
param bastionHosts_bastion_soarlab_name string = 'bastion-soarlab'
param networkInterfaces_dc01159_z1_name string = 'dc01159_z1'
param networkInterfaces_ws01785_z1_name string = 'ws01785_z1'
param networkInterfaces_wazuh01219_z1_name string = 'wazuh01219_z1'
param applicationSecurityGroups_asg_dc_name string = 'asg-dc'
param applicationSecurityGroups_asg_wazuh_name string = 'asg-wazuh'
param networkSecurityGroups_nsg_lab_servers_name string = 'nsg-lab-servers'
param publicIPAddresses_pip_bastion_soarlab_name string = 'pip-bastion-soarlab'
param networkSecurityGroups_nsg_lab_endpoints_name string = 'nsg-lab-endpoints'
param applicationSecurityGroups_asg_workstation_name string = 'asg-workstation'

resource sshPublicKeys_wazuh_key_name_resource 'Microsoft.Compute/sshPublicKeys@2025-04-01' = {
  name: sshPublicKeys_wazuh_key_name
  location: 'germanywestcentral'
  properties: {
    publicKey: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDO3btcf3LEtX84ub/VVwRdtOgsMaU4yQ0V0LdCHPEhGhn/lXa8Rj1iHGeA8MWJtUKtNYPQxb3bH5WtfoiOmmCn2qZVMXiCYGvaV1NOkk/9C1gLP82Pb+jZEKwlOI0w/ozqBhz4bWt/7MsrgMVHGk7jITH6r0Eu6Ip1VhX+EX7DtQD52BWjycQFo5higc0G71LV1aU/UqAVjdQrkVIiz9Us+HZLsfphAfrxOdwNdBUHN0ca+Vd329yxH7FI9//4MKZnwRVGgC/J3mOPc+sNix7N8l7cF+N9oQmwi313/oZsW0yo9nkKFhz0Yzn+VPmThM45uhR5nY/zicBXhXDivDmpY55AHS/aDJOaRIQ6+Xy5ec88zvj64R/aXMXaogixvlMPZHw6FH+XZK9wASV8a8pKx1t9XlzALSzlY3F+2VPvanfRHZOzcaAOCS+VMjdG3uA0PdKsWunqLnQJHOl5KF2wI+2gk9dOnZSk8v+kySqTVXB7jsxteX/2hoY1IDWa07U= generated-by-azure'
  }
}

resource applicationSecurityGroups_asg_dc_name_resource 'Microsoft.Network/applicationSecurityGroups@2024-07-01' = {
  name: applicationSecurityGroups_asg_dc_name
  location: 'germanywestcentral'
  properties: {}
}

resource applicationSecurityGroups_asg_wazuh_name_resource 'Microsoft.Network/applicationSecurityGroups@2024-07-01' = {
  name: applicationSecurityGroups_asg_wazuh_name
  location: 'germanywestcentral'
  properties: {}
}

resource applicationSecurityGroups_asg_workstation_name_resource 'Microsoft.Network/applicationSecurityGroups@2024-07-01' = {
  name: applicationSecurityGroups_asg_workstation_name
  location: 'germanywestcentral'
  properties: {}
}

resource publicIPAddresses_pip_bastion_soarlab_name_resource 'Microsoft.Network/publicIPAddresses@2024-07-01' = {
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
          id: resourceId(
            'Microsoft.Compute/disks',
            '${virtualMachines_dc01_name}_OsDisk_1_3f4418f092054c0ab62e275d73f1a35a'
          )
        }
        deleteOption: 'Delete'
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
        offer: 'ubuntu-22_04-lts'
        sku: 'server'
        version: 'latest'
      }
      osDisk: {
        osType: 'Linux'
        name: '${virtualMachines_wazuh01_name}_OsDisk_1_ef58b015ba87484f80741dc575883ca0'
        createOption: 'FromImage'
        caching: 'ReadWrite'
        managedDisk: {
          id: resourceId(
            'Microsoft.Compute/disks',
            '${virtualMachines_wazuh01_name}_OsDisk_1_ef58b015ba87484f80741dc575883ca0'
          )
        }
        deleteOption: 'Delete'
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
              keyData: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDO3btcf3LEtX84ub/VVwRdtOgsMaU4yQ0V0LdCHPEhGhn/lXa8Rj1iHGeA8MWJtUKtNYPQxb3bH5WtfoiOmmCn2qZVMXiCYGvaV1NOkk/9C1gLP82Pb+jZEKwlOI0w/ozqBhz4bWt/7MsrgMVHGk7jITH6r0Eu6Ip1VhX+EX7DtQD52BWjycQFo5higc0G71LV1aU/UqAVjdQrkVIiz9Us+HZLsfphAfrxOdwNdBUHN0ca+Vd329yxH7FI9//4MKZnwRVGgC/J3mOPc+sNix7N8l7cF+N9oQmwi313/oZsW0yo9nkKFhz0Yzn+VPmThM45uhR5nY/zicBXhXDivDmpY55AHS/aDJOaRIQ6+Xy5ec88zvj64R/aXMXaogixvlMPZHw6FH+XZK9wASV8a8pKx1t9XlzALSzlY3F+2VPvanfRHZOzcaAOCS+VMjdG3uA0PdKsWunqLnQJHOl5KF2wI+2gk9dOnZSk8v+kySqTVXB7jsxteX/2hoY1IDWa07U= generated-by-azure'
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
          id: networkInterfaces_wazuh01219_z1_name_resource.id
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
          id: resourceId(
            'Microsoft.Compute/disks',
            '${virtualMachines_ws01_name}_OsDisk_1_b9f50839368b471584ef76d540538b3d'
          )
        }
        deleteOption: 'Delete'
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

resource networkSecurityGroups_nsg_lab_servers_name_Deny_Servers_To_Internet 'Microsoft.Network/networkSecurityGroups/securityRules@2024-07-01' = {
  name: '${networkSecurityGroups_nsg_lab_servers_name}/Deny-Servers-To-Internet'
  properties: {
    protocol: '*'
    sourcePortRange: '*'
    destinationPortRange: '*'
    sourceAddressPrefix: 'VirtualNetwork'
    destinationAddressPrefix: 'Internet'
    access: 'Deny'
    priority: 4010
    direction: 'Outbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    networkSecurityGroups_nsg_lab_servers_name_resource
  ]
}

resource virtualNetworks_lab_network_name_AzureBastionSubnet 'Microsoft.Network/virtualNetworks/subnets@2024-07-01' = {
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

resource bastionHosts_bastion_soarlab_name_resource 'Microsoft.Network/bastionHosts@2024-07-01' = {
  name: bastionHosts_bastion_soarlab_name
  location: 'germanywestcentral'
  sku: {
    name: 'Basic'
  }
  properties: {
    dnsName: 'bst-69d400ea-00b8-4cde-9246-e9f9fb29d2c4.bastion.azure.com'
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

resource networkSecurityGroups_nsg_lab_servers_name_Allow_Bastion_To_DC_RDP 'Microsoft.Network/networkSecurityGroups/securityRules@2024-07-01' = {
  name: '${networkSecurityGroups_nsg_lab_servers_name}/Allow-Bastion-To-DC-RDP'
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
    networkSecurityGroups_nsg_lab_servers_name_resource
  ]
}

resource networkSecurityGroups_nsg_lab_servers_name_Allow_Bastion_To_Wazuh_SSH 'Microsoft.Network/networkSecurityGroups/securityRules@2024-07-01' = {
  name: '${networkSecurityGroups_nsg_lab_servers_name}/Allow-Bastion-To-Wazuh-SSH'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '22'
    sourceAddressPrefix: '10.0.0.0/26'
    access: 'Allow'
    priority: 110
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
    networkSecurityGroups_nsg_lab_servers_name_resource
  ]
}

resource networkSecurityGroups_nsg_lab_endpoints_name_Allow_Bastion_To_WS_RDP 'Microsoft.Network/networkSecurityGroups/securityRules@2024-07-01' = {
  name: '${networkSecurityGroups_nsg_lab_endpoints_name}/Allow-Bastion-To-WS-RDP'
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
    networkSecurityGroups_nsg_lab_endpoints_name_resource
  ]
}

resource networkSecurityGroups_nsg_lab_servers_name_Allow_Wazuh_To_Internet_HTTPS_Temporary 'Microsoft.Network/networkSecurityGroups/securityRules@2024-07-01' = {
  name: '${networkSecurityGroups_nsg_lab_servers_name}/Allow-Wazuh-To-Internet-HTTPS-Temporary'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '443'
    destinationAddressPrefix: 'Internet'
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
  }
  dependsOn: [
    networkSecurityGroups_nsg_lab_servers_name_resource
  ]
}

resource networkSecurityGroups_nsg_lab_servers_name_Allow_Wazuh_To_Internet_HTTP_Temporary 'Microsoft.Network/networkSecurityGroups/securityRules@2024-07-01' = {
  name: '${networkSecurityGroups_nsg_lab_servers_name}/Allow-Wazuh-To-Internet-HTTP-Temporary'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '80'
    destinationAddressPrefix: 'Internet'
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
  }
  dependsOn: [
    networkSecurityGroups_nsg_lab_servers_name_resource
  ]
}

resource networkSecurityGroups_nsg_lab_endpoints_name_Allow_WS_To_Internet_HTTPS_Temporary 'Microsoft.Network/networkSecurityGroups/securityRules@2024-07-01' = {
  name: '${networkSecurityGroups_nsg_lab_endpoints_name}/Allow-WS-To-Internet-HTTPS-Temporary'
  properties: {
    protocol: '*'
    sourcePortRange: '*'
    destinationPortRange: '443'
    destinationAddressPrefix: 'Internet'
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
  }
  dependsOn: [
    networkSecurityGroups_nsg_lab_endpoints_name_resource
  ]
}

resource networkSecurityGroups_nsg_lab_servers_name_Deny_VNet_To_DC 'Microsoft.Network/networkSecurityGroups/securityRules@2024-07-01' = {
  name: '${networkSecurityGroups_nsg_lab_servers_name}/Deny-VNet-To-DC'
  properties: {
    protocol: '*'
    sourcePortRange: '*'
    destinationPortRange: '*'
    sourceAddressPrefix: 'VirtualNetwork'
    access: 'Deny'
    priority: 4000
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
    networkSecurityGroups_nsg_lab_servers_name_resource
  ]
}

resource networkSecurityGroups_nsg_lab_servers_name_Deny_VNet_To_Wazuh 'Microsoft.Network/networkSecurityGroups/securityRules@2024-07-01' = {
  name: '${networkSecurityGroups_nsg_lab_servers_name}/Deny-VNet-To-Wazuh'
  properties: {
    protocol: '*'
    sourcePortRange: '*'
    destinationPortRange: '*'
    sourceAddressPrefix: 'VirtualNetwork'
    access: 'Deny'
    priority: 4010
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
    networkSecurityGroups_nsg_lab_servers_name_resource
  ]
}

resource networkSecurityGroups_nsg_lab_endpoints_name_Deny_VNet_To_WS 'Microsoft.Network/networkSecurityGroups/securityRules@2024-07-01' = {
  name: '${networkSecurityGroups_nsg_lab_endpoints_name}/Deny-VNet-To-WS'
  properties: {
    protocol: '*'
    sourcePortRange: '*'
    destinationPortRange: '*'
    sourceAddressPrefix: 'VirtualNetwork'
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
    networkSecurityGroups_nsg_lab_endpoints_name_resource
  ]
}

resource networkSecurityGroups_nsg_lab_endpoints_name_Deny_WS_To_Internet 'Microsoft.Network/networkSecurityGroups/securityRules@2024-07-01' = {
  name: '${networkSecurityGroups_nsg_lab_endpoints_name}/Deny-WS-To-Internet'
  properties: {
    protocol: '*'
    sourcePortRange: '*'
    destinationPortRange: '*'
    destinationAddressPrefix: 'Internet'
    access: 'Deny'
    priority: 4010
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
    networkSecurityGroups_nsg_lab_endpoints_name_resource
  ]
}

resource virtualNetworks_lab_network_name_resource 'Microsoft.Network/virtualNetworks@2024-07-01' = {
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
    subnets: [
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
      {
        name: 'snet-servers'
        id: virtualNetworks_lab_network_name_snet_servers.id
        properties: {
          addressPrefixes: [
            '10.0.1.0/24'
          ]
          networkSecurityGroup: {
            id: networkSecurityGroups_nsg_lab_servers_name_resource.id
          }
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
          defaultOutboundAccess: false
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'snet-endpoints'
        id: virtualNetworks_lab_network_name_snet_endpoints.id
        properties: {
          addressPrefixes: [
            '10.0.2.0/24'
          ]
          networkSecurityGroup: {
            id: networkSecurityGroups_nsg_lab_endpoints_name_resource.id
          }
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
          defaultOutboundAccess: false
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
    ]
    virtualNetworkPeerings: []
    enableDdosProtection: false
  }
}

resource virtualNetworks_lab_network_name_snet_endpoints 'Microsoft.Network/virtualNetworks/subnets@2024-07-01' = {
  name: '${virtualNetworks_lab_network_name}/snet-endpoints'
  properties: {
    addressPrefixes: [
      '10.0.2.0/24'
    ]
    networkSecurityGroup: {
      id: networkSecurityGroups_nsg_lab_endpoints_name_resource.id
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

resource virtualNetworks_lab_network_name_snet_servers 'Microsoft.Network/virtualNetworks/subnets@2024-07-01' = {
  name: '${virtualNetworks_lab_network_name}/snet-servers'
  properties: {
    addressPrefixes: [
      '10.0.1.0/24'
    ]
    networkSecurityGroup: {
      id: networkSecurityGroups_nsg_lab_servers_name_resource.id
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

resource networkInterfaces_dc01159_z1_name_resource 'Microsoft.Network/networkInterfaces@2024-07-01' = {
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
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: virtualNetworks_lab_network_name_snet_servers.id
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
      id: networkSecurityGroups_nsg_lab_servers_name_resource.id
    }
    nicType: 'Standard'
    auxiliaryMode: 'None'
    auxiliarySku: 'None'
  }
}

resource networkInterfaces_wazuh01219_z1_name_resource 'Microsoft.Network/networkInterfaces@2024-07-01' = {
  name: networkInterfaces_wazuh01219_z1_name
  location: 'germanywestcentral'
  kind: 'Regular'
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        id: '${networkInterfaces_wazuh01219_z1_name_resource.id}/ipConfigurations/ipconfig1'
        type: 'Microsoft.Network/networkInterfaces/ipConfigurations'
        properties: {
          privateIPAddress: '10.0.1.5'
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: virtualNetworks_lab_network_name_snet_servers.id
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
    ]
    dnsSettings: {
      dnsServers: []
    }
    enableAcceleratedNetworking: false
    enableIPForwarding: false
    disableTcpStateTracking: false
    networkSecurityGroup: {
      id: networkSecurityGroups_nsg_lab_servers_name_resource.id
    }
    nicType: 'Standard'
    auxiliaryMode: 'None'
    auxiliarySku: 'None'
  }
}

resource networkInterfaces_ws01785_z1_name_resource 'Microsoft.Network/networkInterfaces@2024-07-01' = {
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
          privateIPAddress: '10.0.2.4'
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: virtualNetworks_lab_network_name_snet_endpoints.id
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
      id: networkSecurityGroups_nsg_lab_endpoints_name_resource.id
    }
    nicType: 'Standard'
    auxiliaryMode: 'None'
    auxiliarySku: 'None'
  }
}

resource networkSecurityGroups_nsg_lab_endpoints_name_resource 'Microsoft.Network/networkSecurityGroups@2024-07-01' = {
  name: networkSecurityGroups_nsg_lab_endpoints_name
  location: 'germanywestcentral'
  properties: {
    securityRules: [
      {
        name: 'Allow-Bastion-To-WS-RDP'
        id: networkSecurityGroups_nsg_lab_endpoints_name_Allow_Bastion_To_WS_RDP.id
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
        name: 'Deny-VNet-To-WS'
        id: networkSecurityGroups_nsg_lab_endpoints_name_Deny_VNet_To_WS.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: 'VirtualNetwork'
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
        name: 'Allow-WS-To-DC-TCP-Core'
        id: networkSecurityGroups_nsg_lab_endpoints_name_Allow_WS_To_DC_TCP_Core.id
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
        name: 'Allow-WS-To-DC-UDP-Core'
        id: networkSecurityGroups_nsg_lab_endpoints_name_Allow_WS_To_DC_UDP_Core.id
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
        name: 'Allow-WS-To-DC-RPC-Dynamic'
        id: networkSecurityGroups_nsg_lab_endpoints_name_Allow_WS_To_DC_RPC_Dynamic.id
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
        name: 'Allow-WS-To-Wazuh'
        id: networkSecurityGroups_nsg_lab_endpoints_name_Allow_WS_To_Wazuh.id
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
            '55000'
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
        name: 'Allow-WS-To-Internet-HTTPS-Temporary'
        id: networkSecurityGroups_nsg_lab_endpoints_name_Allow_WS_To_Internet_HTTPS_Temporary.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '443'
          destinationAddressPrefix: 'Internet'
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
        }
      }
      {
        name: 'Deny-WS-To-Internet'
        id: networkSecurityGroups_nsg_lab_endpoints_name_Deny_WS_To_Internet.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          destinationAddressPrefix: 'Internet'
          access: 'Deny'
          priority: 4010
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
    ]
  }
}

resource networkSecurityGroups_nsg_lab_servers_name_resource 'Microsoft.Network/networkSecurityGroups@2024-07-01' = {
  name: networkSecurityGroups_nsg_lab_servers_name
  location: 'germanywestcentral'
  properties: {
    securityRules: [
      {
        name: 'Allow-Bastion-To-DC-RDP'
        id: networkSecurityGroups_nsg_lab_servers_name_Allow_Bastion_To_DC_RDP.id
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
        name: 'Allow-Bastion-To-Wazuh-SSH'
        id: networkSecurityGroups_nsg_lab_servers_name_Allow_Bastion_To_Wazuh_SSH.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: '10.0.0.0/26'
          access: 'Allow'
          priority: 110
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
        name: 'Allow-WS-To-DC-TCP-Core'
        id: networkSecurityGroups_nsg_lab_servers_name_Allow_WS_To_DC_TCP_Core.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          access: 'Allow'
          priority: 120
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
        name: 'Allow-WS-To-DC-UDP-Core'
        id: networkSecurityGroups_nsg_lab_servers_name_Allow_WS_To_DC_UDP_Core.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'UDP'
          sourcePortRange: '*'
          access: 'Allow'
          priority: 130
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: [
            '53'
            '389'
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
        name: 'Allow-WS-To-DC-RPC-Dynamic'
        id: networkSecurityGroups_nsg_lab_servers_name_Allow_WS_To_DC_RPC_Dynamic.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '1024-65535'
          access: 'Allow'
          priority: 140
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
        name: 'Allow-DC-To-Wazuh-Agent'
        id: networkSecurityGroups_nsg_lab_servers_name_Allow_DC_To_Wazuh_Agent.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: '*'
          sourcePortRange: '*'
          access: 'Allow'
          priority: 150
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: [
            '1514'
            '1515'
            '55000'
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
        name: 'Deny-VNet-To-DC'
        id: networkSecurityGroups_nsg_lab_servers_name_Deny_VNet_To_DC.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: 'VirtualNetwork'
          access: 'Deny'
          priority: 4000
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
        name: 'Deny-VNet-To-Wazuh'
        id: networkSecurityGroups_nsg_lab_servers_name_Deny_VNet_To_Wazuh.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: 'VirtualNetwork'
          access: 'Deny'
          priority: 4010
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
        name: 'Allow-DC-To-Wazuh'
        id: networkSecurityGroups_nsg_lab_servers_name_Allow_DC_To_Wazuh.id
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
            '55000'
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
        name: 'Allow-Wazuh-To-Internet-HTTPS-Temporary'
        id: networkSecurityGroups_nsg_lab_servers_name_Allow_Wazuh_To_Internet_HTTPS_Temporary.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '443'
          destinationAddressPrefix: 'Internet'
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
        }
      }
      {
        name: 'Allow-Wazuh-To-Internet-HTTP-Temporary'
        id: networkSecurityGroups_nsg_lab_servers_name_Allow_Wazuh_To_Internet_HTTP_Temporary.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '80'
          destinationAddressPrefix: 'Internet'
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
        }
      }
      {
        name: 'Deny-Servers-To-Internet'
        id: networkSecurityGroups_nsg_lab_servers_name_Deny_Servers_To_Internet.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: 'Internet'
          access: 'Deny'
          priority: 4010
          direction: 'Outbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
    ]
  }
}

resource networkSecurityGroups_nsg_lab_servers_name_Allow_DC_To_Wazuh 'Microsoft.Network/networkSecurityGroups/securityRules@2024-07-01' = {
  name: '${networkSecurityGroups_nsg_lab_servers_name}/Allow-DC-To-Wazuh'
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
      '55000'
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
    networkSecurityGroups_nsg_lab_servers_name_resource
  ]
}

resource networkSecurityGroups_nsg_lab_servers_name_Allow_DC_To_Wazuh_Agent 'Microsoft.Network/networkSecurityGroups/securityRules@2024-07-01' = {
  name: '${networkSecurityGroups_nsg_lab_servers_name}/Allow-DC-To-Wazuh-Agent'
  properties: {
    protocol: '*'
    sourcePortRange: '*'
    access: 'Allow'
    priority: 150
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: [
      '1514'
      '1515'
      '55000'
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
    networkSecurityGroups_nsg_lab_servers_name_resource
  ]
}

resource networkSecurityGroups_nsg_lab_endpoints_name_Allow_WS_To_DC_RPC_Dynamic 'Microsoft.Network/networkSecurityGroups/securityRules@2024-07-01' = {
  name: '${networkSecurityGroups_nsg_lab_endpoints_name}/Allow-WS-To-DC-RPC-Dynamic'
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
    networkSecurityGroups_nsg_lab_endpoints_name_resource
  ]
}

resource networkSecurityGroups_nsg_lab_servers_name_Allow_WS_To_DC_RPC_Dynamic 'Microsoft.Network/networkSecurityGroups/securityRules@2024-07-01' = {
  name: '${networkSecurityGroups_nsg_lab_servers_name}/Allow-WS-To-DC-RPC-Dynamic'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '1024-65535'
    access: 'Allow'
    priority: 140
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
    networkSecurityGroups_nsg_lab_servers_name_resource
  ]
}

resource networkSecurityGroups_nsg_lab_endpoints_name_Allow_WS_To_DC_TCP_Core 'Microsoft.Network/networkSecurityGroups/securityRules@2024-07-01' = {
  name: '${networkSecurityGroups_nsg_lab_endpoints_name}/Allow-WS-To-DC-TCP-Core'
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
    networkSecurityGroups_nsg_lab_endpoints_name_resource
  ]
}

resource networkSecurityGroups_nsg_lab_servers_name_Allow_WS_To_DC_TCP_Core 'Microsoft.Network/networkSecurityGroups/securityRules@2024-07-01' = {
  name: '${networkSecurityGroups_nsg_lab_servers_name}/Allow-WS-To-DC-TCP-Core'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    access: 'Allow'
    priority: 120
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
    networkSecurityGroups_nsg_lab_servers_name_resource
  ]
}

resource networkSecurityGroups_nsg_lab_endpoints_name_Allow_WS_To_DC_UDP_Core 'Microsoft.Network/networkSecurityGroups/securityRules@2024-07-01' = {
  name: '${networkSecurityGroups_nsg_lab_endpoints_name}/Allow-WS-To-DC-UDP-Core'
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
    networkSecurityGroups_nsg_lab_endpoints_name_resource
  ]
}

resource networkSecurityGroups_nsg_lab_servers_name_Allow_WS_To_DC_UDP_Core 'Microsoft.Network/networkSecurityGroups/securityRules@2024-07-01' = {
  name: '${networkSecurityGroups_nsg_lab_servers_name}/Allow-WS-To-DC-UDP-Core'
  properties: {
    protocol: 'UDP'
    sourcePortRange: '*'
    access: 'Allow'
    priority: 130
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: [
      '53'
      '389'
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
    networkSecurityGroups_nsg_lab_servers_name_resource
  ]
}

resource networkSecurityGroups_nsg_lab_endpoints_name_Allow_WS_To_Wazuh 'Microsoft.Network/networkSecurityGroups/securityRules@2024-07-01' = {
  name: '${networkSecurityGroups_nsg_lab_endpoints_name}/Allow-WS-To-Wazuh'
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
      '55000'
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
    networkSecurityGroups_nsg_lab_endpoints_name_resource
  ]
}
