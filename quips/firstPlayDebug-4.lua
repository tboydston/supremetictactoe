local quip = {
    type = "firstPlayDebug",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="I am going to need to see some qualifications before you operate that debug menu."
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