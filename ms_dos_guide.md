# MS DOS プロンプト ガイド

## MS DOS プロンプトの基本

- Tab で入力補完できる
- コマンドの大文字と小文字は区別されない
- パスの大文字と小文字も区別されない
- たとえば下記が同じ結果になる
    - `type bar¥hoge.txt`
    - `TYPE BAR¥HOGE.TXT`
    - `Type bar¥HOGE.txt`

## 基本の DOS コマンド

| 操作                                                  | DOS コマンド            | Linux コマンド |
|:------------------------------------------------------|:------------------------|:------------|
| カレントディレクトリの内容を確認する                  | `dir`                   | `ls -l`|
| カレントディレクトリのパスを出力する                  | `cd`                    | `pwd`  |
| ディレクトリ fuga を作る                              | `mkdir fuga`            | (同左) |
| ディレクトリ fuga に移動する                          | `cd fuga`               | (同左) |
| 一つ上のディレクトリに移動する                        | `cd ..`                 | (同左) |
| "hoge¥n" を hoge.txt というファイルに出力する         | `echo hoge > hoge.txt`  | (同左) |
| "hoge¥n" を hoge.txt というファイルに追加書き込みする | `echo hoge >> hoge.txt` | (同左) |
| ファイル hoge.txt の内容を出力する                    | `type hoge.txt`         | `cat hoge.txt`|
| ファイル hoge.txt を削除する                          | `del hoge.txt`          | `rm hoge.txt` |
