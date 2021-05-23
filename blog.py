import datetime
class Person:
    """
    This class creates a basic singluar blog post given a path. 
    If no path is given it can make a new blog post.

    This is no finished...

    All blogs would be created to be held in the blogs folder of TheMorningAfter Repository
    """ 
    #This creates a new blog post from scratch (prompts the user for information)
    def __init__(self):
        self.time = datetime.datetime.now()
        self.title = self.getTitle()
        self.author  = self.getAuthor(self)
        self.subjects  = self.getSubjects()

        #returns users title entry
    def getTitle(self):
        title = input("Enter your title: ")
        while len(title)>75:
            title = input("Re-Enter title (75 letter cap): ")
        return title

        #returns users full name
    def getAuthor(self):
        auth = self.getFirstName() + self.getLastName()
        return auth

        #returns users first name entry
    def getFirstName():
        name = input("Enter your First-Name: ")
        while len(name)>25:
            name = input("Re-Enter First-Name (25 letter cap): ")
        return name

        #returns users last name entry
    def getLastName():
        name = input("Enter your Last-Name: ")
        while len(name)>25:
            name = input("Re-Enter Last-Name (25 letter cap): ")
        return name

        #returns users subject entrys
    def getSubjecets():
        done=False
        subject_array=[]
        subject= input("Enter your subject: ").strip()
        subject_array.append(subject)
        ans = input("Are you Done? (y/n): ").lower()
        if(ans=="y"):
            done=True
        while done==False:
            subject= input("Enter your subject: ").strip()
        subject_array.append(subject)
        ans = input("Are you Done? (y/n): ").lower()
        if(ans=="y"):
            done=True
        return subject_array


