local quip = {
    type = "clickInIris",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Stop picking on me!"
    },
    {
        action="end"
    }
}

return quip
