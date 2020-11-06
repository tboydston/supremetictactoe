local quip = {
    type = "wagerAccepted",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Finally some real stakes!"
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
