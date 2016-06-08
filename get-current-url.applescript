on appIsRunning(appName)
  tell application "System Events" to (name of processes) contains appName
end appIsRunning


on run
  set theApplication to (name of (info for (path to frontmost application)))
  set theText to ""
  set theURL to ""
  
  if theApplication is "Google Chrome.app" and appIsRunning("Google Chrome") then
    set theResult to run script "tell application id \"com.google.chrome\"
      using terms from application \"Google Chrome\"
        set theText to title of active tab of first window
        set theURL to get URL of active tab of first window
        return {theURL, theText}
      end using terms from
    end tell"
    set theURL to item 1 of theResult
    set theText to item 2 of theResult
    
  else if theApplication is "Vivaldi.app" and appIsRunning("Vivaldi") then
    set theResult to run script "tell application id \"com.vivaldi.Vivaldi\"
      using terms from application \"Vivaldi\"
        set theText to title of active tab of first window
        set theURL to get URL of active tab of first window
        return {theURL, theText}
      end using terms from
    end tell"
    set theURL to item 1 of theResult
    set theText to item 2 of theResult
    
  else if theApplication is "Safari.app" and appIsRunning("Safari") then
    set theResult to run script "tell application id \"com.apple.safari\"
      using terms from application \"Safari\"
        set theTab to front document
        set theText to name of theTab
        set theURL to URL of theTab
        return {theURL, theText}
      end using terms from
    end tell"
    set theURL to item 1 of theResult
    set theText to item 2 of theResult
    
  else if theApplication is "Chromium.app" and appIsRunning("Chromium") then
    set theResult to run script "tell application \"Chromium\"
      set theURL to URL of active tab of first window
      set theText to title of active tab of first window
      return {theURL, theText}
    end tell"
    set theURL to item 1 of theResult
    set theText to item 2 of theResult
    
  else if theApplication is "Firefox.app" and appIsRunning("Firefox") then
    set theResult to run script "tell application id \"org.mozilla.firefox\"
      activate
      set w to item 1 of window 1
      set theText to name of w
    end tell
    tell application \"System Events\"
      set myApp to name of first application process whose frontmost is true
      if myApp is \"Firefox\" then
        tell application \"System Events\"
          keystroke \"l\" using command down
          delay 0.5
          keystroke \"c\" using command down
        end tell
        delay 0.5
      end if
      delay 0.5
    end tell
    set theURL to get the clipboard
    return {theURL, theText}"
    set theURL to item 1 of theResult
    set theText to item 2 of theResult
 
  else if theApplication is "FirefoxDeveloperEdition.app" and appIsRunning("Firefox") then
    set theResult to run script "tell application id \"org.mozilla.firefoxdeveloperedition\"
      activate
      set w to item 1 of window 1
      set theText to name of w
    end tell
    tell application \"System Events\"
      set myApp to name of first application process whose frontmost is true
      if myApp is \"Firefox\" then
        tell application \"System Events\"
          keystroke \"l\" using command down
          delay 0.5
          keystroke \"c\" using command down
        end tell
        delay 0.5
      end if
      delay 0.5
    end tell
    set theURL to get the clipboard
    return {theURL, theText}"
    set theURL to item 1 of theResult
    set theText to item 2 of theResult

  end if
  
  return {theURL & " @@@@@ " & theText}
  
end run
