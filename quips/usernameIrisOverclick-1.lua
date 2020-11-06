local quip = {
    type = "usernameIrisOverclick",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Jerk, I know what to call you."
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
