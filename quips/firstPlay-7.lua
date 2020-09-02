local quip = {
    type = "firstPlay",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Just pick a number between 1 and 9 and play that square."
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