# Qt Cloud Services Buildpack for Qt

This is a Qt Cloud Services buildpack for Qt apps. It uses `qmake` for configure phase and `make` to compile actual binary.

It's possible to pass custom `qmake` arguments by setting `QMAKE_ARGS` environment variable.

## Development

### How to build Qt binary

```
docker build -t qtc-buildpack-qt .
docker run -i --rm -v `pwd`/build:/build qtc-buildpack-qt 5.4 1
```
