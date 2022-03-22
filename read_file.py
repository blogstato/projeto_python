#!/usr/bin/python
import cgi, os
import cgitb; cgitb.enable()
#import read_file
#cgitb.enable(display=0, logdir=OUTDIR)

#form = cgi.FieldStorage()
def read(arquivo):
   message="oi"
   path='/tmp/' + arquivo
   with open(path) as f:
      line = f.readline()
      while line:
         line = f.readline()
         print("""\
         <p>%s</p>
""" % (line,))
   print("""\
   <p>%s</p>
""" % (path,))

#def lerarquivo():

#def lerarquivo(filename):
  # path=/tmp/filename
   #print(path)
