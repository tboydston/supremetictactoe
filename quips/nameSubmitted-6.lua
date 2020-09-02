local quip = {
    type = "nameSubmitted",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="I don't know if I can take you seriously with a name like that."
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