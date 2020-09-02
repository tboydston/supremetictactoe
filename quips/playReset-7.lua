local quip = {
    type = "playReset",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Again, really?"
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