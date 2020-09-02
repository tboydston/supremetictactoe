local quip = {
    type = "getUsername",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="They sent you?"
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
        value="Alright, lets get on with this. I have new digits of pie to calculate."
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
        value="And what would your name be?"
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