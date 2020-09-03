local quip = {
    type = "getUsername",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="You know, I have always wondered what it would be like to play myself."
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
        value="Supreme vs. Supreme"
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
        value="I wonder who would win?"
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