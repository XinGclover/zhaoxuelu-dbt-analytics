# 📊 Zhao Xue Lu – dbt Analytics Project

## Overview

This repository contains the **dbt (data build tool) project** for transforming and analyzing scraped audience feedback data related to the Chinese drama **《朝雪录》 (Zhao Xue Lu)**.

The project focuses on turning **raw, scraped comment data** stored in PostgreSQL into **clean, tested, analytics-ready datasets** that can be used for:

- Time-series analysis
- Rating anomaly detection
- Audience behavior analysis
- BI dashboards and downstream analytics

This dbt project is part of a larger data engineering system, where data ingestion (scrapers, Kafka, Airflow) is handled upstream in a separate repository.

---

## Architecture

```text
Raw Data (PostgreSQL)
   └── public.zhaoxuelu_comments   ← scraped comments (raw)

dbt Transform Layer (this repo)
   ├── staging (views)
   │     └── stg_zhaoxuelu_comments
   └── marts (tables)
         └── fact_comment_rating_hourly

Downstream
   ├── BI tools (Metabase / Superset)
   ├── Monitoring / alerting
   └── Further analytics

