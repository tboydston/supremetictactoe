local quip = {
    type = "supremeWonWager",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Oh you almost had me there!"
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
        value="Now about that favor..."
    },
    {
        action="pause",
        value="2"
    }, 
    {
        action="sceneChange",
        value="changeMode"
    }
}

return quip