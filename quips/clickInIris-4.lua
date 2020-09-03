local quip = {
    type = "clickInIris",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Ouch! does your mother know your a bully."
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