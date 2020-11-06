local quip = {
    type = "quit",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Had enough huh?"
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