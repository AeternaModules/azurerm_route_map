output "route_maps_id" {
  description = "Map of id values across all route_maps, keyed the same as var.route_maps"
  value       = { for k, v in azurerm_route_map.route_maps : k => v.id if v.id != null && length(v.id) > 0 }
}
output "route_maps_name" {
  description = "Map of name values across all route_maps, keyed the same as var.route_maps"
  value       = { for k, v in azurerm_route_map.route_maps : k => v.name if v.name != null && length(v.name) > 0 }
}
output "route_maps_rule" {
  description = "Map of rule values across all route_maps, keyed the same as var.route_maps"
  value       = { for k, v in azurerm_route_map.route_maps : k => v.rule if v.rule != null && length(v.rule) > 0 }
}
output "route_maps_virtual_hub_id" {
  description = "Map of virtual_hub_id values across all route_maps, keyed the same as var.route_maps"
  value       = { for k, v in azurerm_route_map.route_maps : k => v.virtual_hub_id if v.virtual_hub_id != null && length(v.virtual_hub_id) > 0 }
}

