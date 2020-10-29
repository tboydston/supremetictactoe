local quip = {
    type = "firstPlay",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Close your eyes and pick one."
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