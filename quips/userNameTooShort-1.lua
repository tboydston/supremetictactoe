local quip = {
    type = "userNameTooShort",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Um.. forget your name?"
    },
    {
        action="end"
    }
}

return quip