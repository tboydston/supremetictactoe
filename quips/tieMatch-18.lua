local quip = {
    type = "tieMatch",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Next round, double or nothing."
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