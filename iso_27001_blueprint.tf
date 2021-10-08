# Add a predefined ISO 27001 blueprint to Azure subscription
# It was only possible to do it via a ARM template
resource "azurerm_subscription_template_deployment" "terraform-iso" {
  name                = "terraform-iso-1"
  location         = "West Europe"

  template_content = <<TEMPLATE
{
    "$schema": "https://schema.management.azure.com/schemas/2018-05-01/subscriptionDeploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {},
    "resources": [
        {
            "type": "Microsoft.Authorization/policyAssignments",
            "name": "Iso27001",
            "apiVersion": "2021-06-01",
            "properties": {
                "scope": "[subscription().id]",
                "policyDefinitionId": "/providers/Microsoft.Authorization/policySetDefinitions/89c6cddc-1c73-4ac1-b19c-54d1a15a42f2",
                "parameters": {}
            }, 
            "location": "westeurope",
            "identity": {
                "type": "SystemAssigned"
              }

        }
    ]
}
  TEMPLATE
  
}
