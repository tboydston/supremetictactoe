local quip = {
    type = "userNameTooShort",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="You have to enter something."
    },
    {
        action="end"
    }
}

return quip