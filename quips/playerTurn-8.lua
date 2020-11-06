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
        value="2"
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
        value="1"
    }, 
    {
        action="clearQuip",
    }, 
    {
        action="say",
        value="Done."
    },
    {
        action="end"
    }
}

return quip