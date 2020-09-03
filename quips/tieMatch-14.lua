local quip = {
    type = "tieMatch",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Well, well."
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