# Flutter Projesi Kurulum ve Kullanım Kılavuzu

## Proje Hakkında
Bu proje, **Visual Studio Code** üzerinde geliştirilmiş bir **Flutter** uygulamasıdır. Projede toplam **8 adet Dart dosyası** bulunmaktadır. Bunlar:

- **main.dart**: Ana sayfa dosyası
- **home_screen.dart**: Ana ekran dosyası
- **detail.dart**: Home screen altında bulunan, veritabanı sayfalarının detaylarını gösteren dosyalar
- **chatbot**: Google Colab üzerinde **Python** dili ile geliştirilmiş, **HTML yapısı üzerinde çalışan** bir chatbot
- **drawmenu.dart**: Webden çekilmiş linkleri içeren yan menü

Bu proje, donanım ve zaman kısıtlamalarından dolayı henüz **APK formatına çevrilememiştir**, ancak ilerleyen süreçte dönüştürülmesi planlanmaktadır.

## Kurulum Talimatları
Aşağıdaki adımları takip ederek projeyi kendi bilgisayarınıza kurabilir ve çalıştırabilirsiniz.

### 1. Gerekli Bağımlılıkları Kurma
Flutter uygulamasını çalıştırmadan önce aşağıdaki araçların kurulu olduğundan emin olun:

- **Flutter SDK**: [Flutter Kurulumu](https://flutter.dev/docs/get-started/install)
- **Dart SDK** (Flutter ile birlikte gelir)
- **Visual Studio Code** veya **Android Studio**
- **Git** (Projeyi GitHub üzerinden klonlamak için)
- **Android veya iOS Emulator / Gerçek Cihaz** (Uygulamayı test etmek için)

### 2. Projeyi İndirme ve Çalıştırma
Proje GitHub üzerinden aşağıdaki komutlarla indirilebilir:

```sh
# GitHub üzerinden projeyi klonlayın
git clone <REPO_LINK>

# Proje dizinine girin
cd <PROJE_KLASÖRÜ>

# Flutter bağımlılıklarını yükleyin
flutter pub get

# Uygulamayı çalıştırın
flutter run
```

**Not:** Eğer proje çalıştırma esnasında hata alırsanız, aşağıdaki komut ile Flutter ortamını kontrol edebilirsiniz:
```sh
flutter doctor
```
Bu komut, eksik bağımlılıkları ve hataları gösterir. Çözüme ulaşmak için eksik olan bileşenleri yükleyin.

### 3. Chatbot Entegrasyonu
Projede bir **chatbot** entegrasyonu bulunmaktadır. Bu chatbot, **Google Colab** üzerinde Python dili ile geliştirilmiş ve **HTML tabanlı** olarak çalıştırılmaktadır.

#### Chatbot'u Çalıştırmak İçin:
1. Google Colab’de ilgili dosyayı açın.
2. **Tüm kod bloklarını çalıştırın.**
3. Web üzerinden sunucu açıldığında belirtilen **URL’yi Flutter uygulamasına entegre edin.**

### 4. DrawMenu ve Web Linkleri
Proje içerisinde bulunan **DrawMenu**, webden çekilen bazı linkleri içermektedir. Bu nedenle, internet bağlantınızın aktif olduğundan emin olun.

## Proje Hakkında Ekstra Bilgiler
- Proje geliştirme sırasında **Flutter’ın renderlama zorlukları** ve donanım kısıtlamaları nedeniyle APK haline getirilmemiştir.
- **Geliştirme ortamı** olarak **Visual Studio Code** kullanılmıştır.
- **Veritabanı yönetimi**, `detail.dart` dosyaları üzerinden sağlanmaktadır.

### Kullanım ve Katkıda Bulunma
Projeye katkıda bulunmak için aşağıdaki adımları takip edebilirsiniz:

1. **GitHub üzerinde projeyi forkladıktan sonra** kendi dalınızı oluşturun:
   ```sh
   git checkout -b yeni-ozellik
   ```
2. **Değişiklikleri yapıp commitleyin:**
   ```sh
   git commit -m "Yeni özellik eklendi"
   ```
3. **GitHub’a pushlayın ve bir Pull Request oluşturun:**
   ```sh
   git push origin yeni-ozellik
   ```
4. Pull Request incelendikten sonra ana projeye eklenebilir.

Bu kılavuz, projeyi başarılı bir şekilde indirmenize, çalıştırmanıza ve geliştirmenize yardımcı olacaktır. Eğer herhangi bir sorun yaşarsanız, **Flutter dökümantasyonunu** veya **proje deposundaki sorunlar (issues) sekmesini** kontrol edebilirsiniz.

herhangi bir sorun yaşarsanız nurdogangunes.online adresinden veya @nurdogan.gunes1 adresinden iletişime geçebilirsiniz:)

