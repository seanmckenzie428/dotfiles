#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Video Loop Automation
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🎬
# @raycast.argument1 {"type": "text", "placeholder": "URL", "optional": true}

on run argv
    -- Get URL from Raycast argument or use default
    set targetURL to "https://www.foxsports.com/nfl/nfc-conference-championships-los-angeles-rams-vs-seattle-seahawks-jan-25-2026-game-boxscore-11035"
    if (count of argv) > 0 then
        set targetURL to item 1 of argv
    end if
    
    tell application "Safari"
        -- Set maximum runtime (2 hours = 7200 seconds)
        set maxRunTime to 7200
        set startTime to current date
        
        -- Counter for iterations
        set iterationCount to 0
        
        repeat while ((current date) - startTime) < maxRunTime
            set iterationCount to iterationCount + 1
            log "Starting iteration " & iterationCount
            
            -- Open a new private window
            tell application "System Events"
                tell process "Safari"
                    -- Activate Safari
                    activate
                    
                    -- Open private window using menu
                    click menu item "New Private Window" of menu "File" of menu bar 1
                    
                    -- Wait for window to open
                    delay 2
                    
                    -- Activate Safari and navigate to URL
                    tell application "Safari" to activate
                    delay 0.5
                    keystroke "l" using command down
                    delay 0.5
                    keystroke targetURL
                    delay 0.5
                    key code 36 -- Return key
                    
                end tell
            end tell
            
            -- Wait for page to load
            delay 5
            
            -- Additional delay for video elements to fully load
            delay 5
            
            -- Click play on video
            tell application "System Events"
                tell process "Safari"
                    -- Wait a bit more for video to load
                    delay 3
                    
                    -- Wait for manual mouse click
                    delay 5
                    
                    -- Make video fullscreen
                    key code 3 using control down -- Control+F for fullscreen
                    
                end tell
            end tell
            
            -- Wait for 4.75 minutes (285 seconds)
            delay 285
            
            -- Close the window
            tell application "Safari" to quit
            
            -- Short delay before next iteration
            delay 2
            
            -- Check if we're approaching time limit
            if ((current date) - startTime) >= maxRunTime then
                log "Time limit reached, stopping automation"
                exit repeat
            end if
            
        end repeat
    end tell
end run
