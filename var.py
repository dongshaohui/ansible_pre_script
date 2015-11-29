import sys
import json

with open('var.json') as data_file:
    var_json = json.load(data_file)

with open('share.json') as data_file:
    share_json = json.load(data_file)

sys.stdout.write(json.dumps(dict((var_json[sys.argv[1]].items() + share_json.items()))))