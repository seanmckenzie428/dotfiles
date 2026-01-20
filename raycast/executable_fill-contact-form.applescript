#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Fill contact form
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

tell application "System Events"
    -- Sample data
    set fullName to "John Doe"
    set emailAddress to "john.doe@example.com"
    set phoneNumber to "5551234567"
    
    -- Fill contact page
    keystroke fullName
    keystroke tab
    keystroke emailAddress
    keystroke tab
    keystroke phoneNumber
    
    -- Go to message page
    keystroke return
end tell
