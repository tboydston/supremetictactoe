local quip = {
    type = "sameName",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="They say immitation is the most sincere form of flattery."
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