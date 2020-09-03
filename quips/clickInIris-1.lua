local quip = {
    type = "clickInIris",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Ouch!"
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