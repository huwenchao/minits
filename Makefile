brainfuck: brainfuck.ll
	clang brainfuck.ll -o brainfuck

brainfuck.ll: examples/brainfuck_class/brainfuck.ts
	node build/main/index.js build examples/brainfuck_class/brainfuck.ts -o brainfuck.ll

run: brainfuck
	# ./brainfuck "++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>."
	./brainfuck ">++++[<++++++++>-]>++++++++[>++++<-]>>++>>>+>>>+<<<<<<<<<<[-[->+<]>[-<+>>>.<<]>>>[[->++++++++[>++++<-]>.<<[->+<]+>[->++++++++++<<+>]>.[-]>]]+<<<[-[->+<]+>[-<+>>>-[->+<]++>[-<->]<<<]<<<<]++++++++++.+++.[-]<]+++++"

test: examples/brainfuck_class/test.ts
	ts-node examples/brainfuck_class/test.ts

multi: examples/multi/main.ts examples/multi/lib.ts
	node build/main/index.js build examples/multi/main.ts -o multi.ll
	clang multi.ll -o multi
	./multi

class: examples/class.ts
	node build/main/index.js build examples/class.ts -o class.ll
	clang class.ll -o class
	./class


clean:
	rm *.ll
	rm brainfuck
	rm multi