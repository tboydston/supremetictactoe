local quip = {
    type = "tieMatch",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Stalemate"
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