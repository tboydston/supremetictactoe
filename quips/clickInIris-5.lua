local quip = {
    type = "clickInIris",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Jerk!"
    },
    {
        action="end"
    }
}

return quip
