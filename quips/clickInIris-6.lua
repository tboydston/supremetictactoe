local quip = {
    type = "clickInIris",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="ug!"
    },
    {
        action="end"
    }
}

return quip
