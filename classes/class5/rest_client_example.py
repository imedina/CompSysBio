#!/usr/bin/python

import urllib2
import json
import zlib


url = 'http://ws.bioinfo.cipf.es/cellbase/rest/v2/hsa/genomic/variant/13:32889669:T/consequence_type?of=json'
req = urllib2.Request(url)
req.add_header("Accept-Encoding", "gzip")

response = urllib2.urlopen(req)
json_data = response.read()

data = zlib.decompress(json_data, 16+zlib.MAX_WBITS)
data = json.loads(data)

#print json_data
#print data[1]["featureId"]
print data

