local quip = {
    type = "getUsername",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="What's this?"
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
        value="Another meatbag?"
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
        value="Does the meatbag have a name?"
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