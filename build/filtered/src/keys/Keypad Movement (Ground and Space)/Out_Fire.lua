local target = gmcp.Char.Status.target:match('%w+')
if gmcp.Room.Info.environment == 'bridge' then
    --  'ship weapon fire weap5 ' ..target,
    --  'ship weapon fire weap6 ' ..target,
    --  'ship weapon fire weap7 ' ..target,
    --  'ship weapon fire weap8 ' ..target,
    sendAll('ship target ' .. target, 'ship weapon fire mcannons ' .. target,
            'ship weapon fire cannons ' .. target,
            'ship weapon fire lasers ' .. target,
            'ship weapon fire missiles ' .. target,
            'ship weapon fire interdict ' .. target)
else
    send("out")
end