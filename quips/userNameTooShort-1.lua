local quip = {
    type = "userNameTooShort",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Umm... forget your name?"
    },
    {
        action="end"
    }
}

return quip