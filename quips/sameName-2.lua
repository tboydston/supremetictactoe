local quip = {
    type = "sameName",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Hey, that names taken!"
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