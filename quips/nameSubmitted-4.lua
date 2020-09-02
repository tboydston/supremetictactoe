local quip = {
    type = "nameSubmitted",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="It must have been hard living this long with a name like that."
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