"""API entry point."""

from fastapi import FastAPI

app = FastAPI(title="Book Shelf API")


@app.get("/health")
def health() -> dict[str, str]:
    """Report that the API is up (used by health checks)."""
    return {"status": "ok"}
