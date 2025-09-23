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
An annotated tag, on the other hand, is more powerful because it stores extra information like the tagger’s name, the date, and a message describing the version.  
Annotated tags are preferred for real project releases because they carry useful details, while simple tags are mainly for quick, personal references.

Q3. What is the purpose of creating a "Release" on GitHub? What is the significance of attaching binaries (like your client executable) to it?

Ans) Creating a release on GitHub is a way to share an official version of your project. It makes it clear which commit or tag represents a stable build, and you can add notes about what changed in that version. This is especially useful for organizing your project’s progress and for letting other people know which version they should use.  
Attaching binaries, such as the client executable, is important because it saves other users from having to compile your code themselves. Instead, they can just download the ready-to-use program and run it right away. This makes your project much more accessible, especially for people who might not be comfortable setting up a build environment.

Q4. Compare the Makefile from Part 2 and Part 3. What are the key differences in the variables and rules that enable the creation of a static library?

Ans) In Part 2, the Makefile was designed to directly compile all the source files into object files and then link them together in a single step to produce the executable. The final binary depended on all the .o files, and the linking process did not involve any intermediate library. In Part 3, the process is refactored to first bundle the utility object files into a static library named libmyutils.a. This was done using a dedicated target in the Makefile that uses the ar rcs command. The executable is then built by linking only main.o against the static library using -L to specify the library path and -lmyutils to specify the library name. The key difference is that Part 2 links objects directly, while Part 3 builds and uses a reusable library.

Q5. What is the purpose of the ar command? Why is ranlib often used immediately after it?

Ans) The ar command is used to create and manage static library files in C projects. It takes a collection of object files and archives them into a single .a file, which can then be linked into programs. This makes it easy to reuse common code without recompiling it every time. However, just creating the archive is not enough for some systems because the linker also needs an index of the functions and symbols inside the library. That’s where ranlib comes in. ranlib generates or updates this index, making it faster and easier for the linker to find the right functions inside the library. In practice, you often see both commands together: first ar to create the archive, then ranlib to make it ready for linking.

Q6) When you run nm on your client_static executable, are the symbols for functions like mystrlen present? What does this tell you about how static linking works?

Ans) Yes, when you run the nm tool on the client_static executable, you will see the symbols for functions like mystrlen directly inside the executable. This happens because static linking copies the actual code for these functions from the static library into your final binary at compile time. In other words, the program contains its own private copy of every library function it uses. This explains why statically linked executables are usually larger in size because they carry the full code from the library inside them. It also shows that once a program is statically linked, it no longer depends on the external .a library file to run, because everything it needs has already been embedded into the executable.


Q7) What is Position-Independent Code (-fPIC) and why is it a fundamental requirement for creating shared libraries?

Ans) Position-Independent Code (-fPIC) means the generated machine code does not assume a fixed memory address for its instructions or data. Instead, it can be loaded anywhere in memory without modification. This is essential for shared libraries because the dynamic loader may place them at different addresses in different processes. Without -fPIC, the library code would need relocation each time it is loaded, which would defeat the purpose of sharing one memory copy among multiple processes.

Q8) Explain the difference in file size between your static and dynamic clients. Why does this difference exist?

Ans) The statically linked client embeds all the library code directly into its executable, which makes it larger in size. The dynamically linked client only contains references to the external shared library and relies on the loader to bring in the actual function code at runtime. As a result, the dynamic client is much smaller because it does not duplicate the library code.

Q9) What is the LD_LIBRARY_PATH environment variable? Why was it necessary to set it for your program to run, and what does this tell you about the responsibilities of the operating system's dynamic loader?

Ans) LD_LIBRARY_PATH is an environment variable that specifies additional directories where the dynamic loader should search for shared libraries at runtime. By default, the loader only searches standard system library directories like /lib and /usr/lib. Since libmyutils.so was created in a custom lib/ folder, it was necessary to set LD_LIBRARY_PATH to include that directory. This shows that the dynamic loader is responsible for resolving all library dependencies before the program starts, and it requires either system-wide installation of the library or explicit instructions on where to find it.
