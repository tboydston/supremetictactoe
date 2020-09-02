local quip = {
    type = "playReset",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Again? you have nothing better to do."
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