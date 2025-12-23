-- Define log levels (higher number means more critical)
local LOG_LEVELS = {
    DEBUG = 1,
    INFO  = 2,
    WARN  = 3,
    ERROR = 4,
    FATAL = 5,
}

-- Set the minimum log level for the application (e.g., WARN)
local MIN_LOG_LEVEL = LOG_LEVELS.WARN

-- Custom logging function
function log(level_name, message)
    if LOG_LEVELS[level_name] >= MIN_LOG_LEVEL then
        print(level_name .. ": " .. message)
    end
end

-- Usage examples
log("DEBUG", "This detailed message is for debugging purposes.") -- Not displayed
log("INFO", "An informational event occurred.")                  -- Not displayed
log("WARN", "A potentially harmful situation detected.")         -- Displayed
log("ERROR", "An error occurred, but the app continues.")       -- Displayed

-- Example snippet on how to run loglevels.
