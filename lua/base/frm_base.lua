FirstRepsonderMod = {}
function FirstRepsonderMod.Initialize()
  if FirstResponderMod.Validated then
    console.log("First Responder Modification Loaded Successfully\nCreated by kennyjohnson")
    console.log("Support Discord https://discord.gg/vqYTneB")
  else
    console.log("Error loading FRM")
  end
end

Citizen.CreateThread( function()
    FirstRepsonderMod.Initialize()
end
