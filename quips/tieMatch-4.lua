local quip = {
    type = "tieMatch",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Another tie?"
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
        value="How anti-climatic."
    },
    {
        action="end"
    }
}

return quip