data:extend({
    {
       type = 'bool-setting',
       name = 'show_wire_conenctions',
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
      minimum_value = 2,
      maximum_value = 64,
      hidden = false,
      order = 'b'
   },
   {
      type = 'double-setting',
      name = 'supply_area',
      setting_type = 'startup',
      default_value = 2,
      minimum_value = 2,
      maximum_value = 64,
      hidden = false,
      order = 'c'
   },
})
