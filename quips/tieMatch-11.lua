local quip = {
    type = "tieMatch",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="You enjoy this game?"
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