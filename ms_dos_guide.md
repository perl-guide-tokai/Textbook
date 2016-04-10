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

## 文字コードを指定して動かす

Windows の場合，基本的には文字の種類として `cp932` を使っています．
Perl などプログラミング言語は，`utf8` という文字の種類を使って書きます．

いくつかの追加で記述しなければならないことがあります．

先頭に必要な部分

```{.perl .numberLines}
# ​ここから : Windows で必要な部分
use utf8; # ソースコードの文字列に UTF8 フラグを付ける
use open IO => ":encoding(cp932)"; # 入出力に cp932 変換レイヤーを付ける
use open ":std"; # STDIN, STDOUT, STDERR にも同様にする
use Encode ("encode", "decode");
​
my $enc = "cp932";
sub d($) { decode($enc, $_[0]) } # encode された文字列を UTF8フラグを付ける
sub e($) { encode($enc, $_[0]) } # UTF8フラグ付き文字列を指定した encode する
# ここまで​ : Windows で必要な部分
```

パス名の指定に必要な部分 => `e($filename)`

```{.perl .numberLines}
open(my $rfh, "<", e($filename)) or die; # cp932 のファイル名でオープン
```

サンプルプログラム

```{.perl .numberLines}
#!/usr/bin/env perl
​
use strict;
use warnings;

# ​ここから : Windows で必要な部分
use utf8; # ソースコードの文字列に UTF8 フラグを付ける
use open IO => ":encoding(cp932)"; # 入出力に cp932 変換レイヤーを付ける
use open ":std"; # STDIN, STDOUT, STDERR にも同様にする
use Encode ("encode", "decode");
​
my $enc = "cp932";
sub d($) { decode($enc, $_[0]) } # encode された文字列を UTF8フラグを付ける
sub e($) { encode($enc, $_[0]) } # UTF8フラグ付き文字列を指定した encode する
# ここまで​ : Windows で必要な部分

# ーーーーここまで定型ーーーー
​
print("これは表です\n"); # UTF8フラグ付き文字列が cp932 でSTDOUT に出力される
​
my $filename = "表.txt"; # UTF8フラグ付き文字列のファイル名で，
open(my $wfh, ">", e($filename)) or die; # cp932 のファイル名でオープン
print($wfh "表的な文字列を入れときます\n"); # UTF8フラグ付き文字列を cp932 で出力
close($wfh) or die;
​
open(my $rfh, "<", e($filename)) or die; # cp932 のファイル名でオープン
my $line = join("", <$rfh>); # cp932 の内容から UTF8フラグ付き文字列を取得
close($rfh) or die;
​
print($line);
```
