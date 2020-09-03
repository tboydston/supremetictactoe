local quip = {
    type = "supremeGameWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Let's play again, but this time you should at least try."
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