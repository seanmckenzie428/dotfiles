#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Condolences
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

tell application "System Events"
    -- Sample data
    set fullName to "John Doe"
    set emailAddress to "john.doe@example.com"
    set phoneNumber to "5551234567"
    set cardNumber to "4242424242424242"
    set exp to "1234"
    set cvc to "123"
    set zip to "12345"
    
    -- Fill contact page
    keystroke fullName
    keystroke tab
    keystroke emailAddress
    keystroke tab
    keystroke phoneNumber
    
    -- Go to message page
    keystroke return
    
    -- Go to delivery page
    delay 2
    keystroke return
    
    -- Go to payment page
    delay 2
    repeat 7 times
        keystroke tab
    end repeat
    keystroke return

    -- Fill payment page
    delay 2
    repeat 7 times
        keystroke tab
    end repeat
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
    delay 2
    
    -- Confirm checkout
    repeat 7 times
        keystroke tab
    end repeat
    keystroke return
end tell
