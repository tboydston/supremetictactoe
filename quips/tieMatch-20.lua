local quip = {
    type = "tieMatch",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="All that work and nothing was accomplished."
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