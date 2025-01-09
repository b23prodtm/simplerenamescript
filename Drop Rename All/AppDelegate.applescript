--
--  AppDelegate.applescript
--  Drop Rename All
--
--  Created by MacPro1 on 09/01/2025.
--  Copyright (c) 2025 b23FF4U. All rights reserved.
--

script AppDelegate
	property parent : class "NSObject"

	-- IBOutlets
	property theWindow : missing value
    
    on main(arg1, arg2, arg3)
        -- Insert code here to initialize your application before any files are opened
        -- Prompt for the string to find and the string to replace it with
        set findString to arg1
        if findString is missing value then
            set findString to text returned of (display dialog localizedString("findString") default answer "")
        end if
        set replaceString to arg2
        if replaceString is missing value then
            set replaceString to text returned of (display dialog localizedString("replaceString") default answer findString)
        end if
        
        -- Get the files to rename
        set selectedFiles to arg3
        if selectedFiles is missing value then
            set selectedFiles to (choose file with prompt localizedString("selectedFiles") with multiple selections allowed)
        end if
        
        -- Loop through each selected file
        repeat with aFile in selectedFiles
            set filePath to POSIX path of aFile
            set fileName to name of (info for aFile)
            
            -- Replace the findString with replaceString in the file name
            set newFileName to my replaceText(findString, replaceString, fileName)
            
            -- Rename the file
            tell application "Finder"
                set name of (aFile as alias) to newFileName
            end tell
        end repeat
    end main

    on run
       main("TestFile.","Test.","EmptyTestFile.txt")
    end run
    
	on applicationWillFinishLaunching_(aNotification)
        main(missing value,missing value,missing value)
        display dialog localizedString("filesRenamed")
	end applicationWillFinishLaunching_
    
    on localizedString(key)
        set locString to current application's NSBundle's mainBundle's localizedStringForKey:key value:"" table:""
        return locString as text
    end localizedString
    
    -- Function to replace text in a string
    on replaceText(findString, replaceString, originalString)
        set AppleScript's text item delimiters to findString
        set textItems to text items of originalString
        set AppleScript's text item delimiters to replaceString
        set newString to textItems as string
        set AppleScript's text item delimiters to {""} -- Reset delimiters
        return newString
    end replaceText
	
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits 
		return current application's NSTerminateNow
	end applicationShouldTerminate_
	
end script
