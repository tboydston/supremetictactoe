local quip = {
    type = "usernameIrisOverclick",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="You know what we call jerks like you around here?"
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
