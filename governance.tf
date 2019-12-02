# Postgres connection throttling policy assignment
resource "azurerm_policy_assignment" "policy-assignment" {
  name                 = "5345bb39-67dc-4960-a1bf-427e16b9a0bd"
  scope                = "/subscriptions/add-subscription-id"
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/5345bb39-67dc-4960-a1bf-427e16b9a0bd"
}
# Postgres geo replication policy assignment
resource "azurerm_policy_assignment" "policy-assignment2" {
  name                 = "48af4db5-9b8b-401c-8e74-076be876a430"
  scope                = "/subscriptions/add-subscription-id"
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/48af4db5-9b8b-401c-8e74-076be876a430"
}
# Postgres log checkpoints should be enabled
resource "azurerm_policy_assignment" "policy-assignment3" {
  name                 = "eb6f77b9-bd53-4e35-a23d-7f65d5f0e43d"
  scope                = "/subscriptions/add-subscription-id"
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/eb6f77b9-bd53-4e35-a23d-7f65d5f0e43d"
}
# Postgres log connections should be enabled
resource "azurerm_policy_assignment" "policy-assignment4" {
  name                 = "eb6f77b9-bd53-4e35-a23d-7f65d5f0e442"
  scope                = "/subscriptions/add-subscription-id"
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/eb6f77b9-bd53-4e35-a23d-7f65d5f0e442"
}
# Postgres log disconnections should be enabled
resource "azurerm_policy_assignment" "policy-assignment5" {
  name                 = "eb6f77b9-bd53-4e35-a23d-7f65d5f0e446"
  scope                = "/subscriptions/add-subscription-id"
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/eb6f77b9-bd53-4e35-a23d-7f65d5f0e446"
}
# Postgres log duration should be enabled
resource "azurerm_policy_assignment" "policy-assignment6" {
  name                 = "eb6f77b9-bd53-4e35-a23d-7f65d5f0e8f3"
  scope                = "/subscriptions/add-subscription-id"
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/eb6f77b9-bd53-4e35-a23d-7f65d5f0e8f3"
}