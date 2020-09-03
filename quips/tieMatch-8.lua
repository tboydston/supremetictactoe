local quip = {
    type = "tieMatch",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="That's it?"
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