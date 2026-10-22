"""API entry point (week 1 skeleton)."""


def health() -> dict[str, str]:
    """Report that the API is up (used by health checks)."""
    return {"status": "ok"}
