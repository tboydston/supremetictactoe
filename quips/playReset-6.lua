local quip = {
    type = "playReset",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="You must have very high self esteem."
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
        value="To be able to endure crippling defeat over and over."
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