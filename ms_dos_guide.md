# MS DOS プロンプト ガイド

主に Linux ユーザーのための DOS ガイド.

## MS DOS プロンプトの基本

- Tab で入力補完できる
- コマンドの大文字と小文字は区別されない
- パスの大文字と小文字も区別されない
- たとえば下記が同じ結果になる
    - `type bar¥hoge.txt`
    - `TYPE BAR¥HOGE.TXT`
    - `Type bar¥HOGE.txt`

## 基本の DOS コマンド

| Linux コマンド | DOS コマンド | 意味  |
|:-----------|:------------|:------------|
| `ls -l` | `dir` | カレントディレクトリの内容を確認する |
| `pwd` | `cd` | カレントディレクトリのパスを出力する |
| `mkdir fuga` | (同左) | ディレクトリ fuga を作る |
| `cd fuga` | (同左) | ディレクトリ fuga に移動する |
| `cd ..` | (同左) | 一つ上のディレクトリに移動する |
| `echo hoge > hoge.txt` | (同左) | "hoge¥n" を hoge.txt というファイルに出力する |
| `echo hoge >> hoge.txt` | (同左) | "hoge¥n" を hoge.txt というファイルに追加書き込みする |
| `cat hoge.txt` | `type hoge.txt` | ファイル hoge.txt の内容を出力する |
| `rm hoge.txt` | `del hoge.txt` | ファイル hoge.txt を削除する |
