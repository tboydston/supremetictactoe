local quip = {
    type = "supremeGameWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="You we have reached my inevitable vicory."
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