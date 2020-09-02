local quip = {
    type = "tieMatch",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Not losing doesn't make you a winner."
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