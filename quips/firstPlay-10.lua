local quip = {
    type = "firstPlay",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="I suggest the middle square."
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
        value="Or one of the outside ones."
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
        value="Just pick one."
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