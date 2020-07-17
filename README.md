# Aperture-to-LightRoom-Recreate-Stacks
AppleScript to assist in the migration from Aperture to LightRoom Classic


Have you ever procrastinated on something for years? On June 2, 2014, Apple announced the end of Aperture — a photo editing and organization application. After six years, I finally made the transition from Aperture to LightRoom Classic! 

I had put off this transition because of how much time it would take with 80,000 photos. But I couldn't put it off any longer. Once Apple releases BigSur this fall, they will no longer provide security updates to macOS Mojave. Given that my home workstation is now the computer I use for work, I couldn't delay it. After putting in 100 hours of my time over three weeks working non-stop in the evenings and weekends, I completed the task! This process would have required far more time, but I developed my own automation.

Apple worked with Adobe to create a migration tool years ago, making it possible and more reasonable to migrate. But their tool failed to preserve an essential organization feature — stacks. With countless photos, it is vital to see only the most interesting and best pictures. Stacks allow you to group similar photos and pick one of the images to represents all the other ones. Except for the chosen photo, all the other images are hidden.

I had many 1,000s of stacks. So I developed a brute force way to recreate the stacks in LightRoom using a semi-automated process by using my own custom AppleScript. 

The conversion tool tagged a stack of photos with a unique label, such as "Aperture Stack 123." Before running Adobe's migration tool and with all filtered disabled, I tagged all visible photographs with a label called "TopOfStack." 

Then after the initial migration, for each collection it was a matter of 1) Selecting all the pictures 2) Grabbing the combined keywords 3) Pasting the keywords as part of a Perl script that parsed them on the command line 4) Sorting the collection by "Label Color" 5) Ensuring that the LightRoom search was set up for "Keywords" and "Contains Words" 6) Pasting the output of the Perl script into a custom AppleScript 7) And finally executing that AppleScript.

Finally, once I restored the stacks, there was still a bit of work left. I had to re-setup filtering and, in some cases, manually reorder a handful of visible images.

All of that took a lot of manual work! As a software developer, I was disappointed that Adobe did not provide satisfactory hooks into LightRoom Classic to automate more of the process. 1) Their Lua based plugin system exposes minimal functionality, except for a few use cases. 2) Adobe failed to offer keyboard shortcuts for many features, especially for functionality not accessible from the menus. 3) And Adobe neglected to exposure native AppleScript functionality.

Given all those limitations, I took the brute force approach to automation, essentially emulating human interaction with LightRoom. It took a while to figure out timing issues. If commands were sent to quickly to the application, it would simply throw away the keyboard input! If I went to slowly, it wasted my time.

I also realized I could make the execution time predictable by ensuring that all the thumbnail images were rendered before proceeding. If the execution time was too variable, the AppleScript would fail.
