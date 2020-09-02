local quip = {
    type = "firstPlay",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Don't think too hard."
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
        value="I don't want you to fry your brain."
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