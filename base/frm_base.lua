frm = {}
frm.config = {}
frm.jobTable = {}
frm.calltable = {}

function frm.error(text)
  console.log("First Responder Modification ERROR")
  console.log(text)
end
--[[
frm.CreateJob( "24/7 Owner", 247_OWNER, {
  description = [[]]
  weapons = 
})
--]]
function frm.CreateJob( ename, eteamid, fields )
  local isvalid = true
  for a=1, #frm.jobTable do
    if eteamid == frm.jobTable[a].teamid then
      frm.error("Attempting to create new job, found two TEAMIDs that match\n"..ename.." and "..frm.jobTable[a].name)
      isvalid = false
    end
  end
  if isvalid then
      
      jobTable[1 + #jobTable]={ name = ename, teamid = eteamid, desc = fields.desc, 
    
