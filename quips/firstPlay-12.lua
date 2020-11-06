local quip = {
    type = "firstPlay",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Pick the last square."
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