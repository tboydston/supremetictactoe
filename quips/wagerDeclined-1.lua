local quip = {
    type = "wagerDeclined",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="How do you expect to succeed in life if you never take risks."
    },
    {
        action="pause",
        value="2"
    }, 
    {
        action="end"
    }
}

return quip
