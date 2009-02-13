@echo off
rem = """-*-Python-*- script
rem -------------------- DOS section --------------------
rem You could set PYTHONPATH or TK environment variables here
SET PYTHONPATH=%PYTHONPATH%;C:\Program Files (x86)\Google\google_appengine\;C:\Users\Alex\Projects\muspy.com\trunk\src
python -x %~f0 %*
goto exit
 
"""
# -------------------- Python section --------------------
import sys
from pylint import lint
lint.Run(sys.argv[1:])
 

DosExitLabel = """
:exit
rem """


