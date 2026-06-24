# Contributing

Thank you for contributing to this repository. This project collects, organizes, and documents research notes, extracted references, lecture summaries, and related metadata for the TUM Summer School on HPC Driving AI.

Contributions should be accurate, well sourced, and respectful of copyright and speaker rights.

## Scope of contributions

Useful contributions include:

- corrections to lecture summaries;
- improved bibliographic metadata;
- verified DOIs, arXiv identifiers, URLs, ISBNs, and repository links;
- additional context for cited papers, software, datasets, and standards;
- reproducible scripts for extraction, transcription, validation, or formatting;
- improvements to documentation;
- corrections to spelling, formatting, and terminology.

Do not submit copyrighted material unless redistribution is permitted.

In particular, do not upload:

- original PDF lecture slides;
- audio recordings;
- verbatim lecture transcripts;
- speaker photographs;
- institutional or company logos;
- figures copied from publications or websites;
- screenshots from copyrighted material;
- publisher-owned diagrams;
- third-party datasets without a redistribution license.

If such material is needed for context, provide a citation or link instead of copying the content.

## Repository licensing

This repository uses multiple licenses.

- Original summaries, annotations, reports, and explanatory text are licensed under CC BY 4.0.
- Bibliographic metadata and extracted reference tables are released under CC0 1.0, where legally possible.
- Software scripts are licensed under the MIT License.
- Third-party materials are not covered by these licenses unless explicit permission is documented.

Before contributing, make sure that your contribution is compatible with these licenses.

By submitting a contribution, you confirm that you have the right to provide it under the relevant repository license.

## Accuracy requirements

Contributions should clearly distinguish between:

- text extracted directly from slides;
- normalized bibliographic metadata;
- inferred classification, such as journal paper, preprint, software, or website;
- the contributor's own summary or interpretation.

Do not invent missing authors, titles, years, venues, identifiers, or links.

When information is incomplete, mark it explicitly as:

- `Missing`;
- `Partial`;
- `Unclear`;
- `Needs verification`.

## Reference extraction guidelines

When adding or correcting references, inspect all available parts of a slide deck:

- slide titles;
- footnotes;
- captions;
- figure credits;
- bibliography slides;
- small text near diagrams;
- URLs and QR-code text, where readable;
- acknowledgments;
- software and dataset mentions;
- standards and specifications.

For each reference, include the following fields when available:

- slide number or slide range;
- reference type;
- authors;
- title;
- journal, conference, publisher, organization, or venue;
- year;
- DOI, arXiv ID, ISBN, URL, GitHub link, or other identifier;
- original text as written on the slide;
- context on the slide;
- completeness status.

If a reference appears on several slides, deduplicate it but record all slide numbers.

## Lecture summary guidelines

Lecture summaries should be concise, technical, and evidence based.

Where applicable, structure summaries using the following headings:

- Summary;
- Problem to be solved;
- Proposed solution;
- Implementation;
- Important discussion points;
- Research impact;
- Conclusion.

Avoid unsupported claims. If a summary is based only on the public agenda, state this clearly.

## Audio and transcript guidelines

Do not submit verbatim transcripts unless speaker consent and redistribution permission are documented.

Acceptable contributions include:

- short, original summaries of audio content;
- timestamps for topics;
- non-verbatim notes;
- transcription scripts;
- instructions for local transcription.

If you generate transcripts locally, keep them private unless permission to redistribute them has been obtained.

## Code contribution guidelines

Code contributions should be reproducible and simple to run.

For scripts, include:

- a short description;
- required dependencies;
- expected input files;
- expected output files;
- an example command;
- clear error handling where possible.

Do not hard-code private paths, credentials, tokens, or local user names.

Use readable names and comments for non-obvious logic.

## Suggested workflow

1. Fork the repository.
2. Create a branch with a descriptive name, such as:

   ```bash
   git checkout -b fix-reference-dois
   ```

3. Make focused changes.
4. Validate the affected files.
5. Commit with a clear message.
6. Open a pull request.

A good pull request should explain:

- what changed;
- why the change is needed;
- which files were affected;
- whether any information remains uncertain;
- whether new sources or links were used.

## Commit message style

Use concise, descriptive commit messages.

Examples:

```text
Fix DOI for mixed-precision reference
Add missing slide numbers for SYCL references
Clarify license notice for third-party slides
Add script for CSV validation
Update lecture summary for ICON talk
```

## Pull request checklist

Before submitting a pull request, check that:

- no copyrighted third-party material was added without permission;
- extracted references preserve the original slide text where available;
- inferred metadata is clearly marked;
- uncertain entries are marked as unclear or incomplete;
- new links are complete and valid, where possible;
- code runs without private credentials;
- license terms are respected;
- the contribution is limited to a coherent change.

## Reporting issues

Open an issue for:

- incorrect citations;
- broken or incomplete links;
- missing DOI or arXiv identifiers;
- unclear attribution;
- possible copyright concerns;
- errors in lecture summaries;
- problems with scripts or data files.

When reporting an issue, include:

- the file name;
- the relevant line number, if possible;
- the slide number, if applicable;
- the current text;
- the proposed correction;
- a source or explanation.

## Attribution

Please preserve attribution to original speakers, institutions, authors, software projects, and data sources.

No endorsement by TUM, the lecturers, their institutions, or any referenced organization is implied by this repository.

## Contact

For substantial corrections, licensing concerns, or requests to remove material, open an issue or contact the repository maintainer.