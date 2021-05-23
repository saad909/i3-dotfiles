import os,re

file_content = ""
dir_path = os.path.join("/home/saad", "Documents",
                        "Experiments")
file_path = os.path.join(dir_path, "SessionList.txt")
# my imports
global g_objNewTab

def GetTabByName(strName):
    # Iterate over all existing tabs, looking for one named the same as
    # what was passed in as arg strName
    for nTabIndex in range(1, crt.GetTabCount() + 1):
        objTab = crt.GetTab(nTabIndex)
        if objTab.Caption == strName:
            return objTab

    # Default to returning nothing if we never find a tab by the given name
    return None

def send_to_all(sessionsArray):
    command_file_path = os.path.join(dir_path, "all.ini")
    for session in sessionsArray:
        objTab = GetTabByName(session)
        if objTab == None:
            crt.Dialog.MessageBox("Tab '{0}' was not found.".format(session))
        else:
            objTab.Activate()
            # main code
            global dir_path
            crt.Screen.Synchronous = False
            # regex = r"\n\s*\n"
            for line in open(command_file_path, "r"):
                objTab.Screen.Send(line + '\r')
            # crt.Session.Disconnect()

def Main():
    errorMessages = ""

    sessionsFileName = os.path.expanduser(file_path)
    if not os.path.exists(sessionsFileName):
        crt.Dialog.MessageBox(
            "Session list file not found:\n\n" +
            sessionsFileName + "\n\n" +
            "Create a session list file as described in the description of " +
            "this script code and then run the script again.")
        return

    sessionFile = open(sessionsFileName, "r")
    sessionsArray = []

    for line in sessionFile:
        session = line.strip()
        if session:  # Don't add empty lines/sessions
            sessionsArray.append(session)
    sessionFile.close()

    for session in sessionsArray:
        if session == "all":
            send_to_all(sessionsArray)
            return
        # try:
        #     crt.Session.Connect("/S \"" + session + "\"")
        # except Exception as error:
        #     # error = crt.GetLastErrorMessage()
        #     crt.Dialog.MessageBox(str( error ))
        #     continue



        # crt.Dialog.MessageBox("Device is {}".format(session))
        objTab = GetTabByName(session)
        if objTab == None:
            crt.Dialog.MessageBox("Tab '{0}' was not found.".format(
                session))
        else:
            objTab.Activate()
            # main code
            global dir_path
            crt.Screen.Synchronous = False
            command_file_path = os.path.join(dir_path, session + ".ini")
            # regex = r"\n\s*\n"
            blank = ''
            for line in open(command_file_path, "r"):
                if line is blank:
                    continue
                else:
                    objTab.Screen.Send(line + '\r')
            # crt.Session.Disconnect()



    if errorMessages == "":
        crt.Dialog.MessageBox("Tasks completed.  No Errors were detected.")


Main()
