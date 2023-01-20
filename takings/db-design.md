# Takings

## ERD Diagram

```mermaid
erDiagram
    WEEK_DATE ||--o{ TAKINGS : has
    WEEK_DATE {
        integer week_no
        text day_name
        integer day
        integer month
        integer year
    }
    TAKINGS {
        float taking
        float non_vat
        float card
        float uber
    }
```
