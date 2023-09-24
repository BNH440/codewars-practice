Welcome to CodeWars 2023!

This ZIP file includes:

- README.txt:
    This file.

- codewars-*-problems-*.pdf:
    Instruction sheet and Problem Statements

- student_datasets:
    Directory with test data for every problem.
    Use each input to test your program, and compare with each expected output.

- checkProb.bat:
    A Windows batch file like the one the Judges will use to test your programs.

    HOW TO USE:
        1. EDIT THE FILE to set your JDK and/or PYTHON paths.
            - You need JDKPATH if you are using Java.
            - You need PY3PATH if you are using Python 3.

        2. COPY only one program "probXX.zzz" into the directory.  (For example, "prob10.py")

        3. Open a Command Window  (Start Menu: "Command Prompt")
            - CD to your working directory.

        4. Type "checkProb" to test your program against all probXX datasets in the student_datasets directory.
            - Use "checkProb showin" to also show the test input during the run

    NOTE:  Using checkProb.bat is OPTIONAL.
        We provide it as an example of how we will be testing your programs.
        You do not need it.  But you must test your program against ALL input files.
        The Judges will test against modified input files, and your programs
        must correctly solve all of them to pass.
        See an explanation of how to test on the Instruction Sheet in the PDF file.

- checkProb.py:
    A python script similar to the Windows batch file to test your programs.

    NOTEs:
        1. This is a *BETA* version which _should_ work on Windows, Linux, and macOS.
        2. It REQUIRES python3 to run.

    HOW TO USE:
        1. EDIT THE FILE to set your JDK and/or PYTHON paths.
            - You need JDK_PATH if you are using Java.
            - You need PY3_PATH if you are using Python 3.
            - Use the empty string ("") if you are not using that language.

        2. COPY only one program "probXX.zzz" into the directory.  (For example, "prob10.py")

        3. Open a Command or Terminal Window
            - CD to your working directory.

        4. Type "python checkProb.py" to test your program against all probXX datasets in the student_datasets directory.
            - Use "python checkProb.py --show-input" to also show the test input during the run

    NOTE:  Using checkProb.py is OPTIONAL.
        We provide it as an example of how we will be testing your programs.
        You do not need it.  But you must test your program against ALL input files.
        The Judges will test against modified input files, and your programs
        must correctly solve all of them to pass.
        See an explanation of how to test on the Instruction Sheet in the PDF file.
