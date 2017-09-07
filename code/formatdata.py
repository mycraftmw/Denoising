with open("ABCDE.txt", "r") as f:
    data = f.readlines()
    AT = []
    BT = []
    CT = []
    DT = []
    ET = []

    AS = []
    BS = []
    CS = []
    DS = []
    ES = []

    AP = []
    BP = []
    CP = []
    DP = []
    EP = []

    i = 0

    for grp in range(9):
        print(data[i])
        i += 1
        AT.append(data[i + 1].strip('\n').split(' ')[-1])
        BT.append(data[i + 2].strip('\n').split(' ')[-1])
        CT.append(data[i + 3].strip('\n').split(' ')[-1])
        DT.append(data[i + 4].strip('\n').split(' ')[-1])
        ET.append(data[i + 5].strip('\n').split(' ')[-1])
        i += 12
        AS.append(data[i + 1].strip('\n').split(' ')[-1])
        BS.append(data[i + 2].strip('\n').split(' ')[-1])
        CS.append(data[i + 3].strip('\n').split(' ')[-1])
        DS.append(data[i + 4].strip('\n').split(' ')[-1])
        ES.append(data[i + 5].strip('\n').split(' ')[-1])
        i += 12
        AP.append(data[i + 1].strip('\n').split(' ')[-1])
        BP.append(data[i + 2].strip('\n').split(' ')[-1])
        CP.append(data[i + 3].strip('\n').split(' ')[-1])
        DP.append(data[i + 4].strip('\n').split(' ')[-1])
        EP.append(data[i + 5].strip('\n').split(' ')[-1])
        i += 8
print("SSIM")
print([float(x) for x in AS], ';')
print([float(x) for x in BS], ';')
print([float(x) for x in CS], ';')
print([float(x) for x in DS], ';')
print([float(x) for x in ES], ';')
print("PSNR")
print([float(x) for x in AP], ';')
print([float(x) for x in BP], ';')
print([float(x) for x in CP], ';')
print([float(x) for x in DP], ';')
print([float(x) for x in EP], ';')
print("TIME")
print([float(x) for x in AT], ';')
print([float(x) for x in BT], ';')
print([float(x) for x in CT], ';')
print([float(x) for x in DT], ';')
print([float(x) for x in ET], ';')
