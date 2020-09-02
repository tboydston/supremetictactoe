local quip = {
    type = "playerTurn",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Wow, I bet you wish there was a redo button."
    },
    {
        action="pause",
        value="1"
    },
    {
        action="end"
    }
}

return quip