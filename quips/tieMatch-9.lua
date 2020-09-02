local quip = {
    type = "tieMatch",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="This game is so pointless."
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