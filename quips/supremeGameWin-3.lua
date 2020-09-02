local quip = {
    type = "supremeGameWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Our epic dual has reached it's inevitable conclusion"
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
        value="Shall we play again?"
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