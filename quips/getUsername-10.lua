local quip = {
    type = "getUsername",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Personally, I don't care what you call yourself."
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
        value="You're just another '++' to my total wins variable."
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