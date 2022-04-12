# tfe variables sub-module -- main.tf
resource "tfe_variable" "this" {
  count           = var.add_variable ? 1 : 0
  key             = var.key
  value           = var.value
  description  = try(trimspace(format("%s %s", var.description, var.description_suffix)), null)
  category        = var.category
  sensitive       = var.sensitive
  hcl             = var.hcl
  dynamic "variable_set_id" {
    for_each = var.variable_set ? [1] : []
    content {
      variable_set_id = var.variable_set_id
    }
  }

  dynamic "workspace_id" {
    for_each = var.variable_set ? [] : [1]
    content {
      workspace_id = var.workspace_id
    }
  }
}
