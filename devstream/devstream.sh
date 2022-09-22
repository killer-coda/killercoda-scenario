### https://docs.devstream.io/en/latest/quickstart/

sh -c "$(curl -fsSL https://raw.githubusercontent.com/devstream-io/devstream/main/hack/quick-start/quickstart.sh)"

./dtm init -f quickstart.yaml

./dtm apply -f quickstart.yaml

./dtm delete -f quickstart.yaml
