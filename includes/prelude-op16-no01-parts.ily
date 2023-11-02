%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

%%% Posistions and shapes %%%

slurShapeA = \shape #'((0 . 1) (0 . -0.5) (0 . 0) (0 . 0)) \etc
slurShapeB = \shape #'((0 . 0) (0 . -2) (0 . 0) (0 . 0)) \etc
slurShapeC = \shape #'(
                        ((0 . -2) (0 . 0) (0 . 0) (0 . 0))
                        ((0 . -1) (0 . 0) (0 . 0) (0 . -1))
                        ()
                        ) \etc
slurShapeD = \shape #'(
                        ()
                        ((0 . 0) (0 . -3) (0 . 0.5) (0 . 0))
                        ) \etc
slurShapeE = \shape #'((0 . 0) (0 . -3) (0 . 1.5) (0 . 0)) \etc
slurShapeF = \shape #'((0 . 1.5) (0 . 0) (0 . 0) (0 . 0)) \etc

moveFingerA = -\tweak Y-offset 3.5 \etc
moveFingerB = -\tweak Y-offset 4 \etc
moveFingerC = -\tweak Y-offset 6 \etc
moveFingerD = 
  -\tweak X-offset 0.5
  -\tweak Y-offset -5 
  \etc

moveDynamicA = \tweak extra-offset #'(-3 . -5) \etc
moveDynamicB = \tweak extra-offset #'(-3 . -5) \etc

moveTextA = 
  \tweak outside-staff-priority ##f
  \tweak avoid-slur #'inside
  \tweak Y-offset 5.5
  \etc
moveTextB = 
  \tweak outside-staff-priority ##f
  \tweak avoid-slur #'inside
  \tweak X-offset 2
  \tweak Y-offset 3
  \etc
moveTextC = 
  \tweak outside-staff-priority ##f
  \tweak avoid-slur #'inside
  \tweak X-offset 2
  \tweak Y-offset 3
  \etc

%%% Music %%%

global = {
  \time 3/4
  \key b \major
  \accidentalStyle piano
}

rightHandUpper = \relative {
  \partial 8 * 2/3 r8 * 2/3
  R2. * 2 |
  gs''4( fs8 e \tuplet 3/2 { ds cs ds 
  fs4 e8  ds cs ds } gs,4 |
  cs8 b \tuplet 3/2 { gs as b } ds cs |
  gs2 fs4) |
  cs''4( b8 a \tuplet 3/2 { gs fs gs |
  b4 gs8 fs e fs } b,4 |
  
  \barNumberCheck 9
  e8 ds \tuplet 3/2 { gs, as b } ds cs |
  b2.) |
  \voiceOne \hideNoteHead as'4-\slurShapeC ( 
    \tuplet 3/2 { r4 r8 as'-\moveDynamicA ^\pp gs as } |
  ds,4 cs8[ b] as[ gs] |
  s4 \tuplet 3/2 { r4 r8 gs'-\moveDynamicB ^\pp fs gs } |
  cs,4 b8[ a] gs[ fs] |
  \tuplet 3/2 { gs8-\moveTextA ^\accel fss gs } b,4 g' |
  \tuplet 3/2 { fs8 es fs } b,4 ds |
  
  \barNumberCheck 17
  ds4-\moveTextB ^\rubato fs, b |
  ds4-\moveTextC ^\rit cs e,) |
  \oneVoice gs'4( fs8 e \tuplet 3/2 { ds cs ds 
  fs4 e8  ds cs ds } gs,4 |
  cs8 b \tuplet 3/2 { gs as b  ds4 cs8 } |
  gs2 fs4) |
  cs''4(\mf b8 a \tuplet 3/2 { gs fs gs |
  b4 gs8 fs e fs } b,4) |
  
  \barNumberCheck 25
  cs4(^\pp \tuplet 3/2 { b a8  gs fs gs |
  b4 gs8  fs e fs } b,4) |
  fs'4( gs' b, |
  as4 cs' e, |
  ds4 fs' a, |
  gs4 b' e,) |
  g,4( cs' fs,, |
  as'4 e, g' |
  
  \barNumberCheck 33
  g,4 cs fs, |
  as4 e g) |
  r4 <c, g'>( <g e'> |
  <e c'>4 <c g'> <g e'> |
  <e c'>4) <e g c> q |
  q4 q q |
  <ds fs b ds>2. |
  q2.~ |
  
  \barNumberCheck 41
  q2. |
  R2. |
  \bar "|."
}

rightHandLower = \relative {
  \voiceTwo
  \partial 8 * 2/3 s8 * 2/3
  s2. * 8 |
  
  \barNumberCheck 9
  s2. * 2 |
  \tuplet 3/2 { as''8^- gs^- as^- } ds,2-- |
  r8 fs es[ ds] cs[ gs'] |
  \tuplet 3/2 { gs8^- fs^- gs^- } cs,2-- |
  r8 e ds[ cs] b[ fs'] |
  <b, ds>4 ds, <b' ds> |
  <b ds>4 ds, <es b'> |
  
  \barNumberCheck 17
  <fs b>4 ds ds |
  e2 s4 |
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

leftHandUpper = \relative {
  \voiceThree 
  \scaleDurations 2/3 {
    \partial 8 s8 |
    s4. b4---\moveFingerA -1 cs---\moveFingerB -1 gs'8---\moveFingerC -1 s |
    s4. b,4 cs gs'8 s |
    s4. b,4 cs gs'8 s |
    s4. b,4 cs gs'8 s |
    s4. b,4 cs gs'8 s |
    s4. gs,4 as fs'8 s |
    s4. e4 fs cs'8 s |
    s4. cs,4 ds b'8 s |
    
    \barNumberCheck 9
    s4. cs,4 e gs8 s |
    s2. s4. |
    s4. gs4 b ds8 s |
    s2. s4. |
    s4. fs,4 a cs8 s |
  }
  s2. * 3 |
  
  \barNumberCheck 17
  s2. * 2 |
  \scaleDurations 2/3 {
    s4. b,4 cs gs'8 s |
    s4. b,4 cs gs'8 s |
    s4. b,4 cs gs'8 s |
    s4. gs,4 as fs'8 s |
    s4. cs4 ds b'8 s |
    s4. cs,4 e b'8 s |
    
    \barNumberCheck 25
    s4. cs,4 ds b'8 s |
    s4. cs,4 e b'8 s |
    s4. b,4 cs gs'8 s |
    s4. gs,4 as gs'8 s |
    s4. cs,4 ds cs'8 s |
    s4. cs,4 e b'8 s |
    s4. e,4 fs g8 s |
    s4. e4 fs g8 s |
    
    \barNumberCheck 33
    s4. e4 fs g8 s |
    s4. e4 fs g8 s |
  }
}

leftHandLower = \relative {
  \scaleDurations 2/3 { 
    \partial 8 \slurDown fs,8(
    b,8 fs' cs'_5  b' gs_2 cs  e,_4 gs') fs,,-\slurShapeA ( -\moveFingerD _2 |
    b,8-\insideSlur _5 fs'_2 cs'_5  b' gs cs  e, gs') fs,,( |
    b,8 fs' cs'  b' gs cs  e, gs') fs,,( |
    b,8 fs' cs'  b' gs cs  e, gs') fs,,( |
    b,8 fs' cs'  b' gs cs  e, gs') fs,,( |
    b,8 fs' cs'  gs' fs as  e fs') fs,,( |
    b,8 b' fs'  e' cs fs  a, cs') b,,( |
    b,8 b' fs'  cs' b ds  a b') b,,( |
    
    \barNumberCheck 9
    cs,8 gs' e'  cs' gs e'  as, gs') gs,,-\slurShapeB ^(
    gs,8 gs' ds'  ds' b gs'  ds gs,) ds-\slurShapeF ( | 
    gs,8 ds' b'  gs' fs b  ds, ds') b,-\slurShapeD ^( |
    cs,8 b' cs  gs' gs, es'
  } b'16 cs, b) cs,^~( |
  \scaleDurations 2/3 {
    \slurUp <fs, cs'>8\sd cs' a'  fs' e a  cs, cs') a,-\slurShapeE ( |
    b,8 a' b  fs' fs, ds'
  } a'16 b, a) b,( |
  \scaleDurations 2/3 {
    e,8 b' b'~  b b b,  es, ds' b') |
    fs,8( ds' b'~  b b ds,  g, ds' b') |
    
    \barNumberCheck 17
    fs,8( ds' b'  as gs fs  gs fs b,) |
    fs,8( fs' cs'  as' gs fs
  } b16 gs cs,) \slurDown fs,( |
  \scaleDurations 2/3 {
    b,8 fs' cs'  b' gs cs  e, gs') fs,,( |
    b,8 fs' cs'  b' gs cs  e, gs') fs,,( |
    b,8 fs' cs'  b' gs cs  e, gs') fs,,( |
    b,8 fs' cs'  gs' fs as  e fs') fs,,( |
    b,8^\pp b' fs'  cs' b ds  a b') b,,( |
    b,8 b' gs'  cs b e  gs, b') b,,( |
    
    \barNumberCheck 25
    b,8 b' fs'  cs' b ds  a b') b,,( |
    b,8 b' gs'  cs b e  gs, b') b,,( |
    b,8 fs' cs'  b' gs cs  e, gs') fs,,( |
    b,8 fs' cs'  gs' fs as  e gs') fs,,( |
    b,8 fs' fs'  cs' b ds  a cs') b,,( |
    b,8 b' gs'  cs b e  gs, b') b,,( |
    b,8 b' g'  e' cs fs  as, g') b,,( |
    b,8 b' g'  e' cs fs  as, g') b,,( |
    
    \barNumberCheck 33
    b,8 b' g'  e' cs fs  as, g') b,,( |
    b,8 b' g'  e' cs fs  as, g') b,,^( |
    b,8 b' g'  e' as, c  as e c |
    as'8 e g,
  } b,4) r4 |
  r4 <b g' c> q |
  q4 q q |
  <b fs' b>2. |
  q2. |
  
  \barNumberCheck 41
  \ottava -1 b,2.~ |
  b2. |
}

leftHand = {
  \global
  \clef bass
  <<
    \new Voice \leftHandUpper
    \new Voice \leftHandLower
  >>
}

dynamics = {
  \override DynamicTextSpanner.style = #'none
  \scaleDurations 2/3 {
    \partial 8 s8-\tweak Y-offset -3 \mf
    s2. s4 s8-\tweak extra-offset #'(0.5 . -4) \pp |
  }
  s2. |
  s2-\tweak Y-offset -2 ^\cantabile s8 s\< <>\! |
  s8.\> s16\! s2 |
  s2.\cresc |
  s2. |
  s2.\mf |
  s2. |
  
  \barNumberCheck 9
  s2.\dim |
  s2.\p |
  s2.\p |
  s8\< s8\! s4.\> s8\! |
  s2. * 2 |
  s2.\cresc |
  s2. |
  
  \barNumberCheck 17
  s2\f s4\dim |
  s2. |
  s2.-\tweak X-offset 0 \pp |
  s2. * 5 |
  
  \barNumberCheck 25
  s2. * 3 |
  s8 s\cresc s2 |
  s2. * 2 |
  s2.\f |
  s2.\dim |
  
  \barNumberCheck 33
  s2. |
  s4\p s2\dim |
  s2. * 2 |
  s4 s2\pp |
  s2. |
  s2.\ppp |
}

% MIDI only 
% Scriabin's pedal mark is inlined with the left hand part, measure 13
pedal = {
  \partial 8 * 2/3 s8 * 2/3 
  s2.\sd |
  \repeat unfold 7 { s2.\su\sd | }
  
  \barNumberCheck 9
  \repeat unfold 6 { s2.\su\sd | }
  s2\su\sd s4\su\sd |
  s2\su\sd s4\su\sd |
  
  \barNumberCheck 17
  \repeat unfold 8 { s2.\su\sd | }
  
  \barNumberCheck 25
  \repeat unfold 8 { s2.\su\sd | }
  
  \barNumberCheck 33
  s2.\su\sd |
  s2.\su\sd |
  s2. |
  s2 s4\su |
  s4 s2\sd |
  s2. |
  s2.\su\sd |
  s2. |
  
  \barNumberCheck 41
  s2. |
  s2. <>\su |
}

tempi = {
  \set Score.tempoHideNote = ##t
  \textMark \markup \tempo-markup Andante #2 #0 40
  \tempo 4 = 40
  \partial 8 * 2/3 s8 * 2/3
  s2. * 8 |
  
  \barNumberCheck 9
  s2. * 6
  \tempo 4 = 44
  s2. |
  \tempo 4 = 48
  s2. |
  
  \barNumberCheck 17
  \tempo 4 = 44
  s2 \tempo 4 = 40 s4 |
  \tempo 4 = 36
  s2 \tempo 4 = 32 s4 |
  \tempo 4 = 40 |
  s2.
}

% Not used
forceBreaks = {
  \partial 8 * 2/3 s8 * 2/3
  s2. * 2 s2. \break
  s2. * 3 s2. \break
  s2. * 3 s2. \break
  s2. * 3 s2. \break
  s2. * 3 s2. \pageBreak
  
  s2. * 3 s2. \break
  s2. * 3 s2. \break
  s2. * 3 s2. \break
  s2. * 3 s2. \break
}

preludeOneNotes =
\score {
  \header {
    title = "1."
    composer = "Alexander Scriabin"
    opus = "Opus 16, No. 1"
  }
  \keepWithTag layout  
  \new PianoStaff <<
    \new Staff = "upper" \rightHand
    \new Dynamics \dynamics
    \new Staff = "lower" \leftHand
    \new Dynamics \tempi
    % \new Devnull \forceBreaks % Not used
  >>
  \layout {}
}

\include "articulate.ly"

preludeOneMidi =
\book {
  \bookOutputName "prelude-op16-no01"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics \pedal \tempi >>
      \new Staff = "lower" << \leftHand \dynamics \pedal \tempi >>
    >>
    \midi{}
  }
}
