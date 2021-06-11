function GetFlour()
    turtle.suck() -- Get Mortar & Pestle
    turtle.up()
    turtle.suck() -- Get Wheat
    turtle.down()
    turtle.craft() -- Make Flour
    turtle.drop()
end

function GetSalt()
    turtle.suck() -- Get Pot
    turtle.up()
    turtle.suck() -- Get Water
    turtle.down()
    turtle.craft()
    turtle.select(1)
    turtle.drop()
    turtle.select(2)
    turtle.transferTo(5)
end

function GetDough()
    turtle.suck() -- Get Mixing Bowl
    turtle.up()
    turtle.suck() -- Get Water
    turtle.turnLeft()
    turtle.suck() -- Get Salt
    turtle.down()
    turtle.turnRight()
    turtle.select(3)
    turtle.transferTo(5)
    turtle.select(4)
    turtle.transferTo(6)
    turtle.craft() -- Make Dough
    turtle.select(1)
    turtle.drop()
    turtle.select(4)
    turtle.transferTo(2)
    turtle.select(1)

    -- FIXME: drop any excess salt and water
    -- RemoveExcess(5)
    -- RemoveExcess(6)
end

function RemoveExcess(slotNum)
    local details = turtle.getItemDetails(slotNum)    
    if details ~= nil and details.count ~= nil and details.count > 0 then
        turtle.dropDown()
    end
end

function GetBread()
    turtle.suck() -- Get Bakeware
    turtle.up()
    turtle.craft() -- Make Bread
    turtle.select(2)
    turtle.drop() -- Store Bread
    turtle.down()
    turtle.select(1)
    turtle.drop()
end

function Bake()
    turtle.select(1)

    GetFlour()

    turtle.turnLeft()
    turtle.forward()
    turtle.turnRight()

    GetDough()

    turtle.back()
    turtle.turnLeft()

    GetBread()

    turtle.back()
    turtle.turnRight()
    turtle.forward()
end

Bake()
