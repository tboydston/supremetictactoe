local quip = {
    type = "userNameTooShort",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Try again."
    },
    {
        action="end"
    }
}

return quip