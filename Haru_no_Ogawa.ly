% !TEX TS-program = myLilyPond
\version "2.24.2"


\paper {
  indent = 0\mm
  #(define fonts
    (set-global-fonts
     #:roman "BIZ UDGothic"
   ))
}


\header {
  title    = "春の小川"
%  composer = "岡野 貞一"
%  poet = "高野 辰之"
  tagline  = ""  % タグラインを消すには空文字にするよ
}


% 16小節分のメロディ（各小節4不音符）
melody = \relative c' {
  \key c \major
  \numericTimeSignature
  \time 4/4
  \tempo 4 = 80
  % 小節1-4
  e4 g a g | e4 g c c | a4 a g e | c4 d e2 \break
  % 小節5-8
  e4 g a g | e4 g c c | a4 a g e | d4 e c2 \break
  % 小節9-12
  d4 e d g | a4 a g a | c4 c b a | g4 g e2 \break
  % 小節13-16
  e4 g a g | e4 g c c | a4 a g e | d4 e c2 \break
}

% 歌詞（各小節4シラブル、4小節ごとに改行）
verseOne = \lyricmode {
  \set stanza = "1. "
  は ー る の | お が わ は | さ ら さ ら | い く よ \break
  き ー し の | す み れ や | れ ん げ の | は な に \break
  す ー が た | や さ し く | い ろ う つ | く し く \break
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
