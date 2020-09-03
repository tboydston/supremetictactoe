local quip = {
    type = "supremeGameWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Well, I guess all good things must come to an end."
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
        value="Again?"
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