.PHONY: fmt install-fmt

install-fmt:
	@brew install clang-format || sudo pacman -S clang-format || sudo apt-get install clang-format || sudo dnf install clang-format

fmt: # format all proto files
	@for file in $$(find . -type f -name "*.proto"); do clang-format -style="{BasedOnStyle: Google, IndentWidth: 2}" -i $$file; done

lint: # proto linter
	docker run --rm -v `pwd`:/workspace --workdir /workspace bufbuild/buf lint --path arthben/things_todo/v1/service.proto
