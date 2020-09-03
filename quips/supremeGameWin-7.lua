local quip = {
    type = "supremeGameWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="I must say, it takes a lot of courage to play a game you know you will lose."
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
        value="Shall I crush you again?"
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