% !TEX TS-program = myLilyPond
\version "2.26.0"


\paper {
  indent = 0\mm
  markup-system-spacing.basic-distance = #10
%  score-markup-spacing.basic-distance = #16
  system-system-spacing.basic-distance = #20
  property-defaults.fonts.serif = "游教科書体" %"ヒラギノ角ゴシック" % "しっぽり明朝" 
}


\header {
  title    = \markup {
    \fontsize #2 % 文字の大きさ
    "ふるさと"
  }
%  composer = "岡野 貞一"
%  poet = ""
  tagline  = ""  % タグラインを消すには空文字にするよ
}


% 16小節分のメロディ（各小節4不音符）
melody = \relative c' {
  \key d \minor
  \numericTimeSignature
\time 3/4
  %\tempo 4 = 80
  % 小節1-4
  f4 f f | g4. a8 g4 | a a bes | c2 r4 \break
  % 小節5-8
  bes4 c d | a4. bes8 a4 | g g e | f2 r4 \break
  % 小節9-12
  g8 f g4 c, | f8 g a4 a | bes8 a bes4. d8 | c8 bes8 a4 r4 \break
  % 小節13-16
  c4 c c | f,4. g8 a4 | bes bes g | f2 r4 \bar "|."
}

% 歌詞（各小節4シラブル、4小節ごとに改行）
verseOne = \lyricmode {
  \set stanza = "1. "
  う さ ぎ | お い し | か の や | ま \break
  こ ぶ な | つ り し | か の か | わ \break
  ゆ ー め は | い ー ま も | め ー ぐ ー | り ー て \break
  わ す れ | が た き | ふ る さ | と
}

verseTwo = \lyricmode {
  \set stanza = "2. "
  こ こ ろ | ざ し を | は た し | て \break
  い つ の | ひ に か | か え ら | な \break
  や ー ま は | あ ー お き | ふ ー る ー | さ ー と \break
  み ず は | き よ き | ふ る さ | と
}

verseThree = \lyricmode {
  \set stanza = "3. "
  い か に | い ま す | ち ち は | は \break
  つ つ が | な し や | と も が | き \break
  あ ー め に | か ー ぜ に | つ ー け ー | て ー も \break
  お も い | い ず る | ふ る さ | と \break
}

\score {
  <<
    % メロディに "melody" という名前をつける
    \new Staff {
      \new Voice = "melody" {
        \melody
      }
    }
    % 歌詞をメロディにリンクさせる
    \new Lyrics \lyricsto "melody" { \verseOne }
    \new Lyrics \lyricsto "melody" { \verseTwo }
%    \new Lyrics \lyricsto "melody" { \verseThree }
  >>
  \layout { }
  \midi { }
}
