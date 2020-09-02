local quip = {
    type = "supremeGameWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Yes, about what I expected from that primate brain."
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
        value="Shall we continue?"
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