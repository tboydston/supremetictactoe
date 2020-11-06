local quip = {
    type = "clickInIris",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Who raised you!"
    },
    {
        action="end"
    }
}

return quip
