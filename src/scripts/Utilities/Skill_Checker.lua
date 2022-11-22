local ignore = {'Captaincy', 'Hacking', 'Art', 'Fashion', 'Cuisine', 'Jewelry', 'WeaponModding', 'ArmorModding', 'ShipModding', 'Furnishing', 'Mixology'}

function nightstalker.gmcpcharskillsgroups()
  if not nightstalker.skills then
    nightstalker.skills = {}
    table.foreach(gmcp.Char.Skills.Groups, function(key, skillset)
      if not table.contains(ignore, skillset.name) then
        sendGMCP(string.format('Char.Skills.Get %s', yajl.to_string({group=skillset.name})))
        nightstalker.skills[skillset.name] = {
          rank = tonumber(skillset.rank:match('(%d+)/%d+')),
          maxrank = tonumber(skillset.rank:match('%d+/(%d+)')),
          list = {}
        }
      end
    end)
  end
end

function nightstalker.gmcpcharskillslist()
  table.foreach(gmcp.Char.Skills.List.list, function(key, skill)
    sendGMCP(string.format('Char.Skills.Get %s', yajl.to_string({
      group = gmcp.Char.Skills.List.group:title(),
      name = skill
    })))
  end)
end

function nightstalker.gmcpcharskillsinfo()
  local group = gmcp.Char.Skills.Info.group:title()
  local skill = gmcp.Char.Skills.Info.skill:title()
  local lessons = gmcp.Char.Skills.Info.info:match('(%d+) Lessons')
  nightstalker.skills[group].list[#nightstalker.skills[group].list + 1] = {skill, tonumber(lessons)}
  if #nightstalker.skills[group].list == nightstalker.skills[group].maxrank then
    table.sort(nightstalker.skills[group].list, function(a,b) return a[2] < b[2] end)
    local sorted_list = nightstalker.skills[group].list
    nightstalker.skills[group].list = {}
    table.foreach(sorted_list, function(key, value)
      nightstalker.skills[group].list[#nightstalker.skills[group].list + 1] = value[1]
    end)
  end
end

function nightstalker.haveskill(skill, skillset)
  local rank = nightstalker.skills[skillset].rank
  local skill = table.index_of(nightstalker.skills[skillset].list, skill)
  return skill <= rank
end

nightstalker.registerevent('fetch groups', 'gmcp.Char.Skills.Groups', 'nightstalker.gmcpcharskillsgroups')
nightstalker.registerevent('fetch skills', 'gmcp.Char.Skills.List', 'nightstalker.gmcpcharskillslist')
nightstalker.registerevent('parse skills', 'gmcp.Char.Skills.Info', 'nightstalker.gmcpcharskillsinfo')