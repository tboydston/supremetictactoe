local quip = {
    type = "tieMatch",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="I guess if you can't beat me the best you can do is not lose."
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