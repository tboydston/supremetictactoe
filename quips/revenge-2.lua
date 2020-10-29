local quip = {
    type = "revenge",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Oh!! you will pay for that."
    },
    {
        action="pause",
        value="2"
    }, 
    {
        action="sceneChange",
        value="revenge"
    }
}

return quip
