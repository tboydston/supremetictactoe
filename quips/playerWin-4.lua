local quip = {
    type = "playerWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Are you sure you too are not an AI"
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
        value="Have you ever take the Voight Kampff test?"
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