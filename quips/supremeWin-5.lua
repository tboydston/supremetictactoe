local quip = {
    type = "supremeWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Perhaps you chould review the rules."
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
        value="You are supposed to get 3 'X' in a row."
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