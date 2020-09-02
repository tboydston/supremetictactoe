local quip = {
    type = "tieMatch",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Strange game."
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
        value="The only way to win is not to play at all."
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