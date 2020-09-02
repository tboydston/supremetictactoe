local quip = {
    type = "firstPlay",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="If you don't pick a square soon I will."
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