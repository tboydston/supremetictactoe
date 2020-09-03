local quip = {
    type = "playerWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Don't let this minor victory go to your head."
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
        value="Or do... It's not like I care."
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