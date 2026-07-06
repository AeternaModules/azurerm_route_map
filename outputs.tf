output "route_maps" {
  description = "All route_map resources"
  value       = azurerm_route_map.route_maps
}
output "route_maps_name" {
  description = "List of name values across all route_maps"
  value       = [for k, v in azurerm_route_map.route_maps : v.name]
}
output "route_maps_rule" {
  description = "List of rule values across all route_maps"
  value       = [for k, v in azurerm_route_map.route_maps : v.rule]
}
output "route_maps_virtual_hub_id" {
  description = "List of virtual_hub_id values across all route_maps"
  value       = [for k, v in azurerm_route_map.route_maps : v.virtual_hub_id]
}

