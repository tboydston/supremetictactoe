local quip = {
    type = "supremeGameWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="We have reached my inevitable victory."
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