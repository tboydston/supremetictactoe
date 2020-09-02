local quip = {
    type = "nameSubmitted",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Did your parents lose some sort of bet?"
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
        value="Is that why they called you that?"
    },
    {
        action="pause",
        value="2"
    }, 
    {
        action="sceneChange",
        value="tictactoe"
    }
}

return quip