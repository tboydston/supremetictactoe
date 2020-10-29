local quip = {
    type = "wagerAccepted",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Let the games begin!"
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
