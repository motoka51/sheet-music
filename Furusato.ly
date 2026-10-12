% !TEX TS-program = myLilyPond
\version "2.26.0"


\paper {
  indent = 0\mm
  #(define fonts
    (set-global-fonts
     #:roman "BIZ UDGothic"
   ))
}


\header {
  title    = "ふるさと"
%  composer = "岡野 貞一"
%  poet = "高野 辰之"
  tagline  = ""  % タグラインを消すには空文字にするよ
}


% 16小節分のメロディ（各小節4不音符）
melody = \relative c' {
  \key d \minor
  \numericTimeSignature
  \numericTimeSignature
\time 3/4
  \tempo 4 = 80
  % 小節1-4
  f4 f f | g4. a8 g4 | a a bes | c2 r4 \break
  % 小節5-8
  bes c d | a4. bes8 a4 | g g e | f2 r4 \break
  % 小節9-12
  g8 f g4 c, | f8 g a4 a | c4 c b a | g4 g e2 \break
  % 小節13-16
  e4 g a g | e4 g c c | a4 a g e | d4 e c2 \break
}

% 歌詞（各小節4シラブル、4小節ごとに改行）
verseOne = \lyricmode {
  \set stanza = "1. "
  う さ ぎ | お い し | か の や | ま \break
  こ ぶ な | つ り し | か の か | わ \break
  ゆ ー め は | い ー ま も | め ー ぐ ー | り ー て \break
  さ ー け よ | さ け よ と | さ さ や き | な が ら
}

verseTwo = \lyricmode {
  \set stanza = "2. "
  は ー る の | お が わ は | さ ら さ ら | い く よ \break
  え ー び や | め だ か や | こ ぶ な の | む れ に \break
  きょ ー う も | い ち に ち | ひ な た で | お よ ぎ \break
  あ ー そ べ | あ そ べ と | さ さ や き | な が ら
}

verseThree = \lyricmode {
  　 　 　 　 | 　 　 　 　 | 　 　 　 　 | 　 　 　 \break
  　 　 　 　 | 　 　 　 　 | 　 　 　 　 | 　 　 　 \break
  　 　 　 　 | 　 　 　 　 | 　 　 　 　 | 　 　 　 \break
  　 　 　 　 | 　 　 　 　 | 　 　 　 　 | 　 　 　 
}

verseFour = \lyricmode {
  　 　 　 　 | 　 　 　 　 | 　 　 　 　 | 　 　 　 \break
  　 　 　 　 | 　 　 　 　 | 　 　 　 　 | 　 　 　 \break
  　 　 　 　 | 　 　 　 　 | 　 　 　 　 | 　 　 　 \break
  　 　 　 　 | 　 　 　 　 | 　 　 　 　 | 　 　 　 
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
    \new Lyrics \lyricsto "melody" { \verseThree }
    \new Lyrics \lyricsto "melody" { \verseFour }
  >>
  \layout { }
  \midi { }
}
