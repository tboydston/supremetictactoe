local quip = {
    type = "quit",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="What! you were doing so well."
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