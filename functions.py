def tuplestring(param):
    length=len(param)
    string="("
    for i in range(length-1):
        string+=param[i]+","
    string+=param[-1]+")"
    return string

def perstring(param):
    length=len(param)
    string="("
    for i in range(length-1):
        string+="%s,"
    string+="%s)"
    return string

def updatestring(param):
    length=len(param)
    string=" "
    for i in range(length-1):
        string+=param[i]+"=%s,"
    string+=param[-1]+"=%s "
    return string

def multiselectstring(cols,vals):
    length=len(cols)
    string=" "
    for i in range(length-1):
        string+=cols[i]+"='"+vals[i]+"' AND "
    string+=cols[-1]+"='"+vals[-1]+"' "
    return string

