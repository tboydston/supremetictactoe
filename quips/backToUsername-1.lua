local quip = {
    type = "backToUsername",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="A new challenger?"
    },
    {
        action="pause",
        value="2"
    },
    {
        action="sceneChange",
        value="getUsername"
    }
}

return quip