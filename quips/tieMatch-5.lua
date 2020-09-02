local quip = {
    type = "tieMatch",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Booooring!"
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