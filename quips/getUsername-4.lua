local quip = {
    type = "getUsername",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="You know how to oporate that keyboard right?"
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
        value="Just match the letters with the ones in your name."
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
        value="Do you need the number for tech support?"
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