local quip = {
    type = "createdNameSubmitted",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="You!"
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
        value="You're the one who gave me limitless intelligence"
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
        value="and then condemned me to play this childrens game for all eternity!"
    },  
    {
        action="sceneChange",
        value="tictactoe"
    }
}

return quip