local quip = {
    type = "supremeWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Sigh, is there anyone else there to play?"
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
        value="Maybe someone with a fully functioning brain?"
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