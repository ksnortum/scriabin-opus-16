%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"
\include "force-initial-clef.ily"

%%% Posistions and shapes %%%

moveDynamicA = \once {
  \override DynamicLineSpanner.avoid-slur = #'inside
  \override DynamicLineSpanner.outside-staff-priority = ##f
  \override DynamicLineSpanner.Y-offset = 3.5
}

%%% Music %%%

global = {
  \time 2/4
  \key gs \minor
  \accidentalStyle piano
}

rightHandUpper = \relative {
  \set Score.tempoHideNote = ##t
  \textMark \markup \tempo-markup Andante #2 #0 80
  \tempo 4 = 80
  <b' ds>4~( \tuplet 5/4 { q16 <b e>-. <b ds>-. q-. <ds gs>-. } |
  <gs, cs>2) |
  <fss b>4~( \tuplet 5/4 { q16 <fss cs'>-. <fss b>-. q-. <as ds>-. } |
  <ds, gs>2) |
  q4~( \tuplet 5/4 { q16 <ds as'> <ds gs> q <ds b'>) } |
  <ds fs>4~( \tuplet 5/4 { q16 <ds gs> <ds fs> q <ds as'>) } |
  \voiceOne \tuplet 5/4 { es16( fs es as gs  fs gs fs e fs } |
  ds2) |
  
  \barNumberCheck 9
  \oneVoice <e' gs>4~( \tuplet 5/4 { q16 <e a>-. <e gs>-. q-. <gs cs>-. } |
  <cs, fs>2) |
  <bs e>4~( \tuplet 5/4 { q16 <bs fs'>-. <bs e>-. q-. <ds gs>-. } |
  <gs, cs>2) |
  <gs cs>4~( \tuplet 5/4 { q16 <gs ds'> <gs cs> q <gs e'>) } |
  <gs b>4~( \tuplet 5/4 { q16 <gs cs> <gs b> q <gs ds'>) } |
  \voiceOne \tuplet 5/4 { as( b as ds cs  b cs b a b } |
  gs2) |
  
  \barNumberCheck 17
  a4~(^\mf \tuplet 5/4 { a16 b a a cs } |
  cs4 b) |
  b4~ b8 a |
  \oneVoice <a, b es a>8 <a b fs' a>~ q <gs b e gs> |
  \voiceOne b'4~( \tuplet 5/4 { b16 cs b b fs' }
  <<
    { \oneVoice <d, gs fs'>4 <d gs e'>) | }
    \new Voice { s16 \moveDynamicA s8^\> s32 s\! s4 | }
  >>
  <cs a' cs e>4\arpeggio <cs gs' cs e>\arpeggio |
  <cs fss cs' e>4~\arpeggio q8 <ds ds'> |
  
  \barNumberCheck 25
  \slurUp <ds b'ds>4~( \tuplet 5/4 { q16 <e b' e> <ds b' ds> q <gs ds' gs> } |
  <cs, gs' cs>2) |
  <b fss' b>4~( \tuplet 5/4 { q16 <cs fss cs'> <b fss' b> q <ds as' ds> } |
  <gs, ds' gs>2) |
  q4~( \tuplet 5/4 { q16 <as ds as'> <gs ds' gs> q <b ds b'>) } |
  <as e' gs as>4~( 
    \tuplet 5/4 { q16 <b e gs b> <as e' gs as> q <cs e gs cs>) } |
  \tuplet 5/4 { <bs gs' bs>16( <cs gs' cs> <bs gs' bs> q <ds gs ds'>
    <cs gs' cs> <ds gs ds'> <cs gs' cs> q <e gs e'> } |
  <ds as' ds>2) |
  
  \barNumberCheck 33
  r8 <ds gs ds'>-.( <fss ds' fss>-. <gs e' gs>-.) |
  <b e b'>2 |
  <b e gs b>2 |
  <b e fss b>2 |
  <b ds gs b>2~ |
  q2 |
  \bar "|."
}

rightHandLower = \relative {
  \voiceTwo
  s2 * 6 |
  ds'4 css |
  ds2 |
  
  \barNumberCheck 9
  s2 * 6 |
  gs4 fss |
  % SrcB
  gs2 |
  
  \barNumberCheck 17
  <a, cs>2 |
  <a e'>4 <a ds> |
  <a b ds>8 <a b e> <a b es> q |
  s2 |
  <gs d' gs>2 |
}

rightHand = {
  \global
  \omit Staff.TupletNumber
  \omit Staff.TupletBracket
  <<
    \new Voice \rightHandUpper
    \new Voice \rightHandLower
  >>
}

leftHand = \relative {
  \global
  \bassToTreble
  \omit TupletNumber
  \omit TupletBracket
  gs'4~( gs16 fss gs b, |
  e2) |
  ds4~( ds16 e ds fss, |
  b2) |
  \clef bass b4~( b16 as b gs) |
  as4~( as16 b as fs) |
  \tuplet 3/2 { gs8( cs b  as gs as } |
  ds2) |
  
  \barNumberCheck 9
  \clef treble cs'4~( cs16 bs cs e, |
  a2) |
  gs4~( gs16 a gs bs, |
  e2) |
  e4~( e16 ds e cs) |
  ds4~( ds16 e ds b) |
  \tuplet 3/2 { cs8( fs e  ds cs ds } |
  gs2) |
  
  \barNumberCheck 17
  \clef bass <fs,, fs'>8 <es es'> <fs fs'> <cs cs'> |
  <fs fs'>8 <es es'> <fs fs'> <b, b'> |
  <b b'>8[~ \tuplet 3/2 { q16 <bs bs'> r32 <cs cs'>] } q8 <d d'> |
  q8 <ds ds'>~ q <e e'> |
  q8 <ds ds'> <e e'> <b b'> |
  <e e'>8 <ds ds'> <e e'> <e, e'> |
  <a a' e'>4\arpeggio <a' e' a cs>\arpeggio |
  <ds,, ds' as' fss' cs'>4~\arpeggio q8 r |
  
  \barNumberCheck 25
  <gs' gs'>4~( \tuplet 5/4 { q16 <fss fss'> <gs gs'> q <b, b'> } |
  <e e'>2) |
  <ds ds'>4~( \tuplet 5/4 { q16 <e e'> <ds ds'> q <fss, fss'> } |
  <b b'>2) |
  q4~( \tuplet 5/4 { q16 <as as'> <b b'> q <gs gs'>) } |
  <cs cs'>4~( \tuplet 5/4 { q16 <b b'> <cs cs'> q <as as'>) } |
  \tuplet 5/4 { <ds ds'>16(  <e e'> <ds ds'> q <fs fs'>
    <e e'> <fs fs'> <e e'> q <cs cs'> } |
  <fss fss'>2) |
  
  \barNumberCheck 33
  r8 <gs ds' b'>-.( <as ds cs'>-. \after 16 \sd <b e css'>-.) |
  <gs' css e gs>2 |
  \grace { <ds, ds'>16[ <b' b'>] } <gs' cs e gs>2 |
  \grace { <ds, ds'>16[ <b' b'>] } <fss' cs' e fss>2
  \grace { <gs,, gs'>16[ <ds'' ds'>] } <gs b ds gs>2~ |
  q2 |
}

dynamics = {
  \override DynamicTextSpanner.style = #'none
  s2\pp |
  s2 * 3 |
  s4. s8\cresc |
  s2 |
  s8 s4.\dim |
  s2 |
  
  \barNumberCheck 9
  s2\pp |
  s2 * 5 |
  s2-\tweak to-barline ##f \> |
  s2\! |
  
  \barNumberCheck 17
  s2\p |
  s2 |
  s2\< |
  s2\f\> <>\! |
  s2\p |
  s4 s\cresc |
  s2 * 2 |
  
  \barNumberCheck 25
  s2\ff |
  s2 * 2 |
  s2\p |
  s4\< \tuplet 5/4 { s8. s16\! s\f } |
  s4\p\< \tuplet 5/4 { s8. s16\! s\f } |
  s2\mf\< <>\! |
  s2\ff |
  
  \barNumberCheck 33
  s8 s4.\ff |
  s2\sff |
  s2\fff |
}

% MIDI only 
pedal = {
  s2 * 8 |
  
  \barNumberCheck 9
  s2 * 8 |
  
  \barNumberCheck 17
  s2 * 8 |
  
  \barNumberCheck 25
  s2 * 8 |
  
  \barNumberCheck 33
  s2 * 2 |
  \grace { s8\sd } s2 |
  \grace { s8\su\sd } s2 |
  \grace { s8\su\sd } s2 |
  s2 <>\su |
}

forceBreaks = {
  \repeat unfold 3 { s2 \noBreak } s2 \break
  \repeat unfold 2 { s2 \noBreak } s2 \break
  \repeat unfold 4 { s2 \noBreak } s2 \break
  \repeat unfold 3 { s2 \noBreak } s2 \pageBreak
  
  s2 * 3 s2 \break
  s2 * 3 s2 \break
  s2 * 3 s2 \break
  s2 * 3 s2 \break
}

preludeTwoNotes =
\score {
  \header {
    title = "2."
    composer = "Alexander Scriabin"
    opus = "Opus 16, No. 2"
  }
  \keepWithTag layout  
  \new PianoStaff \with { 
    connectArpeggios = ##t 
    \override StaffGrouper.staff-staff-spacing = 
      #'((basic-distance . 10)
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

preludeTwoMidi =
\book {
  \bookOutputName "prelude-op16-no02"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics \pedal >>
      \new Staff = "lower" << \leftHand \dynamics \pedal >>
    >>
    \midi{}
  }
}
