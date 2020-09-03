local quip = {
    type = "clickInIris",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Ouch!! Does your mother know you're a bully?"
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
