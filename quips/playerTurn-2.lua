local quip = {
    type = "playerTurn",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Oh wow what a good move."
    },
    {
        action="pause",
        value="1"
    },
    {
        action="clearQuip",
    },
    {
        action="say",
        value="I am really going to need to think about my next move."
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
        value="Just kidding."
    },
    {
        action="pause",
        value="1"
    },
    {
        action="end"
    }
}

return quip