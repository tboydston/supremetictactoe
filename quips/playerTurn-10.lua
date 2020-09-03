local quip = {
    type = "playerTurn",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Wow, I bet you wish there was a RESET(r) button."
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
        value="Or like a key that you could press. To RESET(r)."
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