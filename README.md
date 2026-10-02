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

[Watch the demo video](demo/PS2_tiny.mp4)

### Demonstrated operations

- **Add Book:** Enter a title and author. Codex identifies the genre, and the application saves the book.
- **Status: Finished:** Mark a book as read.
- **Rate Book:** Save a rating from 1 to 5.
- **Get Recommendations:** Three Codex-powered programs run in parallel, using my library, interests, and discovery. Their outputs are combined through a pipe and refined into up to five recommendations.
- **Quit:** Exit the menu loop and return to the terminal.
