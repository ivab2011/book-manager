# Iva's Book Manager

A personal terminal application for managing books and discovering new reads.

## How to run

Requirements: Bash, Gum, Python 3, and the Codex CLI installed and signed in.

From the project directory, run:

    bash app.sh

## Architecture

The application consists of small Bash scripts organized into UI, workflows, book components, recommendation components, and a data layer. Only data/book_database.sh accesses books.csv directly; it uses Python's CSV module for some operations. Three recommendation programs run in parallel. Their outputs are combined and piped into a refinement program.

## Personalization

I personalized the application with my own library, reading statuses, ratings, and interests entered when requesting recommendations. It suggests books based on my saved library, my interests, and topics outside my usual preferences. The interface includes my name and lets me track my reading.

## Demo video

Video link will be added before submission.
