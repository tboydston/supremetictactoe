local quip = {
    type = "supremeWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Perhaps you should review the rules."
    },
    {
        action="pause",
        value="1"
    },
    {
        action="clearQuip",
    },
    {
        action="say",
        value="You are supposed to get 3 X's in a row."
    },
    {
        action="end"
    }
}

return quip