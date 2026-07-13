variable "route_maps" {
  description = <<EOT
Map of route_maps, attributes below
Required:
    - name
    - virtual_hub_id
Optional:
    - rule (block):
        - action (optional, block):
            - parameter (optional, block):
                - as_path (optional)
                - community (optional)
                - route_prefix (optional)
            - type (required)
        - match_criterion (optional, block):
            - as_path (optional)
            - community (optional)
            - match_condition (required)
            - route_prefix (optional)
        - name (required)
        - next_step_if_matched (optional)
EOT

  type = map(object({
    name           = string
    virtual_hub_id = string
    rule = optional(list(object({
      action = optional(list(object({
        parameter = optional(list(object({
          as_path      = optional(list(string))
          community    = optional(list(string))
          route_prefix = optional(list(string))
        })))
        type = string
      })))
      match_criterion = optional(list(object({
        as_path         = optional(list(string))
        community       = optional(list(string))
        match_condition = string
        route_prefix    = optional(list(string))
      })))
      name                 = string
      next_step_if_matched = optional(string)
    })))
  }))
}

