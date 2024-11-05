require("constants")
local collision_mask_util = require("__core__.lualib.collision-mask-util")

hcraft_entities = {
  ["hovercraft-collision"] = true,
  ["hovercraft"] = true,
  ["missile-hovercraft"] = true,
  ["electric-hovercraft"] = true,
  ["laser-hovercraft"] = true,
}

local prototypes = collision_mask_util.collect_prototypes_with_layer("player")

data:extend{
  {
    type = "collision-layer",
    name = "hovercraft",
  }
}


for _, prototype in pairs(prototypes) do
  if prototype.type ~= "tile" and not hcraft_entities[prototype.name] then
    local collision_mask = collision_mask_util.get_mask(prototype)
    collision_mask.layers["hovercraft"] = true
    prototype.collision_mask = collision_mask
  end
end

for name, _ in pairs(hcraft_entities) do
  local prototype = data.raw.car[name]
  if prototype then
    prototype.collision_mask.layers["player"] = nil
    prototype.collision_mask.layers["hovercraft"] = true
  end
end


local burner_hcrafts = {
  data.raw["car"]["hovercraft"],
  data.raw["car"]["missile-hovercraft"],
}

if mods["IndustrialRevolution"] then
  for _, prototype in pairs(burner_hcrafts) do
    if prototype and prototype.energy_source then
      prototype.energy_source.fuel_categories = {"chemical", "battery"}
      prototype.energy_source.burnt_inventory_size = 1
    end
  end
end

if mods["Krastorio2"] then
  for _, prototype in pairs(burner_hcrafts) do
    if prototype and prototype.energy_source then
      prototype.energy_source.fuel_categories = {"vehicle-fuel"}
      prototype.energy_source.burnt_inventory_size = 1
    end
  end
end
