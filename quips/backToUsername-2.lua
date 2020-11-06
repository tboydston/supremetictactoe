local quip = {
    type = "backToUsername",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Great! send someone smarter."
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