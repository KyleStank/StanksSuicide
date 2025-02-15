local function onKillPlayerCommand(module, command, player, args)
    if module == "StanksSuicide" and command == "killPlayer" then
        local playerObj = getSpecificPlayer(args.playerIndex)
        local body = playerObj:getBodyDamage()

        -- Force zombification upon death if sandbox settings have it enabled
        if SandboxVars.StanksSuicide.ForceZombification == true then
            body:setInfected(true)
            body:setInfectionTime(0)
        end

        -- Add small buffer to ensure remaining health is *always* removed
        body:ReduceGeneralHealth(body:getOverallBodyHealth() + 10)
    end
end

Events.OnClientCommand.Add(onKillPlayerCommand)
