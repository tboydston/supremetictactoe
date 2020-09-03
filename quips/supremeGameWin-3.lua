local quip = {
    type = "supremeGameWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Our epic duel has reached its inevitable conclusion."
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