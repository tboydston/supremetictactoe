local quip = {
    type = "tieMatch",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="You still failed to win."
    },
    {
        action="end"
    }
}

return quip