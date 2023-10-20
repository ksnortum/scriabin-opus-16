%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

%%% Posistions and shapes %%%

moveNoteA = \once \override NoteColumn.force-hshift = 1.4

%%% Music %%%

global = {
  \time 3/4
  \key ef \minor
  \accidentalStyle piano
}

rightHandUpper = \relative {
  \set Score.tempoHideNote = ##t
  \textMark \markup \tempo-markup Lento #2 #0 44
  \tempo 4 = 44
  \tupletOff
  bf'4( af8 bf \tuplet 3/2 { df cf8. gf16 } |
  af4 gf8 af \tuplet 3/2 { cf8 bf8. ef,16 } |
  <gf, bf ef gf>4-. q-. q-. |
  \voiceOne af'4 gf8 af \tuplet 3/2 { cf bf8. f16 } |
  gf4 f8 gf \tuplet 3/2 { bf af8. ef16 } |
  \oneVoice <f, bf d f>4-. q-. q-. |
  \voiceOne gf'4 f8 gf \tuplet 3/2 { af bf8. cf16 } |
  df4 ef8 ff \tuplet 3/2 { ef df8. cf16 } |
  
  \barNumberCheck 9
  \oneVoice <cf, ff cf'>4-. <cf ef cf'>-. q-. |
  <bf bf'>4-. \oneVoice af'8  bf \tuplet 3/2 { df cf8. gf16 } |
  af4 gf8 af \tuplet 3/2 { cf bf8. ef,16 } |
  <gf, bf ef gf>4-. q-. q-.) |
  \bar "|."
}

rightHandLower = \relative {
  \voiceTwo 
  s2. * 3 |
  <af df f>2 <bf f'>4 |
  <bf ef>2 <af ef'>4 |
  s2. |
  <gf cf ef>2 <df' f>4 |
  <ff af>4 <ff cf'> <ff bf>8. <ff af>16 |
  
  \barNumberCheck 9
  s2. |
  \moveNoteA ef8 s8 s2 |
  s2. * 2 |
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
  R2. * 2 |
  <ef, bf' ef>4-.( q-. <ef ef'>-.) |
  <df df'>2 <gf df'>4 |
  <cf, cf'>2 <f cf'>4 |
  <bf, bf'>4-.( q-. q-.) |
  <af af'>2 <df df'>8 <cf cf'> |
  <bf bf'>4 <af af'> <g g'>8. <af af'>16 |
  
  \barNumberCheck 9
  <af' ff'>4-.( <a gf'>-. q-.) |
  <bf gf'>4-. r r |
  R2. |
  <ef, bf' ef>4-.( q-. q-.) |
}

dynamics = {
  \override DynamicTextSpanner.style = #'none
  \tag layout { s2.^\pSotoVoce } \tag midi { s2.\p } |
  s2. * 5 |
  s4 s2\cresc |
  s2\mf s4\dim |
  
  \barNumberCheck 9
  s2. |
  s4\p s2\pp |
  s2. |
  s2.-\tweak X-offset 0 \ppp |
}

% MIDI only
pedal = {
  s2. * 2 |
  s2.\sd |
  s2\su\sd s4\su\sd |
  s2\su\sd s4\su\sd |
  s2.\su\sd |
  s2\su\sd s8\su\sd s\su\sd |
  s4\su\sd s\su\sd s8.\su\sd s16\su |
  
  \barNumberCheck 9
  s4\sd s2\su\sd |
  s2.\su  |
  s2. |
  s2.\sd <>\su |
}

forceBreaks = {
  s2. \noBreak s2. \noBreak s2. \break
  s2. \noBreak s2. \noBreak s2. \break
  s2. \noBreak s2. \noBreak s2. \break
  s2. \noBreak s2. \noBreak s2. \break
}

preludeFourNotes =
\score {
  \header {
    title = "4."
    composer = "Alexander Scriabin"
    opus = "Opus 16, No. 4"
  }
  \keepWithTag layout  
  \new PianoStaff \with { 
    \override StaffGrouper.staff-staff-spacing = 
      #'((basic-distance . 12)
         (padding . 2))
  } <<
    \new Staff = "upper" \rightHand
    \new Dynamics \dynamics
    \new Staff = "lower" \leftHand
    \new Devnull \forceBreaks
  >>
  \layout {}
}

\include "articulate.ly"

preludeFourMidi =
\book {
  \bookOutputName "prelude-op16-no04"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics \pedal >>
      \new Staff = "lower" << \leftHand \dynamics \pedal >>
    >>
    \midi{}
  }
}
