local quip = {
    type = "playReset",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="You haven't had enough yet?"
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