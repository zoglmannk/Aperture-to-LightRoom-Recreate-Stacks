
-- In Aperture
-- Bring up keyword controls — Press “D” then “Shift-D”

-- For each folder
--    Create special filter — Stack pics only
--    Set Keyword — TopOfStack -- be sure that all stacks are closed, filters turned off, and everything is selected

-- Take screen shoot of Projects
--   manually tag photos with cover
--   (Can create custom button set for quick tagging)



-- In LightRoom
-- Call for each collection
-- Make sure the Sort is by "Label Color" by A-Z -- Press T to bring up bottom menu
-- Press Control-F and Set the search by "Keywords" and "Contains Words"


-- Get list of stacks with the following Perl command -- Grab keywords for that project
-- echo 'Aperture Stack 123*, ...' | perl -e 'while(<>) { @tags = split '/,/', $_; @stacks; foreach my $tag (@tags) { if($tag =~ m/Aperture Stack (\d+)/) { push @stacks, $1; } } } print "{" . (join ",", @stacks) . "}";' | pbcopy
-- Copy output to the line "set stacks to {XXXX}" and replace over the "{XXX}"

tell application "Adobe Lightroom Classic"
	activate
	delay 2
	
	set shouldSkipRedFlagging to false
	if not shouldSkipRedFlagging then
		-- Set Red color tag for Photos with TopOfStack keyword
		tell application "System Events" to tell process "Lightroom Classic"
			keystroke "f" using command down
		end tell
		delay 0.5
		tell application "System Events" to tell process "Lightroom Classic"
			keystroke "f" using command down
		end tell
		delay 0.5
		tell application "System Events" to tell process "Lightroom Classic"
			keystroke "a" using command down
		end tell
		tell application "System Events" to tell process "Lightroom Classic"
			keystroke "TopOfStack"
		end tell
		delay 2.5
		tell application "System Events" to tell process "Lightroom Classic"
			key code 53 -- escape
		end tell
		delay 2
		tell application "System Events" to tell process "Lightroom Classic"
			keystroke "a" using command down
		end tell
		delay 2
		tell application "System Events" to tell process "Lightroom Classic"
			keystroke "6" using control down
		end tell
		delay 5
	end if
	
	
	set stacks to {XXXX}
	
	repeat with n in stacks
		--Set Stacks
		tell application "System Events" to tell process "Lightroom Classic"
			keystroke "f" using command down
		end tell
		delay 0.2
		tell application "System Events" to tell process "Lightroom Classic"
			keystroke "f" using command down
		end tell
		delay 0.2
		tell application "System Events" to tell process "Lightroom Classic"
			keystroke "f" using command down
		end tell
		delay 0.2
		tell application "System Events" to tell process "Lightroom Classic"
			keystroke "f" using command down
		end tell
		delay 2
		tell application "System Events" to tell process "Lightroom Classic"
			keystroke "a" using command down
		end tell
		delay 2
		tell application "System Events" to tell process "Lightroom Classic"
			keystroke "Aperture Stack " & n
		end tell
		delay 2
		tell application "System Events" to tell process "Lightroom Classic"
			key code 53 -- escape
		end tell
		delay 1
		tell application "System Events" to tell process "Lightroom Classic"
			keystroke "a" using command down
		end tell
		delay 2
		tell application "System Events" to tell process "Lightroom Classic"
			keystroke "g" using command down
		end tell
		delay 1
	end repeat
	
	-- unfilter
	delay 3
	tell application "System Events" to tell process "Lightroom Classic"
		keystroke "f" using command down
	end tell
	delay 1
	tell application "System Events" to tell process "Lightroom Classic"
		keystroke "a" using command down
	end tell
	delay 1
	tell application "System Events" to tell process "Lightroom Classic"
		key code 51
	end tell
	
	-- Unset color tag for everything
	tell application "System Events" to tell process "Lightroom Classic"
		key code 53 -- escape
	end tell
	delay 0.2
	tell application "System Events"
		tell process "Lightroom Classic"
			set frontmost to true
			click menu item "Expand All Stacks" of menu of menu item "Stacking" of menu "Photo" of menu bar 1
		end tell
	end tell
	delay 0.2
	tell application "System Events" to tell process "Lightroom Classic"
		keystroke "a" using command down
	end tell
	delay 0.2
	tell application "System Events"
		tell process "Lightroom Classic"
			set frontmost to true
			click menu item "None" of menu of menu item "Set Color Label" of menu "Photo" of menu bar 1
		end tell
	end tell
	tell application "System Events"
		tell process "Lightroom Classic"
			set frontmost to true
			click menu item "Collapse All Stacks" of menu of menu item "Stacking" of menu "Photo" of menu bar 1
		end tell
	end tell
	delay 1
	tell application "System Events" to tell process "Lightroom Classic"
		keystroke "d" using command down
	end tell
	
end tell
