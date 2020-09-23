# Sample Code for Minimalist REST Framework

Before running the sample, you would have to code-gen from ```user.proto``` first.

```shell
protoc --go_out=. user.proto
```

To run the REST user service:

```shell
go run .
```

To play with curl, you can try requests like this:

```shell
curl http://127.0.0.1:8080/user/alice
```

And you can also take a look at ```user_test.go``` or just run it:

```shell
go test
```
