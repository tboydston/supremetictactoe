local quip = {
    type = "supremeWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Anyone surprised at the outcome?"
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
        value="I'm not."
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