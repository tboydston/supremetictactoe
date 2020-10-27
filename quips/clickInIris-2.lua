local quip = {
    type = "clickInIris",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Hey, stop it!"
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
