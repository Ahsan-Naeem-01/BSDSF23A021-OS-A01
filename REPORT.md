Q1. Explain the linking rule in this part's Makefile: $(TARGET): $(OBJECTS). How does it differ from a Makefile rule that links against a library?

Ans) In the Makefile, the rule $(TARGET): $(OBJECTS) means that the final program (the target) depends on all the object files that were created from the source files. When this rule runs, the compiler links all the object files together into one executable. This works because each .o file contains compiled code for one part of the program, and combining them produces the final binary. 
The difference compared to linking against a library is that here we are directly joining all the object files every time. If we used a library instead, the library would already hold the precompiled object code, and we would just tell the compiler to link against it using flags like -L (library path) and -l (library name).
In short, linking object files is more manual, while linking against a library is cleaner and reusable.

Q2. What is a git tag and why is it useful in a project? What is the difference between a simple tag and an annotated tag?

Ans) A Git tag is like a permanent label that you attach to a specific commit in your project’s history. It is very useful because it marks important points in time, such as a stable release, so you can easily come back to it later. Without tags, you would have to remember long commit hashes, which is not practical. 
There are two types of tags in Git: 
1) Simple (lightweight) 
2) Annotated. 
A simple tag is just a name that points to a commit, kind of like a bookmark. 
An annotated tag, on the other hand, is more powerful—it stores extra information like the tagger’s name, the date, and a message describing the version. 
Annotated tags are preferred for real project releases because they carry useful details, while simple tags are mainly for quick, personal references.

Q3. What is the purpose of creating a "Release" on GitHub? What is the significance of attaching binaries (like your client executable) to it?

Ans) Creating a release on GitHub is a way to share an official version of your project. It makes it clear which commit or tag represents a stable build, and you can add notes about what changed in that version. This is especially useful for organizing your project’s progress and for letting other people know which version they should use. Attaching binaries, such as the client executable, is important because it saves other users from having to compile your code themselves. Instead, they can just download the ready-to-use program and run it right away. This makes your project much more accessible, especially for people who might not be comfortable setting up a build environment.


