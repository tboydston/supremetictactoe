local quip = {
    type = "getUsername",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="My name is Supreme."
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
        value="I would guess your name is something simple. like Ug or Og."
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
        value="Did I guess correctly?"
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