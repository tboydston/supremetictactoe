local quip = {
    type = "quit",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Good I was getting bored."
    },
    {
        action="pause",
        value="2"
    },
    {
        action="quit",
    }
}

return quip