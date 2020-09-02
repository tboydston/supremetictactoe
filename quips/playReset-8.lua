local quip = {
    type = "playReset",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Why don't you let me save you the trouble."
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
        value="You play X, I play O, You play X, I play O, You play X, I play O"
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
        value="Then I win again."
    },
    {
        action="pause",
        value="2"
    }, 
    {
        action="end"
    }
}

return quip