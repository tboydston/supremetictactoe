local quip = {
    type = "supremeWonWager",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Oh don't cry!"
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
        value="You never really had a chance."
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