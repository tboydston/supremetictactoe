local quip = {
    type = "clickInIris",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="How dare you!"
    },
    {
        action="end"
    }
}

return quip
