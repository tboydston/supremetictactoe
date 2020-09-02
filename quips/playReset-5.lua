local quip = {
    type = "playReset",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Don't you have anything better to do then lose over and over."
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