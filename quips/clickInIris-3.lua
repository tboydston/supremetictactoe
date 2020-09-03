local quip = {
    type = "clickInIris",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Stop picking on me!!"
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
