local quip = {
    type = "nameSubmitted",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="You must be so mad at your parents for picking that name."
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