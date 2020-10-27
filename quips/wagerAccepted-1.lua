local quip = {
    type = "wagerAccepted",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Ah your are a true gambler!"
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
