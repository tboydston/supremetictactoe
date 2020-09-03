local quip = {
    type = "playerTurn",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Boy, I am going to need to think..."
    },
    {
        action="pause",
        value="3"
    },
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Still thinking."
    },
    {
        action="pause",
        value="1"
    }, 
	{
        action="clearQuip",
    },
    {
        action="say",
        value="Still thinking ."
    },
    {
        action="pause",
        value="1"
    }, 
    {
        action="clearQuip",
    }, 
    {
        action="say",
        value="Still thinking . ."
    },
    {
        action="pause",
        value="1"
    }, 
	{
        action="clearQuip",
    }, 
    {
        action="say",
        value="Still thinking . . ."
    },
    {
        action="pause",
        value="3"
    }, 
    {
        action="clearQuip",
    }, 
    {
        action="say",
        value="Done."
    },
    {
        action="pause",
        value="1"
    },
    {
        action="end"
    }
}

return quip