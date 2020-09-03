local quip = {
    type = "firstPlay",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Don't take all day."
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
        value="I've got better things to do."
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