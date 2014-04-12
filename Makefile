all: mmap_allocator_test memory_map_test

memory_map_test: memory_map_test.o
	clang++ -std=c++11 memory_map_test.o -lgtest -lgtest_main -pthread -o memory_map_test

memory_map_test.o: memory_map_test.cc
	clang++ -std=c++11 -c memory_map_test.cc

mmap_allocator_test: mmap_allocator_test.o
	clang++ -std=c++11 mmap_allocator_test.o -lgtest -lgtest_main -pthread -o mmap_allocator_test

mmap_allocator_test.o: mmap_allocator_test.cc mmap_allocator.h
	clang++ -std=c++11 -c mmap_allocator_test.cc

server.o: server.cc
	clang++ -std=c++11 -stdlib=libc++ -c server.cc server.h

main.o: main.cc
	clang++ -std=c++11 -stdlib=libc++ -c main.cc

server: server.o main.o
	clang++ -std=c++11 server.o main.o -o server

clean:
	-rm *.o
