local quip = {
    type = "clickInIris",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Hey, stop it!"
    },
    {
        action="end"
    }
}

return quip
