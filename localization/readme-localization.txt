Edit corresponding csv file with notepad or notepad++, save as UTF-8 encoded text.

Mail the result to me: stifu@codecreator.net.

If there's no localization file for your language, create it from en.csv file and don't forget to edit the language code in the first line.

If you want to encode localization file yourself, you need W3 strings encoder.

Here's an encoding example:
w3strings.exe --encode en.csv --id-space 7591

If you have w3strings.exe in your PATH variable, you can also create a batch with the following contents to convert all strings.

encodestrings.bat
    :: NOTE: w3strings.exe must be in the PATH variable
    
    for /f "delims=|" %%f in ('dir /b *.csv') do (
      echo %%f
      w3strings.exe --encode %%f --id-space 7591
      move %%f.w3strings ../content/%%~nf.w3strings
      del %%f.w3strings.ws
    )
    
    Pause
