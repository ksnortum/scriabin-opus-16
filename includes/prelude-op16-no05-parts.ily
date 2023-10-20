%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

%%% Posistions and shapes %%%

slurShapeA = \shape #'((0 . -2) (0 . 0) (0 . 0) (0 . 0)) \etc
slurShapeB = \shape #'(
                        ((0 . 7) (0 . 7) (0 . 7) (0 . 7))
                        ((0.5 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ) \etc

moveDynamicA = \tweak extra-offset #'(0 . -4) \etc

%%% Music %%%

global = {
  \time 3/8
  \key fs \major
  \accidentalStyle piano
}

rightHandUpper = \relative {
  \set Score.tempoHideNote = ##t
  \textMark \markup \tempo-markup Allegretto #3 #0 126
  \tempo 8 = 126
  \voiceOne 
  cs'8.-\slurShapeA (^\mf\noBeam ds16-- gs--[ as--] |
  b8.\noBeam cs16 css[ ds] |
  as'16 gs ds b as gs |
  es16[ fs gs fs ds') r32 ds,]-\slurShapeB ( |
  cs8.\noBeam ds16-- gs--[ as--] |
  b8.\noBeam cs16 css[ ds] |
  as'16 gs ds b as gs |
  es16 fs as cs \oneVoice <fs, fs'>8)\noBeam |
  
  \barNumberCheck 9
  \voiceOne fs8.(\noBeam gs16 cs[ ds] |
  fs,8.\noBeam gs16 cs[ ds] |
  cs4. |
  cs16 b as gs fs ds |
  cs8.-\moveDynamicA ^\mf \noBeam ds16-- gs--[ as--] |
  b8.\noBeam cs16 css[ ds] |
  as'16 gs ds b as gs |
  es16 fs as cs \oneVoice <fs, fs'>8)\noBeam |
  
  \barNumberCheck 17
  \voiceOne fs8.(\noBeam gs16 cs[ ds] |
  fs,8.\noBeam gs16 cs[ ds] |
  cs4. |
  cs16 b as gs fs ds |
  cs8.\noBeam ds16-- gs--[ as--] |
  b8.\noBeam cs16 css[ ds] |
  as'16 gs ds b as gs |
  es16 fs as cs \oneVoice <fs, fs'>8)\noBeam |
  \bar "|."
}

rightHandLower = \relative {
  \voiceTwo 
  r16 es~ <es b'>4 |
  r16 cs'~ <cs es>4 |
  r8 r <b es> |
  as4 s8 |
  r16 es~ <es b'>4 |
  r16 cs'~ <cs es>4 |
  r8 r <b es> |
  as4 s8 |
  
  \barNumberCheck 9
  r16 as~ <as e'>4 |
  r16 as~ <as e'>4 |
  cs'16 fs, ds fs, ds' fs |
  s4. |
  r16 es,~ <es b'>4 |
  r16 cs'~ <cs es>4 |
  r8 r <b es> |
  as4 s8 |
  
  \barNumberCheck 17
  r16 as~ <as e'>4 |
  r16 as~ <as e'>4 |
  cs'16 fs, ds fs, ds' fs |
  s4. |
  r16 es,~ <es b'>4 |
  r16 cs'~ <cs es>4 |
  r8 r <b es> |
  as4 s8 |
}

rightHand = {
  \global
  \mergeDifferentlyDottedOn
  <<
    \new Voice \rightHandUpper
    \new Voice \rightHandLower
  >>
}

leftHand = \relative {
  \global
  \clef bass
  cs,8 gs'\sd es' |
  gs8\su cs,\sd b' |
  \clef treble ds'4 \clef bass <cs,, cs'>8 |
  <fs cs'>4 <bs, gs'>8 |
  cs,8 gs' es' |
  gs8 cs, b' |
  \clef treble ds'4 \clef bass <cs,, cs'>8 |
  <fs cs'>8.\noBeam cs16\noBeam <fs, as'>8 |
  
  \barNumberCheck 9
  fs8 cs' as' |
  fs,8 cs' as' |
  b,,8 b' fs' |
  \tuplet 4/3 { gs,,8 gs' fs' b } |
  cs,,8 gs' es' |
  gs8 cs, b' |
  \clef treble ds'4 \clef bass <cs,, cs'>8 |
  \after 8. \sd <fs cs'>8.\noBeam cs16\noBeam <fs, as'>8 |
  
  \barNumberCheck 17
  fs8 cs' as' |
  fs,8 cs' as' |
  b,,8\su\sd b' fs' |
  \tuplet 4/3 { gs,,8 gs' fs' b } |
  cs,,8 gs' es' |
  gs8 cs, b' |
  \clef treble ds'4 \clef bass <cs,, cs'>8 |
  <fs cs'>8.\noBeam cs16\noBeam <fs, as'>8 |
}

dynamics = {
  \override DynamicTextSpanner.style = #'none
  \override TextScript.Y-offset = -0.5
  s4.-\tweak Y-offset -3 ^\rubato |
  s8. s\> |
  s4.\pp |
  s4. * 2 |
  s8. s\> |
  s4.\pp |
  s4. |
  
  \barNumberCheck 9
  s8. s\cresc |
  s4. |
  s4.-\tweak Y-offset -3 \f |
  s4.\> <>\! |
  s4. |
  s16 s\> s4 <>\! |
  s4.\pp |
  s4. |
  
  \barNumberCheck 17
  s8. s\cresc |
  s4. |
  s4.-\tweak Y-offset -3 \f |
  s4.-\tweak Y-offset 1 \> <>\! |
  s4 s8\dim |
  s4.\> <>\! |
  s4.\pp |
  s4. |
}

% MIDI only
% The few pedal marks that are Scriabin's are in the leftHand music part.
% The pedaling below tries to match Scriabin's suggestions.
pedal = {
  s8 s4\sd |
  s8\su s4\sd |
  s4.\su |
  s4. |
  s8 s4\sd |
  s8\su s4\sd |
  s4.\su |
  s4. |
  
  \barNumberCheck 9
  s8 s4\sd |
  s8\su s4\sd |
  s4.\su\sd |
  s4.\su\sd
  s8\su s4\sd |
  s8\su s4\sd |
  s4.\su |
  s8. s8.\sd |
  
  \barNumberCheck 17
  s8\su s4\sd |
  s8\su s4\sd |
  s4.\su\sd |
  s4.\su\sd
  s8\su s4\sd |
  s8\su s4\sd |
  s4.\su |
  s4. |
}

% Not used
forceBreaks = {
  s4. * 3 s4. \break
  s4. * 4 s4. \break
  s4. * 4 s4. \break
  s4. * 4 s4. \break
}

preludeFiveNotes =
\score {
  \header {
    title = "5."
    composer = "Alexander Scriabin"
    opus = "Opus 16, No. 5"
  }
  \keepWithTag layout  
  \new PianoStaff <<
    \new Staff = "upper" \rightHand
    \new Dynamics \dynamics
    \new Staff = "lower" \leftHand
    % \new Devnull \forceBreaks
  >>
  \layout {}
}

\include "articulate.ly"

preludeFiveMidi =
\book {
  \bookOutputName "prelude-op16-no05"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics \pedal >>
      \new Staff = "lower" << \leftHand \dynamics \pedal >>
    >>
    \midi{}
  }
}
