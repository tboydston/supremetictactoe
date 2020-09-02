local quip = {
    type = "playReset",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="I will tell you a little secret."
    },
    {
        action="pause",
        value="2"
    },
    {
        action="clearQuip",
    },
    {
        action="say",
        value="The game is rigged. I always win."
    },
    {
        action="pause",
        value="2"
    }, 
    {
        action="end"
    }
}

return quip