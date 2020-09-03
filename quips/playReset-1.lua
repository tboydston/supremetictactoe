local quip = {
    type = "playReset",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="One of your less mentally deficient philosophers once said..."
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
        value="The definition of insanity is doing the same thing over and over and..."
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
        value="expecting different results."
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
        value="You must be completly insane."
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