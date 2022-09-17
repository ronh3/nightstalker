local ignore = {'Captaincy', 'Hacking', 'Art', 'Fashion', 'Cuisine', 'Jewelry', 'WeaponModding', 'ArmorModding', 'ShipModding', 'Furnishing', 'Mixology'}

function sym.gmcpcharskillsgroups()
  if not sym.skills then
    sym.skills = {}
    table.foreach(gmcp.Char.Skills.Groups, function(key, skillset)
      if not table.contains(ignore, skillset.name) then
        sendGMCP(string.format('Char.Skills.Get %s', yajl.to_string({group=skillset.name})))
        sym.skills[skillset.name] = {
          rank = tonumber(skillset.rank:match('(%d+)/%d+')),
          maxrank = tonumber(skillset.rank:match('%d+/(%d+)')),
          list = {}
        }
      end
    end)
  end
end

function sym.gmcpcharskillslist()
  table.foreach(gmcp.Char.Skills.List.list, function(key, skill)
    sendGMCP(string.format('Char.Skills.Get %s', yajl.to_string({
      group = gmcp.Char.Skills.List.group:title(),
      name = skill
    })))
  end)
end

function sym.gmcpcharskillsinfo()
  local group = gmcp.Char.Skills.Info.group:title()
  local skill = gmcp.Char.Skills.Info.skill:title()
  local lessons = gmcp.Char.Skills.Info.info:match('(%d+) Lessons')
  sym.skills[group].list[#sym.skills[group].list + 1] = {skill, tonumber(lessons)}
  if #sym.skills[group].list == sym.skills[group].maxrank then
    table.sort(sym.skills[group].list, function(a,b) return a[2] < b[2] end)
    local sorted_list = sym.skills[group].list
    sym.skills[group].list = {}
    table.foreach(sorted_list, function(key, value)
      sym.skills[group].list[#sym.skills[group].list + 1] = value[1]
    end)
  end
end

function sym.haveskill(skill, skillset)
  local rank = sym.skills[skillset].rank
  local skill = table.index_of(sym.skills[skillset].list, skill)
  return skill <= rank
end

sym.registerevent('fetch groups', 'gmcp.Char.Skills.Groups', 'sym.gmcpcharskillsgroups')
sym.registerevent('fetch skills', 'gmcp.Char.Skills.List', 'sym.gmcpcharskillslist')
sym.registerevent('parse skills', 'gmcp.Char.Skills.Info', 'sym.gmcpcharskillsinfo')