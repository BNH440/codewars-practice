@echo off
REM ***********************************************************************
REM
REM   CODEWARS
REM
REM   Judging Batch File
REM
REM   NOTES:
REM
REM *  IMPORTANT: Check path to Java JDK environment and Python
REM        set JDKPATH below
REM        set PY3PATH
REM *  Expects data in local student_datasets subdirectory
REM *  Will work up with problems 0-30
REM     *  Will work with .java, .js, .py, .py2, .py3, .c, .cpp file types
REM
REM ***********************************************************************


REM
REM  These are paths to the language interpreters / SDK
REM
SET JDKPATH="C:\Program Files\Java\jdk-17.0.2\bin"
SET PY3PATH="C:\Python310"

SET SHOWIN=0

REM
REM Analyze optional parameters
REM
IF "%1"=="" GOTO START_JUDGE
IF /I "%1"=="SHOWIN" SET SHOWIN=1
IF %SHOWIN%==1 GOTO START_JUDGE
REM For any other parameter, show the Help Screen
GOTO HELP

:START_JUDGE
REM
REM Determine problem number from files in current directory
REM

Set num=99
Set pass=1
if EXIST prob00*.* SET num=00
if EXIST prob01*.* SET num=01
if EXIST prob02*.* SET num=02
if EXIST prob03*.* SET num=03
if EXIST prob04*.* SET num=04
if EXIST prob05*.* SET num=05
if EXIST prob06*.* SET num=06
if EXIST prob07*.* SET num=07
if EXIST prob08*.* SET num=08
if EXIST prob09*.* SET num=09
if EXIST prob10*.* SET num=10
if EXIST prob11*.* SET num=11
if EXIST prob12*.* SET num=12
if EXIST prob13*.* SET num=13
if EXIST prob14*.* SET num=14
if EXIST prob15*.* SET num=15
if EXIST prob16*.* SET num=16
if EXIST prob17*.* SET num=17
if EXIST prob18*.* SET num=18
if EXIST prob19*.* SET num=19
if EXIST prob20*.* SET num=20
if EXIST prob21*.* SET num=21
if EXIST prob22*.* SET num=22
if EXIST prob23*.* SET num=23
if EXIST prob24*.* SET num=24
if EXIST prob25*.* SET num=25
if EXIST prob26*.* SET num=26
if EXIST prob27*.* SET num=27
if EXIST prob28*.* SET num=28
if EXIST prob29*.* SET num=29
if EXIST prob30*.* SET num=30
if EXIST prob31*.* SET num=31

if %num%==99 GOTO HELP

REM
REM Set the name of the datafile
SET DATAFILE=student_datasets\prob%num%-

GOTO COPY

:HELP
echo.
echo    CodeWars Judging Batch file
echo    ---------------------------
echo.
echo     Usage:  checkProb [SHOWIN]
echo             File probXX.* must exist in the current directory.
echo             Only one file probXX.* may exist.
echo.
echo       The problem number (00-30) is determined from probXX.* filename
echo       SHOWIN: Show the input file
echo.
GOTO ENDJUDGE


:COPY
echo -------------------------------------------------------------------------------
echo     ************ CODEWARS Judging : Problem #%num% ****************
echo -------------------------------------------------------------------------------
echo.

if EXIST prob%num%.java GOTO JAVA
if EXIST prob%num%.c GOTO CFILE
if EXIST prob%num%.cpp GOTO CPPFILE
if EXIST prob%num%.py GOTO JUDGE

ECHO **** ERROR:  No Valid submission file format found for Problem #%num%
GOTO DONE


:JAVA
REM     Compile the java program from source code
echo Compiling Class file from Java Source  ...
echo.
%JDKPATH%\javac prob%num%.java
if EXIST prob%num%.class GOTO JUDGE
echo
echo ******* ERROR:  .java source did not compile for prob%num%     ********
echo *******  Does JDKPATH point to your JDK directory?             ********
echo *******  Does your main class match your filename: prob%num% ? ********
GOTO DONE

:CFILE
REM     Compile the C program from source code, with math library (-lm)
echo Compiling C file from Source  ...
gcc -o prob%num%.exe prob%num%.c -lm
if EXIST prob%num%.exe GOTO JUDGE
echo
echo ******* ERROR:  .c source did not compile for prob%num% ********
echo *******  Is gcc installed and in your path?             ********
GOTO DONE

:CPPFILE
REM     Compile the C++ program from source code, with math library (-lm)
echo Compiling C++ file from Source  ...
g++ -o prob%num%.exe prob%num%.cpp -lm
if EXIST prob%num%.exe GOTO JUDGE
echo
echo ******* ERROR:  .cpp source did not compile for prob%num% ********
echo *******  Is g++ installed and in your path?             ********
GOTO DONE


:JUDGE
cls

echo Input data filename is %DATAFILE%%pass%-in.txt
copy %DATAFILE%%pass%-in.txt input.txt > NUL
if %SHOWIN%==1 type input.txt

echo.
echo -------------------------------------------------------------------------------
echo -- Problem #%num%, pass #%pass% .  Program output begins ----------------------
echo -------------------------------------------------------------------------------
echo.

if EXIST prob%num%.class %JDKPATH%\java -cp . prob%num% < input.txt
if EXIST prob%num%.py %PY3PATH%\python prob%num%.py < input.txt
if EXIST prob%num%.exe prob%num% < input.txt

echo.
echo -------------------------------------------------------------------------------
echo -- Compare to EXPECTED Output Below -------------------------------------------
echo -------------------------------------------------------------------------------
echo.
type %DATAFILE%%pass%-out.txt
echo.

REM
REM     Perform test with next dataset (if it exists)
REM

if %pass% == 9 SET pass=99
if %pass% == 8 SET pass=9
if %pass% == 7 SET pass=8
if %pass% == 6 SET pass=7
if %pass% == 5 SET pass=6
if %pass% == 4 SET pass=5
if %pass% == 3 SET pass=4
if %pass% == 2 SET pass=3
if %pass% == 1 SET pass=2

if NOT EXIST %DATAFILE%%pass%-in.txt GOTO DONE

echo.
echo ------------------ Press Any key to Run next dataset ------------------------
echo.
pause
GOTO JUDGE


:DONE

echo.
echo -------------------------------------------------------------------------------
echo -- JUDGING COMPLETE -----------------------------------------------------------
echo -------------------------------------------------------------------------------
echo.
pause
echo -------------------------------------------------------------------------------
echo -- Removing temporary files   -------------------------------------------------
echo -------------------------------------------------------------------------------
if EXIST *.class del *.class > NUL
if EXIST input.txt del input.txt > NUL

:ENDJUDGE
