"""Tests for the health check route."""

from fastapi.testclient import TestClient

from book_shelf.main import app

# Fake browser: sends real HTTP requests straight to the app, in memory,
# without starting a server (no uvicorn, no network, no port).
client = TestClient(app)


def test_health_returns_ok() -> None:
    response = client.get("/health")

    assert response.status_code == 200
    assert response.json() == {"status": "ok"}
