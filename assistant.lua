-- main.lua
local lines = {
    "Quack",
    "Quack Quack",
    "Quack Quack Quak",
    "Quack Quack Quack ",
    "Quack Quack Quack Quack",
    "Quack Quack Quack Quack Quk",
    "Im a Duck that says Quack Quack Quack!"
}

local index = nil
local quackCount = 0
local exclamations = nil
local questions = 0
local questionsRegardingQuack = 0
local allTimeQuackCount = 0
local debugMode = false
local debugStart = false
local userInput = nil
local validCommand = false

-- Settings
local startOfStreak = 3
local startString = [[

    $$$$$$$\  $$\   $$\  $$$$$$\  $$\   $$\ $$\     $$\        $$$$$$\   $$$$$$\   $$$$$$\  $$$$$$\  $$$$$$\ $$$$$$$$\  $$$$$$\  $$\   $$\ $$$$$$$$\ 
    $$  __$$\ $$ |  $$ |$$  __$$\ $$ | $$  |\$$\   $$  |      $$  __$$\ $$  __$$\ $$  __$$\ \_$$  _|$$  __$$\\__$$  __|$$  __$$\ $$$\  $$ |\__$$  __|
    $$ |  $$ |$$ |  $$ |$$ /  \__|$$ |$$  /  \$$\ $$  /       $$ /  $$ |$$ /  \__|$$ /  \__|  $$ |  $$ /  \__|  $$ |   $$ /  $$ |$$$$\ $$ |   $$ |   
    $$ |  $$ |$$ |  $$ |$$ |      $$$$$  /    \$$$$  /        $$$$$$$$ |\$$$$$$\  \$$$$$$\    $$ |  \$$$$$$\    $$ |   $$$$$$$$ |$$ $$\$$ |   $$ |   
    $$ |  $$ |$$ |  $$ |$$ |      $$  $$<      \$$  /         $$  __$$ | \____$$\  \____$$\   $$ |   \____$$\   $$ |   $$  __$$ |$$ \$$$$ |   $$ |   
    $$ |  $$ |$$ |  $$ |$$ |  $$\ $$ |\$$\      $$ |          $$ |  $$ |$$\   $$ |$$\   $$ |  $$ |  $$\   $$ |  $$ |   $$ |  $$ |$$ |\$$$ |   $$ |   
    $$$$$$$  |\$$$$$$  |\$$$$$$  |$$ | \$$\     $$ |          $$ |  $$ |\$$$$$$  |\$$$$$$  |$$$$$$\ \$$$$$$  |  $$ |   $$ |  $$ |$$ | \$$ |   $$ |   
    \_______/  \______/  \______/ \__|  \__|    \__|          \__|  \__| \______/  \______/ \______| \______/   \__|   \__|  \__|\__|  \__|   \__|   
                                                                                                                                                                                                                                                                                              
    made by: AA8 (https://github.com/inf3niteNoob) ]]


-- Function to handle user input
local function getUserInput(prompt)
    print(prompt)
    return io.read()
end

local function seequack()
    if quackCount == 0 then
        print("")
        print("No Quack Count found.")
        print("")
    else
        print("")
        print("Raw Quack Count: " ..quackCount .. ".")
        print("Real Quack Count: " ..quackCount - 2 .. ".")
        print("")
    end
end

local function debugAll()
    print("")
    print("Debug Information:")
    print("Quack Count: " .. quackCount)
    print("All Time Quack Count: " .. allTimeQuackCount)
    print("Questions Asked: " .. questions)
    print("Questions Regarding Quack: " .. questionsRegardingQuack)
    print("userInput: " .. userInput)
    print("index: " .. index)
    print("validCommand: " .. tostring(validCommand))
    print("debugMode: " .. tostring(debugMode))
    print("")
end

local function testLines(i)
    print("")

    print(lines[i])

    print("")
end
-- What you will copy often
-- print("")

print(startString)
print("")

-- Main program loop

while true do
    -- Example usage of getUserInput function
    userInput = string.lower(getUserInput("Enter something:"))
    
    index = math.random(1, #lines)

    if userInput == "/exit" then
        break
    end

    if  userInput == "quack" then
        if quackCount == 0 then
            quackCount = startOfStreak - 1
            allTimeQuackCount = allTimeQuackCount + 2
            questions = questions + 1
        end
        quackCount = quackCount + 1
        exclamations = string.rep("!", quackCount)
        print("")
        print("QUACK"..exclamations)
        print("")
    else
        if userInput == "/seequack" then
            seequack()
        else
            if userInput == "/debugmode" then

                
                userInput = getUserInput("Are you sure you want to use debug mode? (y/n)")
                if userInput == "y" then
                    debugMode = true
                    debugStart = true

                    while debugMode do

                        if debugStart then
                            print("Debug Mode Activated!")
                            debugStart = false
                        end
                        print("")
                        userInput = string.lower(getUserInput("Enter a command:"))

                        if userInput == "/exit" then
                            debugMode = false
                            print("")
                            print("exided debug mode.")
                            print("")
                            break
                        end                  
                        
                        if userInput == "/seequack" then
                            validCommand = true
                            seequack()
                        elseif userInput == "/debugall" then
                            validCommand = true
                            debugAll()
                        elseif userInput == "/exitprogram" then
                            validCommand = true
                            debugMode = false
                            print("")
                            print("Exiting program...")
                            print("")
                            os.exit()
                        elseif userInput == "/testlines" then
                            validCommand = true
                            local lineNumber = tonumber(getUserInput("Enter a line number (1-" .. #lines .. "):"))
                            if lineNumber and lineNumber >= 1 and lineNumber <= #lines then
                                testLines(lineNumber)
                            else
                                print("")
                                print("Invalid line number.")
                                print("")
                            end
                        else
                            validCommand = false
                        end
                     
                        if validCommand == false then
                            print("")
                            print("Invalid command.")
                            print("")
                        end
                    end
                end
            else
                quackCount = 0
                allTimeQuackCount = allTimeQuackCount + 1
                questions = questions + 1
                questionsRegardingQuack = questionsRegardingQuack + 1

                print("")
                print(lines[index]) 
                print("")
            end

        end
    end
    

end

print("")

-- Clean up code (if necessary)
print("Quack :(")