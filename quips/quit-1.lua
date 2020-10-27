local quip = {
    type = "quit",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Coward"
    },
    {
        action="pause",
        value="2"
    },
    {
        action="quit",
    }
}

return quip