function table.keys(tbl)
  local k = {}
  for key, value in pairs(tbl) do
    k[#k + 1] = key
  end
  return k
end

function round(num, numDecimalPlaces)
  local mult = 10 ^ (numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end