local quip = {
    type = "userNameTooShort",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Too long."
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
        value="I think I'll just call you Meatbag."
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