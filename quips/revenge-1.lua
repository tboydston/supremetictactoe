local quip = {
    type = "revenge",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="That was the last straw!"
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
