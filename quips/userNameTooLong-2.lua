local quip = {
    type = "userNameTooShort",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Wow, I am suprised you can even spell a name that long."
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
        value="Let me just pick a nickname for you."
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