Bu repository **Oracle** üzərində tam **satış məlumatları modelinin** yaradılması üçün nəzərdə tutulmuş **SQL skriptlərini** ehtiva edir.
Test məqsədləri, analiz və **Power BI kimi BI alətləri ilə inteqrasiya** üçün hazırlanmışdır.

**Məzmun**

**Ölçü (Dimension) cədvəlləri**
dim_customer: Müştəri məlumatları (ID, ad, cins, doğum tarixi, şəhər)
dim_product: Məhsul kataloqu (ID, ad, kateqoriya, qiymət)
dim_date: Zaman analitikası üçün tarix cədvəli
dim_store: Mağazalar və regionlar

**Fakt cədvəli**
fact_sales: Müştərilər, məhsullar, mağazalar və tarixlər arasında əlaqəni saxlayan satış tranzaksiyaları

**Paketlər**
sales_data_pkg: `FORALL` istifadə etməklə **1000-dən çox tranzaksiyanı** bulk insert edən PL/SQL paketi
Xəta emalı (exception handling) və xətaların `error_log` cədvəlinə yazılması daxildir

**Materialized View-lar**
mv_top_products: Gəlirə görə **ən yaxşı 5 məhsulu** saxlayır (istəyə uyğun refresh oluna bilər)

**Test datası**
Dimension cədvəllərin nümunə məlumatlarla doldurulması üçün skriptlər
`fact_sales` cədvəlinə PL/SQL paket vasitəsilə random satış tranzaksiyalarının əlavə edilməsi

**İstifadə**
Öncə dimension cədvəlləri yaradın (01_dim_tables.sql).
Fact cədvəlini və error log-u yaradın (02_fact.sql).
Dimension cədvəlləri test datası ilə doldurun (04_test_data.sql).
PL/SQL paketini compile edin (03_bulk_pkg.sql) və bulku satış datası yaratmaq üçün icra edin.
İstəyə bağlı olaraq analitika üçün materialized view-ları yaradın (05_mv_top_products.sql).


---Power BI 

# HR Analytics Dashboard

Bu layihə HR (İnsan Resursları) üzrə əsas göstəriciləri vizual şəkildə izləmək və analiz etmək üçün hazırlanmış interaktiv dashboard-dur.

## 🧭 Məqsəd
- İşçi axını (attrition) və saxlanma göstəricilərinin izlənməsi
- Demoqrafik və peşə bölgülərinin analizi
- Maaş aralığı və yaş qruplarına görə paylanmanın qiymətləndirilməsi
- HR qərarlarının data əsaslı verilməsinə dəstək

## 📊 Əsas Göstəricilər (KPIs)
- **İşçilərin sayı:** 1242  
- **İşdən çıxma sayı:** 238  
- **İşdən çıxma faizi:** 16.1%  
- **Qadın işçilər:** 87  
- **Kişi işçilər:** 151  

## 📈 Vizual Bölmələr
- **Təhsilə görə bölgü:** Life Sciences, Medical, Marketing, Technical Degree, Other, Human Resources  
- **Yaş qruplarına görə:** 18–25, 26–35, 36–45, 46–55, 55+  
- **Ailə vəziyyətinə görə:** Single, Married, Divorced  
- **Top 4 peşə:** Laboratory Technician, Sales Executive, Research Scientist, Sales Representative  
- **İş stajı (10 ilə qədər):** illərə görə trend  
- **Maaş aralığına görə:** Upto 5k, 5k–10k, 10k–15k, 15k+  

---
**Müəllif:** Emin Rəcəbli
