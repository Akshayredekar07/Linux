# #!/bin/bash

# # Loop through all files that start with "Session" in the current directory
# for file in Session*.md; do
#     # Check if file exists (to avoid issues if no matching files)
#     if [ -f "$file" ]; then
#         # Create new filename by removing "Session" from the original filename
#         newname="${file#Session}"
        
#         # Rename the file
#         mv "$file" "$newname"
        
#         # Print information about the renaming
#         echo "Renamed: $file → $newname"
#     fi
# done

# echo "Renaming complete!"


#!/bin/bash

# Array of old and new filenames
declare -A file_mapping=(
    # First set of files
    ["01.Introduction.md"]="01.Introduction.md"
    ["02.Components.md"]="02.Components.md"
    ["03.Linux files types.md"]="03.Linux_File_Types.md"
    ["04.Hidden dirs.md"]="04.Hidden_Directories.md"
    ["05.Linux files heirarchy.md"]="05.Linux_File_Hierarchy.md"
    ["06.Ls and its options.md"]="06.LS_Command_And_Options.md"
    ["07.date and cal.md"]="07.Date_And_Calendar_Commands.md"
    ["08.Working with dirs.md"]="08.Working_With_Directories.md"
    ["09.Remove Directories.md"]="09.Removing_Directories.md"
    ["10.Absolute vs Relative Path.md"]="10.Absolute_Vs_Relative_Paths.md"
    ["11.Copying files.md"]="11.Copying_Files.md"
    ["12.Working with files.md"]="12.Working_With_Files.md"
    ["13.View Content.md"]="13.Viewing_File_Content.md"
    ["14.More and less.md"]="14.More_And_Less_Commands.md"
    ["15.Hidden Files and Directories.md"]="15.Hidden_Files_And_Directories.md"
    ["16.Moving and Renaming Dirs.md"]="16.Moving_And_Renaming_Directories.md"
    ["17.Comparing Files.md"]="17.Comparing_Files.md"
    ["18.Creation of Link Files.md"]="18.Creating_Symbolic_Links.md"
    ["19.Word Count.md"]="19.Word_Count_Command.md"
    ["20.Sorting Files.md"]="20.Sorting_File_Content.md"
    ["21.Commands and Data Streams.md"]="21.Commands_And_Data_Streams.md"
    ["22.Redirection.md"]="22.Input_Output_Redirection.md"
    ["23.piping.md"]="23.Command_Piping.md"
    ["24.Multiple Commands Single Line.md"]="24.Multiple_Commands_In_Single_Line.md"
    ["25.Command Aliasing.md"]="25.Command_Aliases.md"
    ["26.Regular Expressions.md"]="26.Regular_Expressions.md"
    
    # Second set of files
    ["27.RE Examples.md"]="27.Regular_Expression_Examples.md"
    ["28.Locate And Find Commands.md"]="28.Locate_And_Find_Commands.md"
    ["29.Find Command.md"]="29.Find_Command_Usage.md"
    ["30.Magic Assignment.md"]="30.Magic_Variable_Assignment.md"
    ["31.file Compression & Uncompression.md"]="31.File_Compression_And_Extraction.md"
    ["32.grep Command.md"]="32.Grep_Command_Basics.md"
    ["33.Grep Single Pattern.md"]="33.Grep_Single_Pattern_Usage.md"
    ["34.Case Study grep command.md"]="34.Grep_Command_Case_Study.md"
    ["35.RE with grep.md"]="35.Regular_Expressions_With_Grep.md"
    ["36.Extended grep.md"]="36.Extended_Grep_Usage.md"
    ["37.Revise.md"]="37.Review_And_Summary.md"
    ["39.Paste Command.md"]="39.Paste_Command_Usage.md"
    ["40.tr Command.md"]="40.Translate_Command.md"
    ["41.File Permissions.md"]="41.File_Permissions_Basics.md"
    ["42.Examples and Use Cases.md"]="42.Permission_Examples_And_Use_Cases.md"
    ["43.Group Permission.md"]="43.Group_Permissions.md"
    ["44.Linux Permission Types.md"]="44.Linux_Permission_Types.md"
    ["45.Umask Command.md"]="45.Umask_Command.md"
    ["46.Working With Editor.md"]="46.Working_With_Text_Editors.md"
    ["47.Working With Editor.md"]="47.Advanced_Text_Editor_Usage.md"
    ["48.Shell Introduction.md"]="48.Shell_Introduction.md"
    ["49.Shell Scrpit Introduction.md"]="49.Shell_Script_Introduction.md"
    ["50.runnning Shell Script.md"]="50.Running_Shell_Scripts.md"
    
    # Third set of files
    ["52.Variables.md"]="52.Shell_Variables.md"
    ["53.VariableScopes.md"]="53.Variable_Scopes.md"
    ["54.VariableSubstitution.md"]="54.Variable_Substitution.md"
    ["55.CommandLineArgs.md"]="55.Command_Line_Arguments.md"
    ["56.ReadinKeyboardInput.md"]="56.Reading_Keyboard_Input.md"
    ["57.Operators.md"]="57.Shell_Operators.md"
    ["58.ControlStatement.md"]="58.Control_Statements.md"
    ["59.StatusCode.md"]="59.Status_Codes.md"
    ["60.FileTestOptions.md"]="60.File_Test_Options.md"
    ["61.StringTestOptions.md"]="61.String_Test_Options.md"
    ["62.CaseStatements.md"]="62.Case_Statements.md"
    ["63.IterativeStatements.md"]="63.Iterative_Statements.md"
    ["64.BreakContinue.md"]="64.Break_And_Continue.md"
    ["65.BreakContinueExamples.md"]="65.Break_Continue_Examples.md"
    ["66.UntilForLoop.md"]="66.Until_And_For_Loops.md"
    ["67.AdvancedForLoop.md"]="67.Advanced_For_Loops.md"
    ["68.Arrays.md"]="68.Shell_Arrays.md"
    ["69.ArraysExamples.md"]="69.Array_Examples.md"
    ["70.Functions.md"]="70.Shell_Functions.md"
    ["71.FunctionsExamples.md"]="71.Function_Examples.md"
    ["72.FunctionExample2.md"]="72.Advanced_Function_Examples.md"
    ["73.VariableScopes.md"]="73.Function_Variable_Scopes.md"
    ["74.CallFunctionAnotherScript.md"]="74.Calling_Functions_From_Other_Scripts.md"
    ["75.Project01.md"]="75.Shell_Project_01.md"
    ["76.BookRental.md"]="76.Book_Rental_Project.md"
    ["77.BookManagementSystem.md"]="77.Book_Management_System.md"
    
    # Fourth set of files (latest addition)
    ["78.UserManagementSystem.md"]="78.User_Management_System.md"
    ["79.StreamEditor.md"]="79.Stream_Editor_Basics.md"
    ["80.StreamEditor02.md"]="80.Advanced_Stream_Editor.md"
    ["81.IntroductionOfAWK.md"]="81.Introduction_To_AWK.md"
    ["82.ProcessingTabularData.md"]="82.Processing_Tabular_Data.md"
    ["83.DisplayRecords.md"]="83.Displaying_Records_With_AWK.md"
    ["84.ConditionalsAWK.md"]="84.AWK_Conditional_Statements.md"
    ["85.AWKscripts.md"]="85.AWK_Scripts.md"
    ["87.JobSchedulingWithCrontab.md"]="87.Job_Scheduling_With_Crontab.md"
    ["88.VariousOptionsofConfig.md"]="88.Configuration_File_Options.md"
    ["89.UserManagement01.md"]="89.User_Management_Part_1.md"
    ["90.UserManagement02.md"]="90.User_Management_Part_2.md"
    ["91.PackageManagement.md"]="91.Package_Management_Basics.md"
    ["91.UserManagement03.md"]="91.User_Management_Part_3.md"
    ["92.PackageManagement.md"]="92.Advanced_Package_Management.md"
)

# Counter for renamed files
renamed=0

# Loop through the mapping and rename files
for old_name in "${!file_mapping[@]}"; do
    new_name="${file_mapping[$old_name]}"
    
    # Check if the old file exists
    if [ -f "$old_name" ]; then
        # Rename the file
        mv "$old_name" "$new_name"
        echo "Renamed: $old_name → $new_name"
        ((renamed++))
    else
        echo "Warning: File '$old_name' not found, skipping."
    fi
done

# Handle duplicate file numbers (91 appears twice)
if [ -f "91.User_Management_Part_3.md" ] && [ -f "91.Package_Management_Basics.md" ]; then
    # Rename the duplicate to use a different number
    mv "91.User_Management_Part_3.md" "91a.User_Management_Part_3.md"
    echo "Resolved duplicate number: 91.User_Management_Part_3.md → 91a.User_Management_Part_3.md"
    ((renamed++))
fi

echo "==================================="
echo "Completed! $renamed files renamed."
echo "All filenames now use consistent formatting with underscores between words."
echo "Note: Duplicate file number (91) has been resolved by adding 'a' suffix."