local quip = {
    type = "firstPlay",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="You're up."
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