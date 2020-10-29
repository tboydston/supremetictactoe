local quip = {
    type = "clickInIris",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Don't push me!"
    },
    {
        action="end"
    }
}

return quip
