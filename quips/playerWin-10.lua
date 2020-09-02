local quip = {
    type = "playerWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Sometimes you have to lose the battle to win the war."
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