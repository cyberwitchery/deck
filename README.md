# cyberwitchery beamer theme

a beamer theme for cyberwitchery decks. dark or light, teal or magenta for
accents, lots of templates.

## build

```sh
make            # dark deck -> main.pdf
make light      # light variant -> main-light.pdf
make clean      # drop artifacts, keep pdfs
make cleanall   # drop artifacts and pdfs
```

`make` runs `latexmk -xelatex` (enough passes for refs to settle). by hand:
`xelatex main.tex` twice. lualatex works; pdflatex falls back to inconsolata for
the mono face.

## use in your own deck

```latex
\documentclass[aspectratio=169,11pt]{beamer}
\usetheme{Cyberwitchery}          % dark
% \usetheme[light]{Cyberwitchery} % light
```

## fonts

xelatex/lualatex want two system fonts (free on google fonts):

- **jetbrains mono**: titles, ui, code, default text
- **hanken grotesk**: prose (`\prose{...}` and block bodies)

bold is pinned to jetbrains mono bold (700); the theme loads the static faces by
path and falls back to name-based loading if they are absent. under pdflatex
neither font is required (mono falls back to inconsolata, prose renders upright).

## hooks

- `\usetheme[light]{Cyberwitchery}` / `[dark]`: palette
- `\renewcommand{\cwfootleft}{...}`: left footline label (default `cyber witchery`).
  the centre is `\insertshorttitle`; set `\title[short]{...}` to control it
- `\renewcommand{\cwkicker}{...}`: small line above the title-page title
- `\prose{...}`: switch a run to the hanken face
- section dividers are automatic (`\section{...}` emits a divider frame)

## pattern macros

reusable layouts live in the theme, so a new deck gets them for free:

| macro | makes |
|-------|-------|
| `\cwstat{120+}{caption}` | one big number with caption |
| `\cwstatrow{v}{l}{v}{l}{v}{l}` | three big numbers with hairline separators |
| `\cwpanel[width]{body}` | a hairline-bordered, padded panel |
| `\cwmaprow{label}{value}` | a labelled row for use inside `\cwpanel` |
| `\cwtimeline{rightmost-x}{...}` + `\cwmile{x}{date}{title}{desc}{fill}` | a roadmap |
| `\cwflow{left}{centre}{subtitle}{right}` | a three-node diagram with arrows |
| `\cwlogocell[width]{content}` | one cell of a logo wall |
| `\cwshot[width]{chrome}{content}` | a framed, aspect-fit screenshot |
| `\cwphoto{centre}{title}{desc}` | a full-bleed photo (call inside a `[plain]` frame) |
| `\cwlogo[colour]{width}` / `\cwlogoright[colour]{width}` | the logo mark, inline or as a right-side overlay |

colours come from the palette, so all of these work in light and dark.

## colours

`cwGround cwInk cwBody cwMuted cwFaint cwPipe cwPanel cwPanelFaint cwChip
cwChipText cwRule cwGhost cwTeal cwMagenta`, plus `cwaccent` (teal) and
`cwaccentb` (magenta).

### charts (pgfplots)

two axis styles; numbers stay in jetbrains mono, accents applied. supply your own
`\addplot` data (use `cwTeal` / `cwMagenta` for series):

```latex
\begin{axis}[cw bar]  ... \end{axis}   % bars, no axis lines, values above
\begin{axis}[cw line] ... \end{axis}   % hairline axes, transparent legend
```

### tables

`booktabs` and `colortbl` are loaded by the theme. tint the emphasis column with
`>{\columncolor{cwPanel}}`, colour rules with `\arrayrulecolor{cwRule}`.

<hr/>

have fun!
