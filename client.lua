RegisterNetEvent('armour:setPlayerArmour', function(armourValue)
  local ped = PlayerPedId()
  SetPedArmour(ped, armourValue)
end)
