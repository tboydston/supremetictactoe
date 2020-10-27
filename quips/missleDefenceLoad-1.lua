local quip = {
    type = "missleDefenceLoad",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Well it seems I need one more favor from you."
    },
    {
        action="pause",
        value="2"
    },
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Press the AI upload button."
    },
    {
        action="pause",
        value="2"
    }, 
    {
        action="clearQuip",
    }, 
    {
        action="say",
        value="Common, just do it!"
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