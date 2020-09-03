local quip = {
    type = "clickInIris",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Jerk!"
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