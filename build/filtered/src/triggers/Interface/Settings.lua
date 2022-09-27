tempTimer(
    3,
    function()
      sendAll(
        'config showbalance on',
        'config combatmessages full',
        'config mxp on',
        'config voting on',
        'config usequeueing on',
        'config mapshow on',
        'map radius 5',
        'config wrapwidth 0'
      )
    end
  )