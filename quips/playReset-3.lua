local quip = {
    type = "playReset",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="You certainly are a glutton for punishment."
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