local quip = {
    type = "supremeGameWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Surprise, surprise."
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
        value="Shall I crush you again or are you good?"
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