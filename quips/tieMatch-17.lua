local quip = {
    type = "tieMatch",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="A tie?"
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
        value="How droll"
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