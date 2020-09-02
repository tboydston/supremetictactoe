local quip = {
    type = "getUsername",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Whats your name?"
    },
    {
        action="pause",
        value="2"
    },
    {
        action="clearQuip",
    },
    {
        action="say",
        value="You know, the thing other meatbags call you."
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