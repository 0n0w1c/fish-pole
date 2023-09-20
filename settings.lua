data:extend({
    {
       type = 'bool-setting',
       name = 'show_wire_connections',
       setting_type = 'startup',
       default_value = false,
       hidden = false,
       order = 'a'
    },
    {
      type = 'double-setting',
      name = 'wire_reach',
      setting_type = 'startup',
      default_value = 30,
      minimum_value = 0,
      maximum_value = 64,
      hidden = false,
      order = 'b'
   },
   {
      type = 'double-setting',
      name = 'supply_width',
      setting_type = 'startup',
      default_value = 4,
      minimum_value = 0,
      maximum_value = 128,
      hidden = false,
      order = 'c'
   }
})
