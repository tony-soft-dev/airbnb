SELECT
  r.*, h.created_at
FROM
  {{ ref('fct_reviews') }} r
LEFT JOIN
  {{ ref('dim_listings_cleansed') }} h
    ON r.listing_id = h.listing_id
WHERE
  r.review_date < h.created_at
LIMIT 10