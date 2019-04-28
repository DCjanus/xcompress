all: ./target/release/xcompress

./target/release/xcompress: $(shell find . -type f -iname '*.rs' -o -name 'Cargo.toml' | sed 's/ /\\ /g')
	cargo build --release --target x86_64-unknown-linux-musl
	strip ./target/release/xcompress
	
install:
	$(MAKE)
	sudo cp ./target/release/xcompress /usr/local/bin/xcompress
	sudo chown root. /usr/local/bin/xcompress
	sudo chmod 0755 /usr/local/bin/xcompress

uninstall:
	sudo rm /usr/local/bin/xcompress

test:
	cargo test --verbose

clean:
	cargo clean
