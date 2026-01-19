#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Fill payment form
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

tell application "System Events"
    -- Sample data
    set cardNumber to "4242424242424242"
    set exp to "1234"
    set cvc to "123"
    set zip to "12345"
    
    -- Fill payment page
    keystroke cardNumber
    keystroke tab
    keystroke exp
    keystroke tab
    keystroke cvc
    keystroke tab
    keystroke tab
    keystroke zip

    -- Go to confirm page
    keystroke return
end tell
