local quip = {
    type = "firstPlay",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Just close your eyes and pick a square."
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