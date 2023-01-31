resource "azurerm_role_assignment" "acrdelete" {
  for_each                               = var.role_assignment
  name                                   = lookup(each.value, "name", null)
  scope                                  = var.scope
  role_definition_name                   = "AcrDelete"
  principal_id                           = lookup(each.value, "principal_id", null)
  condition                              = lookup(each.value, "condition", null)
  condition_version                      = lookup(each.value, "condition_version", null)
  delegated_managed_identity_resource_id = lookup(each.value, "delegated_managed_identity_resource_id", null)
  description                            = lookup(each.value, "description", null)
  skip_service_principal_aad_check       = lookup(each.value, "skip_service_principal_aad_check", null)
}

resource "azurerm_role_assignment" "acrpull" {
  for_each                               = var.role_assignment
  name                                   = lookup(each.value, "name", null)
  scope                                  = var.scope
  role_definition_name                   = "AcrPull"
  principal_id                           = lookup(each.value, "principal_id", null)
  condition                              = lookup(each.value, "condition", null)
  condition_version                      = lookup(each.value, "condition_version", null)
  delegated_managed_identity_resource_id = lookup(each.value, "delegated_managed_identity_resource_id", null)
  description                            = lookup(each.value, "description", null)
  skip_service_principal_aad_check       = lookup(each.value, "skip_service_principal_aad_check", null)
}

resource "azurerm_role_assignment" "acrpush" {
  for_each                               = var.role_assignment
  name                                   = lookup(each.value, "name", null)
  scope                                  = var.scope
  role_definition_name                   = "AcrPush"
  principal_id                           = lookup(each.value, "principal_id", null)
  condition                              = lookup(each.value, "condition", null)
  condition_version                      = lookup(each.value, "condition_version", null)
  delegated_managed_identity_resource_id = lookup(each.value, "delegated_managed_identity_resource_id", null)
  description                            = lookup(each.value, "description", null)
  skip_service_principal_aad_check       = lookup(each.value, "skip_service_principal_aad_check", null)
}

resource "azurerm_role_assignment" "reader_acr_rg" {  
  for_each = {
    for k, v in var.role_assignment : k => v
    if var.reader_permission_on_rg
  }
  name                                   = lookup(each.value, "name", null)
  scope                                  = "/${local.rg}"
  role_definition_name                   = "Reader"
  principal_id                           = lookup(each.value, "principal_id", null)
  condition                              = lookup(each.value, "condition", null)
  condition_version                      = lookup(each.value, "condition_version", null)
  delegated_managed_identity_resource_id = lookup(each.value, "delegated_managed_identity_resource_id", null)
  description                            = lookup(each.value, "description", null)
  skip_service_principal_aad_check       = lookup(each.value, "skip_service_principal_aad_check", null)
}

resource "azurerm_role_assignment" "reader_acr" {  
  for_each = {
    for k, v in var.role_assignment : k => v
    if var.reader_permission_on_acr
  }
  name                                   = lookup(each.value, "name", null)
  scope                                  = var.scope
  role_definition_name                   = "Reader"
  principal_id                           = lookup(each.value, "principal_id", null)
  condition                              = lookup(each.value, "condition", null)
  condition_version                      = lookup(each.value, "condition_version", null)
  delegated_managed_identity_resource_id = lookup(each.value, "delegated_managed_identity_resource_id", null)
  description                            = lookup(each.value, "description", null)
  skip_service_principal_aad_check       = lookup(each.value, "skip_service_principal_aad_check", null)
}