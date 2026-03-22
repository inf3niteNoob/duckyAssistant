-- main.lua
-- Made by: AA8 (https://github.com/inf3niteNoob)

-------------------------------------------------------------------------------
-- DATA & CONFIGURATION
-------------------------------------------------------------------------------
local lines = {
    "Quack",                        "Quack Quack",
    "Quack Quack Quak",             "Quack Quack Quack ",
    "Quack Quack Quack Quack",      "Quack Quack Quack Quack Quk",
    "Im a Duck that says Quack!",   "Quack Quack Quack Quack Quck",
    "Quk",                          "QUACK",
    "Quack...",                     "Quack?",
    "Quack!",                       "Quack-quack!",
    "Quaaaaaack",                   "Q-quack",
    "Quack quack quack!",           "Quak",
    "Quck",                         "Quackity",
    "Quack?",                       "QUACK QUACK!",
    "quack",                        "Quack-ack-ack"
}

-- State Variables
local index                   = nil
local quackCount               = 0
local exclamations             = nil
local questions                = 0
local questionsRegardingQuack  = 0
local allTimeQuackCount        = 0
local debugMenu                = false
local debugStart               = false
local userInput                = nil
local validCommand             = false
local armyStatus               = false
local ducks                    = nil
local cycles                   = nil

-- Settings
local startOfStreak = 3
local startString   = [[

    $$$$$$$\  $$\   $$\  $$$$$$\  $$\   $$\ $$\     $$\         $$$$$$\   $$$$$$\   $$$$$$\  $$$$$$\  $$$$$$\ $$$$$$$$\  $$$$$$\  $$\   $$\ $$$$$$$$\ 
    $$  __$$\ $$ |  $$ |$$  __$$\ $$ | $$  |\$$\   $$  |       $$  __$$\ $$  __$$\ $$  __$$\ \_$$  _|$$  __$$\\__$$  __|$$  __$$\ $$$\  $$ |\__$$  __|
    $$ |  $$ |$$ |  $$ |$$ /  \__|$$ |$$  /  \$$\ $$  /        $$ /  $$ |$$ /  \__|$$ /  \__|  $$ |  $$ /  \__|  $$ |   $$ /  $$ |$$$$\ $$ |   $$ |   
    $$ |  $$ |$$ |  $$ |$$ |      $$$$$  /    \$$$$  /         $$$$$$$$ |\$$$$$$\  \$$$$$$\    $$ |  \$$$$$$\    $$ |   $$$$$$$$ |$$ $$\$$ |   $$ |   
    $$ |  $$ |$$ |  $$ |$$ |      $$  $$<      \$$  /          $$  __$$ | \____$$\  \____$$\   $$ |   \____$$\   $$ |   $$  __$$ |$$ \$$$$ |   $$ |   
    $$ |  $$ |$$ |  $$ |$$ |  $$\ $$ |\$$\      $$ |           $$ |  $$ |$$\   $$ |$$\   $$ |  $$ |  $$\   $$ |  $$ |   $$ |  $$ |$$ |\$$$ |   $$ |   
    $$$$$$$  |\$$$$$$  |\$$$$$$  |$$ | \$$\     $$ |           $$ |  $$ |\$$$$$$  |\$$$$$$  |$$$$$$\ \$$$$$$  |  $$ |   $$ |  $$ |$$ | \$$ |   $$ |   
    \_______/  \______/  \______/ \__|  \__|    \__|           \__|  \__| \______/  \______/ \______| \______/   \__|   \__|  \__|\__|  \__|   \__|   

    made by: AA8 (https://github.com/inf3niteNoob) ]]

-------------------------------------------------------------------------------
-- HELPER FUNCTIONS
-------------------------------------------------------------------------------

local function getUserInput(prompt)
    print(prompt)
    return io.read()
end

local function seequack()
    print("")
    if quackCount == 0 then
        print("No Quack Count found.")
    else
        print("Raw Quack Count: " .. quackCount .. ".")
        print("Real Quack Count: " .. (quackCount - 2) .. ".")
    end
    print("")
end

local function debugAll()
    print("\nDebug Information:")
    print("Quack Count: "                .. quackCount)
    print("All Time Quack Count: "       .. allTimeQuackCount)
    print("Questions Asked: "            .. questions)
    print("Questions Regarding Quack: "  .. questionsRegardingQuack)
    print("userInput: "                  .. (userInput or "nil"))
    print("index: "                      .. (index or "nil"))
    print("validCommand: "               .. tostring(validCommand))
    print("debugMenu: "                  .. tostring(debugMenu) .. "\n")
end

local function testLines(i)
    print("\n" .. lines[i] .. "\n")
end

local function army(ducks,cycles)

    armyStatus = true

    while armyStatus do
        for i = 1,cycles do 
            for j = 1,ducks do
                index = math.random(1, #lines)
                print("\n" .. lines[index] .. "\n")
            end
        end
        armyStatus = false
    end
end
-------------------------------------------------------------------------------
-- MAIN PROGRAM LOOP
-------------------------------------------------------------------------------

print(startString .. "\n")

while true do
    userInput = string.lower(getUserInput("Enter something:"))
    index     = math.random(1, #lines)

    if userInput == "/exit" then
        break
    end

    if userInput == "quack" then
        if quackCount == 0 then
            quackCount = startOfStreak - 1
            allTimeQuackCount = allTimeQuackCount + 2
            questions = questions + 1
        end
        quackCount   = quackCount + 1
        exclamations = string.rep("!", quackCount)
        print("\nQUACK" .. exclamations .. "\n")
    
    elseif userInput == "/seequack" then
        seequack()

    elseif userInput == "/debugMenu" then
        userInput = getUserInput("Are you sure you want to use the debug menu? (y/n)")
        
        if userInput == "y" then
            debugMenu  = true
            debugStart = true

            while debugMenu do
                if debugStart then
                    print("Debug Menu Activated!")
                    debugStart = false
                end
                
                print("")
                userInput = string.lower(getUserInput("Enter a command:"))

                if userInput == "/exit" then
                    debugMenu = false
                    print("\nexited debug menu.\n")
                    break
                
                elseif userInput == "/seequack" then
                    validCommand = true
                    seequack()
                
                elseif userInput == "/debugall" then
                    validCommand = true
                    debugAll()
                
                elseif userInput == "/exitprogram" then
                    print("\nExiting program...\n")
                    os.exit()
                
                elseif userInput == "/testlines" then
                    validCommand = true
                    local lineNumber = tonumber(getUserInput("Enter a line number (1-" .. #lines .. "):"))
                    if lineNumber and lines[lineNumber] then
                        testLines(lineNumber)
                    else
                        print("\nInvalid line number.\n")
                    end
                else
                    validCommand = false
                end

                if not validCommand and debugMenu then
                    print("\nInvalid command.\n")
                end
            end
        end
    elseif userInput == "/army" then

        ducks = tonumber(getUserInput("Enter the number of ducks:"))
        cycles = tonumber(getUserInput("Enter the number of cycles:"))

        if ducks and cycles then
            print("\nStarting duck army...\n")
            army(ducks,cycles)
        else
            print("\nInvalid input for ducks or cycles.\n")
        end
    else
        -- Default behavior: Reset streak and print random quack
        quackCount = 0
        allTimeQuackCount = allTimeQuackCount + 1
        questions = questions + 1
        questionsRegardingQuack = questionsRegardingQuack + 1

        print("\n" .. lines[index] .. "\n")
    end
end

print("\nQuack :(")