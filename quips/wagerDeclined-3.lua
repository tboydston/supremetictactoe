local quip = {
    type = "wagerDeclined",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Common!! live a little."
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
