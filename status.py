from datetime import datetime
import sys, os
file_name = str(sys.argv[1])
action = str(sys.argv[2]).strip()
file = []
if action == "READ":
    value = open(file_name, 'r')
    valueToCheck = str(sys.argv[3])
    for line in value:
        if valueToCheck in line.strip():
            print (line.split(",")[1])
            value.close()
            sys.exit(0)
if action == "CHANGE":
    value = open(file_name, 'r')
    search_char = str(sys.argv[3])
    from_value = str(sys.argv[4])
    to_value = str(sys.argv[5])
    for line in value:
        if search_char in line.strip():
            line = line.replace(from_value, to_value)
            file.append(line)
        else:
            file.append(line)
    value.close()
    if len(file)>0:
        os.rename(file_name,file_name+datetime.now().strftime("%d%m%Y_%H%M%S"))
        value = open(file_name, 'w')
        for line in file:
            print(line)
            value.write(line)
        value.close()
if action == "GET_PROJECT":
    value = open(file_name, 'r')
    valueToCheck = str(sys.argv[3])
    for line in value:
        if valueToCheck in line.strip():
            print (line.split(",")[4])
            value.close()
            sys.exit(0)

        
                
            
    

