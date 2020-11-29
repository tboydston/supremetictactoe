local quip = {
    type = "wagerDeclined",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Come on!! Live a little."
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
