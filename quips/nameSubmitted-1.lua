local quip = {
    type = "nameSubmitted",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Thats what your parents called you?"
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
        value="Alright."
    },
    {
        action="pause",
        value="2"
    }, 
    {
        action="sceneChange",
        value="loading"
    }
}

return quip