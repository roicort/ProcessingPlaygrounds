import os 
from tqdm import tqdm


dirpath = "/Users/roicort/Desktop/Evgenia/originals"
files = []

for r, _, f in os.walk(dirpath):
    for file in f:
        if '.svg' in file:
            files.append([os.path.join(r, file),file.replace(".svg","")])
print("")
files.sort()

for file in tqdm(range(len(files))):
    path = files[file][0]
    name = files[file][1]
    cmd = "vpype read "+path+" scale -o 0 0 0.1 0.1 write --page-format 5x5in --center "+dirpath.replace("originals","resized/")+name+"centered.svg"
    os.system(cmd)