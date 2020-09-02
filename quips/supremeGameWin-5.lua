local quip = {
    type = "supremeGameWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Well that was a waste of my time."
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
        value="Anyone else out there want to play?"
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