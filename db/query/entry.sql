-- name: CreateEntry :one
INSERT INTO entries(
    account_id,
    amount
)
VALUES(
    $1, $2
) RETURNING *;

-- name: GetEntry :one
SELECT * FROM entries
WHERE id = $1 LIMIT 1;

-- name: ListEntries :many
SELECT * FROM entries
ORDER BY id
LIMIT $1
OFFSET $2;

-- name: GetEntriesByAccountID :many
SELECT * FROM entries
WHERE account_id = $1
ORDER BY id desc
LIMIT $2
OFFSET $3;

-- name: UpdateEntry :one
UPDATE entries
SET amount = $2
WHERE id = $1
RETURNING *;

-- name: DeleteEntry :exec
DELETE FROM entries
WHERE id = $1;

