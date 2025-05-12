# OgrenciDersTakip Projesi

Bu proje, öğrenci ve ders bilgilerini yönetmek için geliştirilmiş bir ASP.NET Core web uygulamasıdır.

## Gereksinimler

*   [.NET 9.0 SDK](https://dotnet.microsoft.com/download/dotnet/9.0)

## Kurulum

1.  Projeyi klonlayın:
    ```bash
    git clone <repository-url>
    ```
2.  Proje dizinine gidin:
    ```bash
    cd Foy5/OgrenciDersTakip
    ```
3.  Gerekli NuGet paketlerini yükleyin (genellikle otomatik olarak yüklenir):
    ```bash
    dotnet restore
    ```

## Veritabanı Kurulumu (Migrations)

Bu proje Entity Framework Core kullanmaktadır. Veritabanını oluşturmak ve güncellemek için aşağıdaki adımları izleyin:

1.  **appsettings.json** dosyasındaki `ConnectionStrings` bölümünü kendi veritabanı sunucunuza göre düzenleyin. MySQL için `DefaultConnection` ve SQL Server için `MsSQLConnection` bağlantı dizelerini kullanabilirsiniz.

2.  Migration oluşturmak için (eğer modelde değişiklik yaptıysanız):
    ```bash
    dotnet ef migrations add <MigrationAdi> -c ApplicationDbContext
    ```
    *Not: `-c ApplicationDbContext` parametresi, projenizde birden fazla DbContext varsa veya varsayılan DbContext adınız farklıysa gereklidir. Bu projede `ApplicationDbContext` kullanıldığı varsayılmıştır.*

3.  Veritabanını güncellemek için:
    ```bash
    dotnet ef database update -c ApplicationDbContext
    ```

## Projeyi Çalıştırma

Projeyi çalıştırmak için aşağıdaki komutu kullanabilirsiniz:

```bash
dotnet run --project OgrenciDersTakip.csproj
```

Alternatif olarak, Visual Studio veya tercih ettiğiniz bir IDE üzerinden projeyi açıp çalıştırabilirsiniz.

Uygulama varsayılan olarak `https://localhost:port` ve `http://localhost:port` adreslerinde çalışacaktır. Port numaraları `Properties/launchSettings.json` dosyasında belirtilmiştir.

## Kullanılan Teknolojiler

*   ASP.NET Core MVC
*   Entity Framework Core
*   MySQL (Pomelo.EntityFrameworkCore.MySql ile)
*   SQL Server (Microsoft.EntityFrameworkCore.SqlServer ile)
*   Bootstrap (varsayılan ASP.NET Core şablonu ile gelir)