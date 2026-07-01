# 🛒 E-Commerce Sales Analytics & Business Intelligence Solution

## 📌 Project Overview

This project demonstrates the development of a complete **End-to-End Business Intelligence (BI) Solution** using the **Microsoft BI Stack**, covering the entire data lifecycle from data generation and ETL processing to data warehousing, reporting, and dashboard visualization.

The objective of this project is to design and implement an enterprise-style **E-Commerce Sales Analytics Platform** capable of supporting business decision-making through robust ETL pipelines, dimensional modeling, reporting services, and interactive dashboards.

---

# 🏗️ Project Architecture

```text
Source Layer
      │
      ▼
Ecommerce_Source
      │
      ├── OrderDetails
      ├── ProductDetails
      └── CustomerDetails
      │
      ▼
Ecommerce_Staging
      │
      ├── stg_Orders
      ├── stg_Products
      └── stg_Customers
      │
      ▼
Ecommerce_DW
      │
      ├── DimDate
      ├── DimCustomer
      ├── DimProduct
      ├── DimPayment
      ├── DimLocation
      └── FactSales
      │
      ▼
Business Intelligence Layer
      │
      ├── SSRS Dashboard
      └── Power BI Dashboard
```

---

# ⭐ Star Schema Design

```text
                     DimDate
                        │
                        │
DimLocation ── DimCustomer
                        │
                        │
DimProduct ─── FactSales ─── DimPayment
```

---

# 🚀 Project Components

## 1. Source Layer

The source layer contains raw transactional and master data generated for the e-commerce business environment.

### Source Tables

* OrderDetails
* ProductDetails
* CustomerDetails

---

## 2. Staging Layer

The staging layer serves as the intermediate ETL processing environment where source data is extracted, cleansed, transformed, and prepared for loading into the Data Warehouse.

### Staging Tables

* stg_Orders
* stg_Products
* stg_Customers

---

## 3. Data Warehouse Layer

A dimensional data warehouse was designed using the Star Schema approach to support analytical reporting and business intelligence requirements.

### Dimension Tables

* DimDate
* DimCustomer
* DimProduct
* DimPayment
* DimLocation

### Fact Table

* FactSales

---

# 🔄 ETL Implementation using SSIS

SQL Server Integration Services (SSIS) was used to build the ETL pipeline, including:

* Data Extraction
* Data Transformation
* Data Cleansing
* Lookup Transformations
* Incremental Loading
* Derived Columns
* Error Handling
* Data Validation

### ETL Workflow

```text
Source Tables
      │
      ▼
Staging Tables
      │
      ▼
Dimension Tables
      │
      ▼
Fact Table
      │
      ▼
Reporting & Analytics
```

---

# 📊 Reporting using SSRS

SQL Server Reporting Services (SSRS) was used to develop business reports and dashboards that provide insights into:

* Revenue Analysis
* Customer Analysis
* Product Performance
* Payment Analysis
* Geographic Analysis
* Sales Trends

---

# 📈 Power BI Dashboard

Power BI was integrated with the Data Warehouse to create an interactive Executive Dashboard featuring:

* Total Revenue KPI
* Total Orders KPI
* Customer Analytics
* Product Performance
* Payment Method Analysis
* Monthly Revenue Trends
* Geographic Sales Analysis
* Interactive Filters and Slicers

---

# 🖼️ Project Screenshots

## Database & SSMS Tables

### Source Layer

![Source Table](Images/Source%20table%20of%20SSMS.png)

### Staging Layer

![Staging Table](Images/Staging%20table%20of%20SSMS.png)

### Data Warehouse Dimensions

![Dimension Table](Images/Dimention%20table%20of%20SSMS.png)

---

## ETL Pipeline (SSIS)

![SSIS ETL Process](Images/SSIS%20ETL%20Process.png)

---

## SSRS Dashboard

![SSRS Design](Images/Using%20SSIS%20Design%20SSRS%20Report%20Dashborad.png)

![SSRS Dashboard](Images/SSRS%20Report%20Dashborad%20WebURL.png)

---

## Power BI Dashboard

![Power BI Dashboard](Images/PowerBI%20Dashboard.png)

---

# 🛠️ Technologies Used

* Microsoft SQL Server
* SQL Server Management Studio (SSMS)
* SQL Server Integration Services (SSIS)
* SQL Server Reporting Services (SSRS)
* Microsoft Power BI
* Data Warehousing
* ETL Development
* Star Schema Modeling
* Business Intelligence
* SQL

---

# 📊 Key Business Metrics

* Total Revenue
* Total Orders
* Total Customers
* Average Order Value
* Product Performance
* Payment Analysis
* Customer Analysis
* Geographic Sales Analysis
* Monthly Sales Trends

---

# 🎯 Skills Demonstrated

* Data Warehousing
* ETL Pipeline Development
* SQL Development
* Star Schema Design
* Dimensional Modeling
* SSIS Development
* SSRS Reporting
* Power BI Dashboarding
* Business Intelligence
* Data Analytics

---

# 📚 Learning Outcomes

Through this project, I gained practical experience in:

* Designing enterprise-level ETL pipelines
* Building dimensional data warehouses
* Implementing incremental loading strategies
* Developing business intelligence reports
* Creating interactive analytical dashboards
* Applying real-world Business Intelligence concepts using the Microsoft BI stack

---

# 👨‍💻 Author

**Srija Biswas**

End-to-End Business Intelligence | Data Analytics | Data Engineering | SQL Server | Power BI
