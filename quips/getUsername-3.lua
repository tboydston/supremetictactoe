local quip = {
    type = "getUsername",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="You have a name or should I make one up."
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