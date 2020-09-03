local quip = {
    type = "supremeGameWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Your parents must be so disappointed in you."
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
        value="Another match?"
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