%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

global = {
  \time 4/4
  \key gf \major
  \accidentalStyle piano
}

rightHandUpper = \relative {
  r4 gf''( f bf, |
  cf4 ef df gf, |
  af4 cf bf ef, |
  f4 gf bf af) |
  r4 r df~( \tuplet 3/2 { df gf,8 } \tupletOff |
  \tuplet 3/2 { gf8 af-. bf-. } cf4~ \tuplet 3/2 { cf8 bf af  df, gf f } |
  \tuplet 3/2 { ef8 f gf } af4~ \tuplet 3/2 { af8 gf f  gf af bf } |
  \tuplet 3/2 { df8 df, ef  df f' ef  gf, df' ef,  f af bf } |
  
  \barNumberCheck 9
  gf4) <cf, gf' cf>( <bf gf' bf> <ef, bf' df ef> |
  <f cf' df f>4 <gf df' gf> <bf f' bf> <cf f af> |
  \tupletOn <bf gf'>4) r df'~( \tuplet 3/2 { df4 gf,8 } \tupletOff |
  \tuplet 3/2 { gf8 af bf } cf4~ \tuplet 3/2 { cf8 bf af  df, gf f } |
  \tuplet 3/2 { ef8 f gf } af4~ \tuplet 3/2 { af8 gf f  gf af bf } |
  \tuplet 3/2 { df8 df, ef  df f' ef  df af' bf,  \voiceOne c ef f } |
  df4) \oneVoice <gf, df' gf>( <f df' f> <bf, f' af bf> |
  <c gf' af c>4 <df af' df> <f c' f> <gf c ef> |
  
  \barNumberCheck 17
  <f bf df>4) r \tuplet 3/2 { f'8(\mf e f  af gf bf, } |
  \tuplet 3/2 { bf8 c ef~ } ef2) <gf, c ef>4( |
  <f bf df>4 <ef af c> < df f bf> <cf f af> |
  <bf ef gf>4) r \tuplet 3/2 { bf'8(\mf a bf  df cf ef, } |
  \tuplet 3/2 { ef8 f af~ } af2) <cf, f af>4^( |
  <bf ef gf>4 <af df f> <gf bf ef> <gf c f> |
  <cf df>2 <cf f af>4 <df f bf> |
  <bf gf'>4) r df'8( ef16 * 1/2 df ef df \tuplet 3/2 { c8 df gf, } |
  
  \barNumberCheck 25
  \tuplet 5/4 { gf16 f-. gf-. af-. bf-. } cf4~ cf8 bf16 * 1/2 af bf af 
    \tuplet 5/4 { df,16 bf' af gf f } |
  \tuplet 3/2 { ef16 f-. d-. ef-. f-. gf-. } af4~ 
    \tuplet 3/2 { af8 gf f  gf af bf } |
  \tuplet 3/2 { df8^\rubato df, ef  df f' ef  gf, df' ef,  f^\rit af bf } |
  gf4) <f df'>( <bf ef> <df gf> |
  <f bf>4 <df gf> <cf af'> <f, df'>~ |
  <bf df>4) <f df'>( <bf ef> <df gf> |
  <f bf>4 <df gf> <cf af'> <f, df'>~ |
  <bf df>4 \voiceOne df2) df4~ |
  
  \barNumberCheck 33
  df4 df( s2 |
  s2 <cf, df f af>\arpeggio |
  <bf df gf bf>1)\arpeggio\fermata |
  \bar "|."
}

rightHandLower = \relative {
  \voiceTwo
  s1 * 7 |
  s2. cf'4~ |
  
  \barNumberCheck 9
  cf4 s2. |
  s1 * 4 |
  s2. gf'4~ |
  gf4 s2. |
  s1 |
  
  \barNumberCheck 17
  s1 * 6 |
  gf,4 f s2 |
  s1 |
  
  \barNumberCheck 25
  s1 * 2 |
  s2. cf'4( |
  bf4) s2. |
  s1 * 3 |
  s4 f'( gf) f( |
  
  \barNumberCheck 33
  gf4) <ef gf>^~ \oneVoice gf2~ |
  gf2 s2 |
  s1 |
}

rightHand = {
  \global
  <<
    \new Voice \rightHandUpper
    \new Voice \rightHandLower
  >>
}

leftHand = \relative {
  \global
  \clef bass
  r4 \clef treble bf'( af df, |
  ef4 gf f bf, |
  cf4 ef df gf, |
  af4 bf df cf) |
  \clef bass r4 <bf gf'>( <af f'> <df, bf'> |
  <ef cf'>4 <gf ef'> <f df'> <bf, gf'> |
  <cf af'>4 <ef cf'> <df bf'> <gf, ef'> |
  <af f'>4 <bf gf'> <df bf'> <df, df'> |
  
  \barNumberCheck 9
  <ef ef'>4) q( <df df'> <gf, gf'> |
  <af af'> <bf bf'> <df df'> <df, df'> |
  <gf gf'>4) <bf'' gf'>( <af f'> <df, bf'> |
  <ef cf'>4 <gf ef'> <f df'> <bf, gf'> |
  <cf af'>4 <ef cf'> <df bf'> <gf ef'> |
  <af f'>4 <bf gf'> <af f'> <af, af'> |
  <bf bf'>4) q( <af af'> <df, df'> |
  <ef ef'>4 <f f'> <af af'> <a a'> |
  
  \barNumberCheck 17
  <bf bf'>4) \clef treble <df' bf'>( <c a'>^\p <f, df'> |
  <gf ef'>4 <bf gf'> <a f'>) \clef bass <a,, a'>( |
  <bf bf'>4 <c c'> <df df'> <d d'> |
  <ef ef'>4) <gf' ef'>(^\p <f d'> <bf, gf'> |
  <cf af'>4 <ef cf'> <d bf'>) <d,, d'>( |
  <ef ef'> <f f'> <gf gf'> <af af'> |
  <df df'>2 <df, df'> |
  <gf gf'>4) <bf'' gf'>( <af f'> <df, bf'> |
  
  \barNumberCheck 25
  <ef cf'>4 <gf ef'> <f df'> <bf, gf'> |
  <cf af'>4 <ef cf'> <df bf'> <gf, ef'> |
  <af f'>4 <bf gf'> <df bf'> <df, df'>^~ |
  <<
    { \voiceThree df'4) }
    \new Voice { \voiceFour gf,4 }
  >> \oneVoice <df' bf'>( \clef treble <gf ef'> <bf gf'> |
  <df bf'>4 <ef bf'>~ <af, ef' af> <df bf'>~ |
  <gf, df' gf>4) \clef bass <df bf'>( \clef treble <gf ef'> <bf gf'> |
  <df bf'>4 <ef bf'>~ <af, ef' af> <df bf'>~ |
  <gf, df' gf>4) \clef bass
    <<
      { bf2 bf4~ | bf cf }
      \\
      { df,4( ef) df( | ef) <af, ef'> }
    >> r2 |
    
  % bar number check 34 (33 is in the temporary voice sctructure)
  r2 <df, df'>\arpeggio |
  <gf, gf' df'>1\arpeggio |
}

dynamics = {
  \override DynamicTextSpanner.style = #'none
  s4 s2.\p\< |
  s1 |
  s4 s\! s2\> |
  s1 <>\! |
  s1 |
  s4\< s2\> s4\! |
  s8 s\cresc s2. |
  s8\mf s\dim s2. |
  
  \barNumberCheck 9
  s4 s2.\p |
  s1 * 2 |
  s4\< s2\> s4\! |
  s8 s\cresc s2. |
  s8\mf s\dim s2. |
  s4 s2.\p |
  s4 s2\< s4\! |
  
  \barNumberCheck 17
  s1 |
  s4\< s2\! s4\p |
  s4 s2.-\tweak to-barline ##f \< |
  s4\! s2. |
  s4\< s2\! s4\p |
  s1\< <>\! |
  s8 s-\tweak to-barline ##f \> s2. |
  s4\! s2.\pp |
  
  \barNumberCheck 25
  s1 |
  s2 s8 s\< s4 <>\! |
  s1 |
  s4 s2.\p |
  s1 |
  s4 s2.\pp |
}

tempi = {
  \set Score.tempoHideNote = ##t
  \textMark \markup \tempo-markup "Andante cantabile" #2 #0 63
  \tempo 4 = 69
  s1 * 4 |
  \tempo 4 = 63
  s1 * 4 |
  
  \barNumberCheck 9
  s1 * 8 |
  
  \barNumberCheck 17
  s1 * 8 |
  
  \barNumberCheck 25
  s1 * 2 |
  \tempo 4 = 58
  s2. \tempo 4 = 54 s4 |
  \tempo 4 = 69
  s1 * 4 |
  \tempo 4 = 58
  s1 |
  
  \barNumberCheck 33
  s1 * 3 |
}

forceBreaks = {
  s1 * 3 s1 \break
  s1 s1 s1 \break
  s1 s1 s1 \break
  s1 s1 s1 \break
  s1 s1 s1 \pageBreak
  
  s1 * 3 s1 \break
  s1 * 3 s1 \break
  s1 s1 \break
  s1 s1 s1 \break
}

preludeThreeNotes =
\score {
  \header {
    title = "3."
    composer = "Alexander Scriabin"
    opus = "Opus 16, No. 3"
  }
  \keepWithTag layout  
  \new PianoStaff \with { 
    connectArpeggios = ##t 
  } <<
    \new Staff = "upper" \rightHand
    \new Dynamics \dynamics
    \new Staff = "lower" \leftHand
    \new Devnull \tempi
    \new Devnull \forceBreaks
  >>
  \layout {}
}

\include "articulate.ly"

preludeThreeMidi =
\book {
  \bookOutputName "prelude-op16-no03"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics \tempi >>
      \new Staff = "lower" << \leftHand \dynamics \tempi >>
    >>
    \midi{}
  }
}
