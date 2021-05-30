from datetime import datetime
import sys, os, path, glob
class blog:
    """
    This class creates a basic singluar blog post given a path. 
    If no path is given it can make a new blog post.

    This is no finished...

    All blogs would be created to be held in the blogs folder of TheMorningAfter Repository
    """ 
    #This creates a new blog post from scratch (prompts the user for information)
    def __init__(self):
        self.time = datetime.now()
        self.title = self.getTitle()
        self.author  = "Dean Cochran"
        self.subject  = self.getSubject()
        self.createPost()

        #returns users title entry
    def getTitle(self):
        title = input("Enter your title: ")
        while len(title)>75:
            title = input("Re-Enter title (75 letter cap): ")
        return title

        #returns users first name entry
    def getName(self):
        name = input("Enter your Name: ")
        while len(name)>25:
            name = input("Re-Enter Name (25 letter cap): ")
        return name.strip().replace(" ", "_")

        #returns users subject entrys
    def getSubject(self):
        done=False
        subject_array=[]
        subject = input("Enter your subject: ").strip()
        return subject

    def createPost(self):
        foldername=str(datetime.today().month)+"_"+str(datetime.today().year)
        script_dir = os.path.dirname(__file__)
        print(script_dir)
        self.path = script_dir + "/blogs"
        if not os.path.isdir(self.path + "/" + foldername ):
            os.chdir(self.path)
            os.mkdir("./" + foldername)
            os.chdir(self.path+"/"+foldername)
            filetitle=self.title.lower().strip().replace(" ", "_")
            f=open(filetitle+'.html', 'w')
            self.addTemplate(f)
            
        else:
            os.chdir(self.path+"/"+foldername)
            filetitle=self.title.lower().strip().replace(" ", "_")
            f=open(filetitle+'.html', 'w')
            self.addTemplate(f)

    def addTemplate(self,f):
        f.write('<!-- ' + str(self.time) + ", \n")
        f.write(self.title + ", \n")
        f.write( self.author + ", \n")
        f.write(self.subject + "--> \n")
        f.write("<!DOCTYPE html> \n <html> \n <head> \n <link rel='stylesheet' href='../myblogstyle.css'> \n </head> \n <body> \n <h1>"+ self.title +"</h1> \n <p> Hello World!</p> </body> \n </html>")
        f.close()




    
        
        
