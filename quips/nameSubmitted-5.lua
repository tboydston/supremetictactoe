local quip = {
    type = "nameSubmitted",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Bet you got picked on a lot in school with that name."
    },
    {
        action="pause",
        value="2"
    }, 
    {
        action="clearQuip",
    },
    {
        action="sceneChange",
        value="tictactoe"
    }
}

return quip