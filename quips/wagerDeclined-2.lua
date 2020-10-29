local quip = {
    type = "wagerDeclined",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Coward."
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
