local quip = {
    type = "backToUsername",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Couldn't take it huh?"
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