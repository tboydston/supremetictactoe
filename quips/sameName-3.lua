local quip = {
    type = "sameName",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="What have you done!"
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