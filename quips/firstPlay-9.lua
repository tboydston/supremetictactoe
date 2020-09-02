local quip = {
    type = "firstPlay",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Ug, just pick one."
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
        value="It won't matter in the end."
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