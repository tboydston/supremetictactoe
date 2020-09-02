local quip = {
    type = "firstPlay",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Your up."
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