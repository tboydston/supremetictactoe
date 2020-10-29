local quip = {
    type = "clickInIris",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Why would you do that!"
    },
    {
        action="end"
    }
}

return quip
