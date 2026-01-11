resource "azurerm_route_map" "route_maps" {
  for_each = var.route_maps

  name           = each.value.name
  virtual_hub_id = each.value.virtual_hub_id

  dynamic "rule" {
    for_each = each.value.rule != null ? [each.value.rule] : []
    content {
      dynamic "action" {
        for_each = rule.value.action != null ? [rule.value.action] : []
        content {
          dynamic "parameter" {
            for_each = action.value.parameter != null ? [action.value.parameter] : []
            content {
              as_path      = parameter.value.as_path
              community    = parameter.value.community
              route_prefix = parameter.value.route_prefix
            }
          }
          type = action.value.type
        }
      }
      dynamic "match_criterion" {
        for_each = rule.value.match_criterion != null ? [rule.value.match_criterion] : []
        content {
          as_path         = match_criterion.value.as_path
          community       = match_criterion.value.community
          match_condition = match_criterion.value.match_condition
          route_prefix    = match_criterion.value.route_prefix
        }
      }
      name                 = rule.value.name
      next_step_if_matched = rule.value.next_step_if_matched
    }
  }
}

