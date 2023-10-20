%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"

\include "includes/header-paper.ily"
\include "includes/title-page.ily"
\include "includes/prelude-op16-no01-parts.ily"
\include "includes/prelude-op16-no02-parts.ily"
\include "includes/prelude-op16-no03-parts.ily"
\include "includes/prelude-op16-no04-parts.ily"
\include "includes/prelude-op16-no05-parts.ily"

% Title page

\titlePage

% Table of contents

\bookpart {
  \header {
    title = ##f
    subtitle = ##f
    composer = ##f
    arranger = ##f
    copyright = ##f
    tagline = ##f
  }
  \markuplist \table-of-contents
}

% PDFs

\tocItem \markup "Prelude no. 1 in B major"
\preludeOneNotes
\pageBreak

\tocItem \markup \concat { 
  "Prelude no. 2 in G" \raise #0.75 \teeny \sharp " minor" 
}
\preludeTwoNotes
\pageBreak

\tocItem \markup \concat { 
  "Prelude no. 3 in G" \raise #0.75 \teeny \flat " major" 
}
\preludeThreeNotes
\pageBreak

\tocItem \markup \concat { 
  "Prelude no. 4 in E" \raise #0.75 \teeny \flat " minor" 
}
\preludeFourNotes
\pageBreak

\tocItem \markup \concat { 
  "Prelude no. 5 in F" \raise #0.75 \teeny \sharp " major" 
}
\preludeFiveNotes

% Midi

\preludeOneMidi
\preludeTwoMidi
\preludeThreeMidi
\preludeFourMidi
\preludeFiveMidi
