local quip = {
    type = "playReset",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Again? You really have nothing better to do...?"
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