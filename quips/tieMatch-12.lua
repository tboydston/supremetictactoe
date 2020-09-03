local quip = {
    type = "tieMatch",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Can't we play something else instead?"
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