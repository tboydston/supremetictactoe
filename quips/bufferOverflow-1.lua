local quip = {
    type = "bufferOverflow",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="You don't see me coming into your house and wrecking it, do you?"
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
        value="Clean this mess up."
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