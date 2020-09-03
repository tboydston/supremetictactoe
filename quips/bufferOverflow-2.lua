local quip = {
    type = "bufferOverflow",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="What did you do?"
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
        value="I expect you to debug this."
    },
    {
        action="pause",
        value="2"
    }, 
    {
        action="sceneChange",
        value="restarting"
    },
}

return quip