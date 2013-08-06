OPTS= test_input.rs -L $(RUST)/x86_64-unknown-linux-gnu/stage2/lib

test1 : rustfind
	@if [ ! $(RUST) ] ; then echo "set RUST to point to root of rust sourcetree" ; fi
	echo $(RUST)

	./rustfind  -d $(OPTS)
#default behaviour, dump json map of spans..
test2: rustfind
	./rustfind -j $(OPTS)
int: rustfind
	./rustfind -i $(OPTS)

rustfind: rustfind.rs find_ast_node.rs astdump.rs text_formatting.rs rust2html.rs
	rustc rustfind.rs


