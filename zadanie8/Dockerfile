FROM haskell:9.6.7-slim

COPY . .

RUN cabal update && cabal install && cabal build

EXPOSE 3000

ENTRYPOINT [ "cabal", "run" ]