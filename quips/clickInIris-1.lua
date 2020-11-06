local quip = {
    type = "clickInIris",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Ouch!"
    },
    {
        action="end"
    }
}

return quip
