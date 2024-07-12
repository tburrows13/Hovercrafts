data:extend({
  {
    type = "item-with-entity-data",
    name = "hovercraft",
    icon = HCGRAPHICS .. "icons/hovercraft_icon.png",
    icon_size = 64,
    subgroup = subgroup_hovercrafts,
    order = "b[personal-transport]-c[hovercraft]",
    place_result = "hovercraft",
    stack_size = 1
  },
  {
    type = "recipe",
    name = "hovercraft",
    enabled = false,
    energy_required = 4,
    ingredients = {
      {"iron-gear-wheel", 20},
      {"steel-plate", 10},
      {"engine-unit", 10},
      {"speed-module", 2},
      {"effectivity-module", 2}
    },
    results = {{type="item", name="hovercraft", amount=1}}
  },
})

--------------------------------------------------------------------------------------------------------------------
if missile_hovercraft_activated then
  data:extend({
    {
      type = "item-with-entity-data",
      name = "missile-hovercraft",
      icon = HCGRAPHICS .. "icons/hovercraft_mcraft_icon.png",
      icon_size = 64,
      subgroup = subgroup_hovercrafts,
      order = "b[personal-transport]-d[missile-hovercraft]",
      place_result = "missile-hovercraft",
      stack_size = 1
    },
    {
      type = "recipe",
      name = "missile-hovercraft",
      enabled = false,
      energy_required = 4,
      ingredients = {
        {"hovercraft", 1},
        {"advanced-circuit", 40},
        {"gun-turret", 2},
        {"rocket-launcher", 16}
      },
      results = {{type="item", name="missile-hovercraft", amount=1}}
    },
  })

  if mods["vtk-armor-plating"] then
    table.insert(data.raw.recipe["missile-hovercraft"].ingredients, {"vtk-armor-plating", 12})
  end
end

--------------------------------------------------------------------------------------------------------------------
if electric_hovercraft_activated then
  data:extend({
    {
      type = "item-with-entity-data",
      name = "electric-hovercraft",
      icon = HCGRAPHICS .. "icons/hovercraft_ecraft_icon.png",
      icon_size = 64,
      subgroup = subgroup_hovercrafts,
      order = "b[personal-transport]-e[electric-hovercraft]",
      place_result = "electric-hovercraft",
      stack_size = 1
    },
    {
      type = "recipe",
      name = "electric-hovercraft",
      enabled = false,
      energy_required = 4,
      ingredients = {
        {"low-density-structure", 25},
        {"electric-engine-unit", 40},
        {"processing-unit", 20},
        {"hovercraft", 1},
      },
      results = {{type="item", name="electric-hovercraft", amount=1}}
    },
  })
end

--------------------------------------------------------------------------------------------------------------------
if laser_hovercraft_activated then
  data:extend({
    {
      type = "item-with-entity-data",
      name = "laser-hovercraft",
      icon = HCGRAPHICS .. "icons/hovercraft_lcraft_icon.png",
      icon_size = 64,
      subgroup = subgroup_hovercrafts,
      order = "d[personal-transport]-d",
      place_result = "laser-hovercraft",
      stack_size = 1
    },
    {
      type = "recipe",
      name = "laser-hovercraft",
      enabled = false,
      energy_required = 4,
      ingredients = {
        {"electric-hovercraft", 1},
        {"laser-turret", 2},
        {"heat-pipe", 25},
        {"heat-exchanger", 2},
      },
      results = {{type="item", name="laser-hovercraft", amount=1}}
    },
    {
      type = "item",
      name = "lcraft-charger",
      icon = HCGRAPHICS .. "icons/equipment_lcraft_charger_icon.png",
      icon_size = 64,
      flags = {},
      placed_as_equipment_result = "lcraft-charger",
      subgroup = "equipment",
      order = "e[robotics]-a[personal-roboport-equipment]",
      stack_size = 20
    },
    {
      type = "recipe",
      name = "lcraft-charger",
      enabled = false,
      energy_required = 10,
      ingredients = {
        {"processing-unit", 25},
        {"energy-shield-mk2-equipment", 5},
        {"ehvt-equipment", 2}
      },
      results = {{type="item", name="lcraft-charger", amount=1}}
    },
  })

  if mods["SchallTransportGroup"] then
    data.raw["item"]["lcraft-charger"].subgroup = "vehicle-equipment"
    data.raw["item"]["lcraft-charger"].order = "e2"
  end
end

--------------------------------------------------------------------------------------------------------------------
if electriccraft_equipment_activated then
  data:extend({
    {
      type = "item",
      name = "ehvt-equipment",
      icon = HCGRAPHICS .. "icons/equipment_ehvt_icon.png",
      icon_size = 64,
      subgroup = subgroup_hovercrafts_ehvt,
      order = "d2",
      placed_as_equipment_result = "ehvt-equipment",
      stack_size = 10
    },
    {
      type = "recipe",
      name = "ehvt-equipment",
      enabled = false,
      category = "crafting-with-fluid",
      energy_required = 10,
      ingredients = {
        {"battery-mk2-equipment", 2},
        {"processing-unit", 5},
        {type = "fluid", name = "lubricant", amount = 50},
      },
      results = {{type="item", name="ehvt-equipment", amount=1}}
    },
  })
end
