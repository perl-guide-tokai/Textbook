% Perl によるプログラミング入門 in 東海
% 第二回 - プログラムの構造化
% 2016/03/27 第一版

---

# はじめに

## お久しぶり

お久しぶりです．前回のテキストを読んでもらったのかもしれません．
読んでもらっていないかもしれません．
このテキストは，前回のテキストを読んだ人向けに書いています．
題材が同じなので，もし前回のテキストをまだ読んでいなければ，
参照しながら見るとやりやすいと思います．

前回は，プログラムを勉強し始めた人向けの内容を目指しました．
今回は，プログラムは一通り書けるけど，その次の段階の人向けです．
やっつけ仕事より，もう少し長く使うプログラムを書くことを想定しています．
まったくの初心者ではないけど，まだなんとなく書いている人，
プログラミングの基礎を一緒に学びましょう．

プログラミングの世界へようこそ．サポータはあなたを手助けをします．
このテキストは，一人でも読めるように考えて書きますが，
必要であれば，誰かに助けを求めてください．ここに居るならサポータが．
一人で読んでいるなら，インターネットの誰かが助けてくれるでしょう．

---

# おさらい

## TODO リスト

前回は TODO リストを作りました．
作ったTODO リストいくつか機能がありました．一覧にします．

* TODO リストを保存するファイルを初期化できる
* TODO リストを追加する
* TODO リストの TODO を全部表示する
* TODO リストの TODO を完了にする
* TODO リストのうち未完了な TODO だけを表示する

## できるようになったこと

プログラミングのやり方をいくつか学びました．

* 準備
    * プログラムファイルをテキストファイルで編集する
    * プログラムファイルをコンソールで実行する
* Perl
    * 意図
        * `#` から行末までは，コメントとなり，読む人に意味を伝える
        * 空行は，意味のかたまりを分割するために入れる
    * 単一の値，スカラ
        * 文字列，数値，`undef`，ファイルハンドル がある
        * 真偽値(ブーリアン) としても使われる
            * 偽: `""`, `"0"`, `0`, `undef`
            * 真: それ以外
        * スカラ変数は，`$` が先頭
    * 複数のスカラ値を持つ，リスト
        * スカラを複数をひとまとめにする
        * リスト変数は，`@` が先頭
        * `[]` と添字(数字)で個別のスカラ値を参照できる．
        * スカラ変数のように扱うには，`$` + 変数名 + `[` + 添字 + `]`
        * 添字は，`0` から始まる
    * 変数
        * 値に別名をつける機能
        * 代入 `=`(イコール) によって，変数と値をひもづける
        * 最初に使うときに `my` をつける
    * 演算子
        * 1つ以上のスカラ値をスカラ値，又はリスト値に変換する
        * スカラでも特にブーリアンを入力，出力に持つ演算子もある
        * 引数の位置で呼び出し方は色々
            * ブーリアン → ブーリアン: `not` + 引数
            * 数値，数値 → 数値: 引数1 + `+` + 引数2
            * ファイルハンドル → 文字列 or 文字列のリスト: `<` + 引数 + `>`
    * 関数
        * 0個以上の引数与えて，何か処理をさせる．返り値がある．
        * 関数名 + `(` + 引数1 + `,` + 引数2 + ... + `)`
        * `print()`
            * 引数をファイルハンドルに出力する．ファイルハンドルを指定
              しなければコンソールに出力する
        * `open()` / `close()
            * ファイルにひもづけられたファイルハンドルを作ったり，破棄したりする
        * `chomp()`
            * 文字列の最後の改行文字を削除する
            * 値を返すというよりは，指定された変数の文字列そのものを変更する
        * `push()`
            * 指定されたリスト変数の末尾に要素を追加する
        * `split()`
            * 文字列を分解したリストを返す
    * 制御構造
        * `if` で，処理するかしないかを制御できる
            * `if (A) {B}` の形式で使う．A はブーリアン．B は0 個以上の式．
        * `while` で処理を繰り返すことができる
            * `while (A) {B}` の形式で使う．A はブーリアン．B は0個以上の式．
            * A の結果が変わらないと繰り返しが終わらないので注意
        * `foreach` でも処理を繰り返すことができる
            * `foreach` + 繰り返し変数 + `(` + 繰り返すリスト値 + `) + {B}` の形式で使う
            * リストが最初にあるので，繰り返す回数はリスト値の個数
    * コンテキスト
        * 何が求められているかで，演算子や関数の戻り値が変わる．その求められ方
        * スカラコンテキスト
            * スカラ値を期待されているコンテキスト
            * 例: スカラ変数への代入(`=`)，演算子の引数，`if` などの条件部分，
        * リストコンテキスト
            * リスト値を期待されているコンテキスト
            * 例: リスト変数への代入(`=`)，関数の引数．

---

# 確認するプログラムを書く

前回のテキストをやった人は，結果を目で確認してきたと思います．
プログラムを便利に使う次の一歩として，自分の書いたプログラムの動作を
自分の書いたプログラムで確認できるようにしましょう．

前回のテキストをやっていない人は，01\_hello.pl をコピーして，
実行できるようにしておいてください．

現在のディレクトリに 01\_hello.pl が存在していて，実行可能なことを
確認してから次のステップに進んでください．

## シンプルな例

### 01_hello.t

```{.perl .numberLines}
#!/usr/bin/env perl

use strict;
use warnings;

use Test::More; # is() / done_testing() 関数を使うために必要

# プログラム名の指定
my $program = "./01_hello.pl";

# プログラムの実行，実行結果の取得
my $got = `$program`;

# 実行結果(got)，と 期待する結果(expected) の比較
my $expected = "Hello, World\n";
my $message = "test for stdout";
is($got, $expected, $message);

# テスト実行完了を宣言
done_testing();
```

## 概略説明

`.t` 拡張子(ファイル名の最後の `.` (ドット) 以降の文字列) は，
テスト(test)の頭文字です．
動作確認のことをテストと呼ぶことが多いようです．
拡張子は，`.pl` ではないですが，これも Perl 言語のプログラムファイルです．

`#` の行，`use strict; use warnings;` の行は説明の必要はないでしょう．
必要がある人は，前回のテキストを読んでみてください．

`use Test::More;` は，テストに使う関数を使えるようにしています．
このプログラムでは，`is()` と `done_testing()` という関数を使っています．

`is($got, $expected, $message);` は,
`$got` の中身が `$expected` と等しかったら確認 `ok` としています．
`$message` は，結果を出力するときに，複数テストしたときに
どのテストが `ok` かをわかりやすくするためのメッセージです．

`done_testing()` は，テストの終わりを意味します．

## 実行

細かい説明の前に，実行してみましょう．
このファイルは Perl 言語のプログラムファイルですので，
`perl プログラムファイル` のように実行します．
これも前回にやりました．

結果は，

```{.numberLines}
ok 1 - test for stdout
1..1
```

のようになったと思います．

`ok` は，確認できた．という意味です．`is()` 関数の出力と思うとよいでしょう．
全部が `ok` なので，すべてが問題ない状態です．

例えば，このように書き換えて実行してみましょう．

01\_hello\_ng.t

```{.perl .numberLines}
#!/usr/bin/env perl

use strict;
use warnings;

use Test::More; # is() / done_testing() 関数を使うために必要

# プログラム名の指定
my $program = "./01_hello.pl";

# プログラムの実行，実行結果の取得
my $got = `$program`;

# 実行結果(got)，と 期待する結果(expected) の比較
my $expected = "aaa" . "Hello, World\n";
is($got, $expected, "test for stdout");

# テスト実行完了を宣言
done_testing();
```

結果は，`not ok` を表示して，何やらメッセージが出るようになりました．

```{.numberLines}
not ok 1 - test for stdout
#   Failed test 'test for stdout'
#   at 01_hello_ng.t line 16.
#          got: 'Hello, World
# '
#     expected: 'aaaHello, World
# '
1..1
# Looks like you failed 1 test of 1.
```

これは，実行したプログラムの結果として `Hello, World\n` が得られた(get)けど，
期待していた(expected) のは `aaaHello, World\n` だったよ．
ということを意味します．
結果と期待したものの両方を表示してくれています．

このように，プログラムでプログラムの結果を確認することができます．

これくらい簡単なプログラムなら `ok` / `not ok` を表示させること，と，
自分の目で確認するのとでは，むしろ面倒になっています．
結果が複雑だったり，確認する項目や回数が増えてくると，
テストプログラムで確認した方が楽になります．

## 解説

では，使っている機能の説明をしましょう．

### モジュール / プラグマ

プログラムのパーツを封じ込めたものです．
`perl` に最初から同梱されているものと，
後でインストールするものがあります．
自分で作ることもできます．
`use` でその機能を使う宣言をします．

機能はそれぞれのモジュール毎に異なります．
モジュール名は大抵大文字から始まります(例: `Test::More`)．
`strict`, `warnings` は，プラグマ(pragma) といってモジュールとは異なりますが，
プログラムに機能を追加するという点では同じものです．

### Test::More モジュール

`Test::More` テストを書くための機能を提供するモジュールです．

今回主に使うものは以下の関数です．


`is()` 関数

:   A is B のように，2つのものが等しいことを確認するために使います．

    1番目の引数が，実行結果，

    2番目の引数が，期待した値です．

    3番目の引数が，メッセージです．テスト結果に表示できます．省略可能です．

`done_testing()` 関数

:   テストプログラムファイルの終わりに書きます．
    プログラムが確認したテストの個数を数えるのに使います．

### ``` `` ``` (バッククォート) 演算子

``` `` ``` バッククォート演算子は，`` ` + 文字列 + ` `` の形式で，
文字列部分を実行した結果を返します．

今回は，自分が書いたPerlプログラムを指定していますが，
システムに存在するプログラムを実行することもできます．

* 文字列 → 文字列 又は 文字列のリスト : `` ` + 文字列 + ` ``
    * 結果は実行した結果の標準出力

## 練習問題

1. システムに乗っているプログラムの実行結果を比較するテストプログラムを書いてください．
   (Windows なら `dir`，Mac，Linux の人は `ls` などは比較的使い易いでしょう)
2. いくつかの演算子の機能を試してみてください
   (`+`, `-`, `*`, `/`, `.`, `x`, `==`, `eq`, `not`, `and`, `or`, ...)
3. くりかえしの機能を試してみてください
   (`while`, `foreach` の中で `is` を使ってみてください．ブロックの中
   で計算した結果を確認するのもよいでしょう)

---

# TODO リストプログラムを確認するためのテストプログラムを書く

前回のテキストで作った以下のプログラムの動作を確認するテストプログラムを書きます．

* 03\_init\_todo.pl
* 04\_add\_todo.pl
* 05\_list\_todo.pl
* 06\_done\_todo.pl
* 07\_list\_notyet\_todo.pl

まず，例を示しましょう．

## TODO リスト初期化プログラムをテストする

### 03_init_todo.t

```{.perl .numberLines}
#!/usr/bin/env perl

use strict;
use warnings;

use Test::More; # is() / done_testing() 関数を使うために必要
use File::Temp ("tempdir"); # tempdir() 関数を使うために必要
use Cwd; # cwd() 関数を使うために必要

# 実行するファイル名を指定する
my $program_filename = "03_init_todo.pl";
my $cwd = cwd();
my $program_fullpath = join("/", $cwd, $program_filename);

# todolist.txt を出力するための一時ディレクトリを作成し，実行し，結果を比較する
# (この一時ディレクトリは自動的に削除される)
{
    # 一時ディレクトリの作成
    my $tmp_dirname = tempdir(CLEANUP => 1);

    # プログラムの実行
    chdir($tmp_dirname) or die; # 現在のディレクトリを一時ディレクトリにする
    `$program_fullpath`; # プログラムの実行

    # 実行結果の取り出し
    open(my $fh, "<", "$tmp_dirname/todolist.txt") or die;
    my $got = join("", <$fh>);
    close($fh) or die;

    # 実際の値(got)と期待する結果(expected) を比較
    my $expected = "sample todo\n"; # 期待する結果
    is($got, $expected);
}

done_testing(); # テストの終了を宣言
```

## 概略説明

急にプログラムが長くなりました．
長いので，コメントを入れておきました．
前回にも書きましたが，空行で意味の区切りを作っています．

1. いつもの
2. 必要な関数の準備 → モジュール
3. 実行するファイル名の準備
4. 一時ディレクトリの準備
5. プログラムの実行
6. 実行結果の取り出し(データファイル)
7. 実際の値，期待する値の比較

プログラムを実行して，結果を比較する部分は，シンプルな例と同じです．

ポイントは，ディレクトリを変更してからプログラムを実行している部分です．
意識していなかったかもしれないですが，
前回書いたプログラム(`03_init_todo.pl`)は，データファイル(`todolist.txt`) を，
実行を開始したときと同じディレクトリに置きます．

実行する前に，ディレクトリを変えないとどうなるでしょうか？

前回テストを実行したときのデータファイルが残っていたり，
最悪，自分の使っているデータファイルが消えてしまいます．
これは嬉しくないでしょう．

そこで，このテストプログラムでは，テスト対象のプログラムを実行する前に，
ディレクトリを移動しています．
移動する先は，一時的に作ったもので，最初は空の状態です．
テストプログラムが終了したら自動的に削除されます．

## 解説1

### File::Temp モジュール

一時的なファイルやディレクトリを作るための機能が含まれています．

`use File::Temp ("tempdir")` という書き方は，`"tempdir"` を使えるようにしています．

これがあると，`tempdir()` 関数を，`tempdir()` として呼べます．
これが無くとも，`File::Temp::tempdir()` という名前で関数を呼び出すことができますが，
長いので，短く呼べるようにしました．

今までのモジュール(例えば，`Test::More`)では，
`use` することで，`is()` 関数や `done_testing()` 関数が
自動的に `関数名()` の形式で呼び出せるようになっていました．

`File::Temp` モジュールの`File::Temp::tempdir()` 関数のように，
自動では `関数名()` の形式で呼び出せずに，
`モジュール名::関数名()` の形式で呼び出すためには，
`use` 時に引数を与える必要があるモジュールもあります．

モジュールによって指定できるものが異なります．
詳しくは，各モジュールのドキュメントを参照してください．

tempdir() 関数

:   一時ディレクトリを作成して，ディレクトリ名[^return_tempdir]を返します．
    引数の `CLEANUP => 1` は，作成した一時ディレクトリを後で自動的に削除する
    ことを関数に伝えています．

    `=>` 演算子は，`,` (カンマ) 演算子とほぼ同じですが，
    右側をクォートなしで文字列として扱えるようにします．
    `CLEANUP => 1` は，`"CLEANUP", 1` と同じです．
    少し短かく書けます．

    この場合の `1` は，ブーリアンの真の意味で，
    `CLEANUP => 1` で `CLEANUP` が 真 である．という意図を表現しています．

[^return_tempdir]: 正確にはディレクトリ名ではありません．作成されたディレクトリ名を返します．

### chdir() 関数

現在のディレクトリを変更します．
変更したディレクトリは，プログラムが終了すれば戻ります．

### Cwd モジュール

cwd() 関数

:   現在のディレクトリ名を文字列で返します．

例えば，

10_directory_test.pl


```{.perl .numberLines}
#!/usr/bin/env perl

use strict;
use warnings;

use File::Temp ("tempdir");
use Cwd;

print("current directory: ", cwd(), "\n");

my $temp_dir = tempdir(CLEANUP => 1);
chdir($temp_dir) or die;

print("new     directory: ", cwd(), "\n");
```

出力例

```{.numberLines}
$ perl 10_directory_test.pl
current directory: /Users/user/Documents/20160327
new     directory: /private/var/tmp/6tyZNeBm85
$ pwd         # Windows だと cd
/Users/user/Documents/20160327
```

ですと，一時ディレクトリに移動して，そのディレクトリを確認することができます．

### ブロック

`{` と `}` に囲まれた部分は，*ブロック* と呼ばれます．

前回のテキストの `while`, `if` の説明でも出てきました．

ブロックは，`while` では，その部分だけ繰り返し実行されたり，
`if` では，その部分だけ実行される，されない，の対象になっています．
複数のプログラムの命令文を1まとめにする機能があります．

読み易さのために，ブロックの中は，ブロックの外よりも先頭に空白文字を入れる *字下げ* を入れるようにします．
字下げは，エディタの機能のままでも良いですが，
そのような機能が無いエディタを使っている場合には，
スペースを4つと決めておくと良いでしょう．
ブロックが，1つのかたまりを構成することを示すためです．

`while` や `if` などが無い部分にも使うことができます．
そこまで意味はありませんが，字下げが入るので，
1つのまとまりを表現するのに便利です．

意味がないというのは嘘です．
ブロックには，1つ重要な機能があります．
それは，変数の有効期限を指定することです．

```{.perl .numberLines}
#!/usr/bin/env perl

use strict;
use warnings;

{
    my $localvar = 1;
}
print($localvar);
```

これは，エラーになります．`$localvar` 変数の有効期限が
`my` で宣言したブロックの内部だからです．

```{.perl .numberLines}
#!/usr/bin/env perl

use strict;
use warnings;

my $localvar;
{
    $localvar = 1;
}
print($localvar);
```

こうするとエラーなく実行することができます．

変数の有効期限のことを *スコープ* と呼びます．

影響範囲がわかりやすいので，*スコープ* をできるだけ小さくすると
プログラムが読み易くなります．

## 練習問題1

1. `File::Temp::tempdir()` という形式で 10\_directory\_test.pl を書き直してみましょう．同じ動作になりましたでしょうか？
2. 10_directory_test.pl を描き直して，`is()` 関数を使って，
`chdir()`の動作を確認するようにしてみましょう．
3. ブロックを使って，変数の有効範囲を確かめてみましょう．
テストするサンプルを書きます．

```{.perl .numberLines}
#!/usr/bin/env perl

use strict;
use warnings;

# pattern1
my $v1;
{
    $v1 = "assign in block";
    print($v1);
}
print($v1);

# pattern2
{
    my $v2 = "declarate in block\n";
    print($v2);
}
print($v2);

# pattern3
{
    print($v3);
    my $v3 = "use before declaration";
}
```

## TODO リストを追加するプログラムをテストする

### 04_add_todo.t

```{.perl .numberLines}
#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use File::Temp ("tempdir");
use Cwd;

my $program_filename = "04_add_todo.pl";
my $cwd = cwd();
my $program_fullpath = join("/", $cwd, $program_filename);

{
    my $tmp_dirname = tempdir(CLEANUP => 1);
    chdir($tmp_dirname) or die;

    my $new_todo_content = "append new todo";
    open(my $wfh, "|-", $program_fullpath) or die;
    print($wfh $new_todo_content, "\n");
    close($wfh) or die;

    my $output_filename = join("/", $tmp_dirname, "todolist.txt");
    open(my $rfh, "<", $output_filename) or die;
    my $got = join("", <$rfh>);
    close($rfh) or die;

    my $expected = $new_todo_content . "\n";
    is($got, $expected);
}

done_testing();
```

## 解説2

### open の 入力モード

`open()` 関数のモードが，`"|-"` になっています．
これは，パイプと呼ばれて，
そのファイルハンドルへの出力が，
別のコマンドへの入力に繋がっている状態を作ります．

```{.numberLines}
プログラム
(ファイルハンドルへの print)
　　↓↓↓
別コマンドへの入力
(ファイルハンドルから <>)
```

逆に，``` `` ``` (バッククォート)演算子は，
別のコマンドの出力をプログラムで受け取ることができました．
これもパイプを使って書くこともできます．

`open()` 関数を使うと長くなるので，
本テキストでは``` `` ``` を優先して使っています．

## 問題提起

`03_list_todo.t` と `04_add_todo.t` を見比べてください．
同じ部分が多い気がしませんか？

1. ファイル名から，フルパス名(現在のディレクトリを追加したファイル名)を得る部分
2. 一時ディレクトリに移動する部分

## 書き換え

### 処理を別ファイルに移動する

`03_init_todo.t` を使います．

まず，現在のディレクトリを付与したファイル名を得る部分から．

この章では，長くなるのでコードはポイントだけ書くことにします．

```{.perl .numberLines}
my $program_filename = "03_init_todo.pl";
my $pwd = cwd();
my $program_fullpath = join("/", $pwd, $program_filename);
```

ブロックにする

```{.perl .numberLines}
# 実行するファイル名を指定する
{
    my $program_filename = "03_init_todo.pl";
    my $pwd = cwd();
    my $program_fullpath = join("/", $pwd, $program_filename);
}
```

これだと，`$program_fullpath` 変数が後で使えないので，
`my` 宣言だけ外に出します．

```{.perl .numberLines}
# 実行するファイル名を指定する
my $program_fullpath;
{
    my $program_filename = "03_init_todo.pl";
    my $pwd = cwd();
    $program_fullpath = join("/", $pwd, $program_filename);
}
```

名前を付けて，それを呼び出すようにします．

```{.perl .numberLines}
# 実行するファイル名を指定する
my $program_fullpath = fullpath();
sub fullpath {
    my $program_filename = "03_init_todo.pl";
    my $pwd = cwd();
    return join("/", $pwd, $program_filename);
}
```

入力も外側に出す．

```{.perl .numberLines}
# 実行するファイル名を指定する
my $program_filename = "03_init_todo.pl";
my $program_fullpath = fullpath($program_filename);
sub fullpath {
    my ($program_filename) = @_;
    my $pwd = cwd();
    return join("/", $pwd, $program_filename);
}
```

別ファイルに書いて，それを呼び出します．

MyTestUtil.pm

```{.perl .numberLines}
package MyTestUtil;

use strict;
use warnings;

use Cwd;

sub fullpath {
    my ($program_filename) = @_;
    my $pwd = cwd();
    return join("/", $pwd, $program_filename);
}

1;
```

03_add_todo.pl 抜粋

```{.perl .numberLines}
# 実行するファイル名を指定する
my $program_filename = "03_init_todo.pl";
my $program_fullpath = fullpath($program_filename);
```

できあがったプログラムを再掲します．

### 03_init_todo2.t

```{.perl .numberLines}
#!/usr/bin/env perl

use strict;
use warnings;

use Test::More; # is() / done_testing() 関数を使うために必要
use File::Temp ("tempdir"); # tempdir() 関数を使うために必要

use MyTestUtil;

# 実行するファイル名を指定する
my $program_filename = "03_init_todo.pl";
my $program_fullpath = MyTestUtil::fullpath($program_filename);

# todolist.txt を出力するための一時ディレクトリを作成し，実行し，結果を比較する
# (この一時ディレクトリは自動的に削除される)
{
    # 一時ディレクトリの作成
    my $tmp_dirname = tempdir(CLEANUP => 1);

    # プログラムの実行
    chdir($tmp_dirname) or die; # 現在のディレクトリを一時ディレクトリにする
    `$program_fullpath`; # プログラムの実行

    # 実行結果の取り出し
    open(my $fh, "<", "$tmp_dirname/todolist.txt") or die;
    my $got = join("", <$fh>);
    close($fh) or die;

    # 実際の値(got)と期待する結果(expected) を比較
    my $expected = "sample todo\n"; # 期待する結果
    is($got, $expected);
}

done_testing(); # テストの終了を宣言
```

### 04_add_todo2.t

```{.perl .numberLines}
#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use File::Temp ("tempdir");

use MyTestUtil;

my $program_filename = "04_add_todo.pl";
my $program_fullpath = MyTestUtil::fullpath($program_filename);

{
    my $tmp_dirname = tempdir(CLEANUP => 1);
    chdir($tmp_dirname) or die;

    my $new_todo_content = "append new todo";
    open(my $wfh, "|-", $program_fullpath) or die;
    print($wfh $new_todo_content, "\n");
    close($wfh) or die;

    my $output_filename = join("/", $tmp_dirname, "todolist.txt");
    open(my $rfh, "<", $output_filename) or die;
    my $got = join("", <$rfh>);
    close($rfh) or die;

    my $expected = $new_todo_content . "\n";
    is($got, $expected);
}

done_testing();
```

### MyTestUtil.pm

```{.perl .numberLines}
package MyTestUtil;

use strict;
use warnings;

use Cwd;

sub fullpath {
    my ($program_filename) = @_;
    my $pwd = cwd();
    return join("/", $pwd, $program_filename);
}

1;
```

## 解説

### 関数の書き方

関数は用意されているもの(`open()`, `print()` など) もありますが，
自分で書くこともできます．

関数は，ブロックに名前を付けたものです．
ブロックなので，複数の命令を束ねて意味を表すことができます．

`sub` キーワードを使って，`sub + 関数名 + ブロック` の形式で，
関数を定義できます．

関数の引数は，自動的に `@_` 変数に入ります．

`func(1, 2, 3)` のように呼び出せば，`@_ = (1, 2, 3)` になります．

関数の戻り値は，`return` で指定します．

関数は，`return` を実行すると，残りの処理を飛ばして，
呼び出し元に戻ります．

サンプル

```{.perl .numberLines}
sub func_name {
    my ($arg1, $arg2, @arg_array) = @_;

    return join($arg1, $arg2, @arg_array);
}
```

### モジュールの書き方

いくつか覚えておく必要があります．

Perl では，別ファイルの機能を使うのに，モジュールという仕組みを使います．
`Test::More`, `File::Temp` などは，Perl が標準で用意しているモジュールです．

自分でモジュールを書くこともできます．

モジュール名と拡張子`.pm` が，ファイル名と同じでなければいけません．
`MyTestUtil` というモジュール名なら，ファイル名は `MyTestUtil.pm` です．

モジュールファイルの先頭で `package` 宣言をします．これもモジュール名です．

モジュールファイルの最後に，`1;` を書きます．

モジュールを `use` したときに，成功したら真を返すことになっています．
エラーになった場合は，偽を返すことになっています．

モジュールの書き方(MyTestUtil モジュール)

```{.perl .numberLines}
package MyTestUtil;

sub fullpath {
  ...
}

1;
```

使い方

```{.perl .numberLines}

use MyTestUtil;

my $ret = MyTestUtil::fullpath($arg);

```

モジュールの中の関数は，モジュール名と `::` を先頭に付けて呼び出せます．

今まで，モジュールの中の関数は，
モジュール名を指定しないで呼び出していました．

## 練習問題

1. 円周を計算する関数 `circumference_of_circle()` (引数: 半径，戻り値: 円周) を書いてみましょう．
半径を入力して，円周を出力するプログラムを書いてみましょう．
2. モジュール `Math` を作り，円周を作る関数，円の面積を作る関数 `area_of_circle()` (引数: 半径，戻り値: 面積) を書いてみましょう．
半径を入力して，円周と面積を出力するプログラムから`Math` モジュールを使ってみましょう．
3. `chtempdir()` という関数(引数: なし，戻り値: ディレクトリ名)を `MyTestUtil` モジュール内に作り，それぞれのテストで使うようにしなさい．
4. `05_list_todo.t`, `06_list_todo.t`, `07_list_notyet_todo.t` を作りましょう．
5. それぞれのテストプログラムで共通化できる部分があったら，`MyTestUtil` モジュールに移動してみましょう．

---

# 機能追加

---

# まとめ

---

# おさらい

この会で Perl プログラミングについて学んだことをおさらいします．

---

# 練習問題の答

---

# 付録

## 補足: モジュールのドキュメントの探し方

* http://perldoc.jp/

ここに和訳済みのものがいっぱいあります．

ここに無ければ，英語のものを探す必要があるかもしれません．

* http://search.cpan.org/

ここを探すとよいでしょう．

又，`perldoc` コマンドで調べることもできます．
英語なのですが，簡単に調べることができます．

```{.numberLines}
$ perldoc Test::More     # モジュールを調べたいとき
$ perldoc -f open        # 関数を調べたいとき
$ perldoc perlop         # まとまった項目(perlop = 演算子)
```

---

# さいごに

これを読んだ人がプログラミングを挫折しないで学べるようになることを望んで書きました．

なるべく覚えることを減らして，1つの章でポイントを絞って書くようにしました．
その代わり網羅性は考えないことにしました．一般のプログラミング言語の入門書に通常あるようなことでも書いていないことがあります．
10個のことを覚えるより，1つのことを10回やった方がうまくなると思っているからです．

勉強した方の生活がどこか楽になってくれると嬉しく思います．

---
