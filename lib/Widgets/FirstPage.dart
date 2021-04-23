import 'package:covid19_app/Screens/Faqs.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class sentence extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            DataSource.soz.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}


class GridSystemTurkey extends StatelessWidget {
  final Map TurkeyData;

  const GridSystemTurkey({Key key, this.TurkeyData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 2),
      children: <Widget>[
        statusPanel(
          text: "Toplam Vaka Sayısı",
          gridColor: Colors.red[100],
          textColor: Colors.red[900],
          number: TurkeyData["cases"].toString(),
        ),
        statusPanel(
          text: "vaka sayısı",
          gridColor: Colors.orange[100],
          textColor: Colors.orange[900],
          number: TurkeyData["todayCases"].toString(),
        ),
        statusPanel(
          text: "Toplam iyileşen hasta",
          gridColor: Colors.green[100],
          textColor: Colors.green[900],
          number: TurkeyData["recovered"].toString(),
        ),
        statusPanel(
          text: "iyileşen hasta",
          gridColor: Colors.blue[100],
          textColor: Colors.blue[900],
          number: TurkeyData["todayRecovered"].toString(),
        ),
        statusPanel(
          text: "Toplam vefat edenler",
          gridColor: Colors.black87,
          textColor: Colors.white,
          number: TurkeyData["deaths"].toString(),
        ),
        statusPanel(
          text: "Vefat edenler",
          gridColor: Colors.grey[300],
          textColor: Colors.black,
          number: TurkeyData["todayDeaths"].toString(),
        ),
      ],
    );
  }
}

class GridSystem extends StatelessWidget {
  final Map dunyaData;

  const GridSystem({Key key, this.dunyaData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 2),
      children: <Widget>[
        statusPanel(
          text: "Toplam Vaka Sayısı",
          gridColor: Colors.red[100],
          textColor: Colors.red[900],
          number: dunyaData["cases"].toString(),
        ),
        statusPanel(
          text: "vaka sayısı",
          gridColor: Colors.orange[100],
          textColor: Colors.orange[900],
          number: dunyaData["todayCases"].toString(),
        ),
        statusPanel(
          text: "Toplam iyileşen hasta",
          gridColor: Colors.green[100],
          textColor: Colors.green[900],
          number: dunyaData["recovered"].toString(),
        ),
        statusPanel(
          text: "iyileşen hasta",
          gridColor: Colors.blue[100],
          textColor: Colors.blue[900],
          number: dunyaData["todayRecovered"].toString(),
        ),
        statusPanel(
          text: "Toplam vefat edenler",
          gridColor: Colors.black87,
          textColor: Colors.white,
          number: dunyaData["deaths"].toString(),
        ),
        statusPanel(
          text: "Vefat edenler",
          gridColor: Colors.grey[300],
          textColor: Colors.black,
          number: dunyaData["todayDeaths"].toString(),
        ),
      ],
    );
  }
}

class statusPanel extends StatelessWidget {
  final Color gridColor;
  final Color textColor;
  final String text;
  final String number;

  const statusPanel(
      {Key key,
      this.gridColor,
      this.textColor,
      @required this.text,
      @required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widht = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      color: gridColor,
      height: 80,
      width: widht / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            number,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
          ),
        ],
      ),
    );
  }
}

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) => Faqs()),
              );
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(7)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "# Sıkça Sorulan Sorular   ",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              launch("https://www.who.int/");
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(7)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "WHO | Dünya Sağlık Örgütü ",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              launch("https://saglik.gov.tr/");
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(7)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "# T.C. Sağlık Bakanlığı   ",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}

class MostAffected extends StatelessWidget {
  final List countryData;
  const MostAffected({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, int index) {
        return Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: <Widget>[
                  Image.network(
                    countryData[index]["countryInfo"]["flag"],
                    height: 30,
                    width: 50,
                  ),
                  Text(
                    "  " + countryData[index]["country"].toString(),
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[900]),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.arrowRight,
                    size: 15,
                  ),
                  Text(
                    "vaka sayısı: " + countryData[index]["cases"].toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.arrowRight,
                    size: 15,
                  ),
                  countryData[index]["todayRecovered"] == 0
                      ? Text("iyileşen sayısı: Veri bulunamadı.",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))
                      : Text(
                          "iyileşen sayısı: " +
                              countryData[index]["todayRecovered"].toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.arrowRight,
                    size: 15,
                  ),
                  countryData[index]["todayDeaths"] == 0
                      ? Text("Ölümler: Veri bulunamadı.",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))
                      : Text(
                          "Ölümler: " +
                              countryData[index]["todayDeaths"].toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class DataSource {
  static String soz =
      "\"Sağlığınız için maske takmayı unutmayınız.Hiçbir şey sizden önemli değil,unutmayın Coronayı'ı beraber yeneceğiz!\"";

  static List questionAnswer = [
    {
      "Soru": "Yeni Koronavirüs (SARS-CoV-2) nedir?",
      "Cevap":
          "Yeni Koronavirüs (SARS-CoV-2) ilk olarak Çin’in Vuhan şehrinde tespit edilen, solunum yolu enfeksiyonu yapan bir virüstür. Yeni Koronavirüs Hastalığı’na (COVID-19) sebep olur. Bu hastalık yüksek ateş, öksürük, nefes darlığı, baş ağrısı, boğaz ağrısı, burun akıntısı, kas ve eklem ağrısı, halsizlik, koku ve tat alma duyusu kaybı, ishal gibi belirtilerle kendini gösterir.Koronavirüsler (CoV) tek zincirli RNA’ya sahip, zarflı, yüzeyinde protein çıkıntıları olan büyük bir virüs ailesidir. Hafif ve orta derecede şiddetli solunum yolu hastalıkların yanı sıra MERS (Orta Doğu Solunum Sendromu), SARS (Şiddetli Akut Solunum Sendromu) ve COVID-19 (Yeni Koronavirüs Hastalığı) gibi şiddetli seyreden hastalıklardan da sorumludur.",
    },
    {
      "Soru": "Yeni Koronavirüs Hastalığı (COVID-19) nasıl bulaşır?",
      "Cevap":
          "COVID-19, hasta kişilerin öksürme, hapşırma veya konuşmayla ortaya saçtığı damlacıkların ortamdaki diğer bireyler tarafından solunması, damlacıkların yapıştığı yüzeylere dokunduktan sonra ellerin ağız, burun veya göze götürülmesiyle bulaşır.  ",
    },
    {
      "Soru": "COVID-19'un tanısı nasıl konulur?",
      "Cevap":
          "Kesin tanı moleküler testlerle konulmaktadır. Bu testler kişiden alınan boğaz ve/veya burun sürüntüsünde virüsün genetik materyalinin aranması prensibine dayanır.  ",
    },
    {
      "Soru":
          "COVID-19'u tedavi etmek veya hastalığın oluşmasını önlemek için bir ilaç var mıdır?",
      "Cevap":
          "Hastalığın ortaya çıkmasını engellemek üzere geliştirilmiş bir ilaç bulunmamaktadır. Hasta kişilere ülkemizde hidroksiklorokin ve/veya favipravir tedavisi verilmektedir. Ayrıca hastanın genel durumuna göre gerekli destek tedavisi uygulanmaktadır.",
    },
    {
      "Soru": "COVID-19 antibiyotiklerle tedavi edilebilir mi?",
      "Cevap":
          "Hastalığın etkeni bir virüs türüdür (SARS-CoV-2). Antibiyotikler virüslerin neden olduğu enfeksiyonları önlemek veya tedavi etmek amacıyla kullanılmaz.",
    },
    {
      "Soru": "Yeni Koronavirüsün kuluçka (inkübasyon) süresi ne kadardır?",
      "Cevap": "Virüsün kuluçka süresi 2 ila 14 gündür.",
    },
    {
      "Soru": "Yeni Koronavirüs enfeksiyonunun belirtileri nelerdir?",
      "Cevap":
          "Hastalık; yüksek ateş, öksürük, nefes darlığı, baş ağrısı, boğaz ağrısı, burun akıntısı, kas ve eklem ağrısı, halsizlik, koku ve tat alma duyusu kaybı, ishal gibi belirtilerle kendini gösterir. Belirtisiz vakalar da mevcuttur. ",
    },
    {
      "Soru": "COVID-19'dan kimler daha fazla etkilenir?",
      "Cevap":
          "Elde edilen veriler doğrultusunda, ileri yaştakiler ve diyabet, astım, KOAH gibi kronik hastalığı olanlarda enfeksiyonun ağır seyretme riski yüksektir.",
    },
    {
      "Soru":
          "Sağlık Bakanlığının COVID-19'un yayılmasını önleme konusunda yaptığı çalışmalar nelerdir?",
      "Cevap":
          "- Bakanlığımız tarafından hastalıkla ilgili dünyadaki gelişmeler ve hastalığın uluslararası yayılımı yakından takip edilmektedir.\n- Koronavirüs Bilim Kurulu oluşturulmuştur.\n- 7/24 çalışma esasına göre ekipler oluşturulmuştur.\n- Dünya Sağlık Örgütünün önerileriyle paralel olarak gerekli önlemler alınmıştır/alınmaktadır.\n- Havalimanları ve deniz giriş noktaları gibi stratejik bölgelerde önlemler alınmış, hastalık şüphesi varlığında yapılması gerekenler belirlenmiştir.\n- Hastalığa yönelik tanı, olası vakada uygulanacak prosedürler, korunma ve kontrol önlemleriyle ilgili bir rehber hazırlanmıştır. Tespit edilen vakalara yönelik yönetim algoritmaları oluşturulmuştur ve ilgili tarafların görev ve sorumlulukları tanımlanmıştır. Rehber sürekli güncellenmektedir.",
    },
    {
      "Soru": "COVID-19'un aşısı var mıdır?",
      "Cevap":
          "COVID-19 için şuana kadar geliştirilmiş 3 çeşit aşı mevcuttur; inaktif aşılar, mesajcı RNA (mRNA) aşıları,  viral vektör (adenovirüs) aşıları",
    },
    {
      "Soru": "COVID-19dan korunmak için neler yapılmalıdır?",
      "Cevap":
          "Akut solunum yolu enfeksiyonlarının bulaşma riskini azaltmaya/önlemeye yönelik öneriler, COVID-19 için de geçerlidir.\n- El hijyenine önem verilmelidir. Eller en az 20 saniye boyunca sabun ve suyla yıkanmalı, sabun ve suyun olmadığı durumlarda alkol içerikli el antiseptiği kullanılmalıdır.\n- Eller yıkanmadan ağız, burun ve gözlere dokunulmamalıdır.\n- Hasta insanlarla temastan kaçınılmalıdır.\n- Özellikle hasta insanlarla veya bu insanların çevreleriyle doğrudan temas ettikten sonra eller yıkanmalıdır.\n- Öksürme veya hapşırma sırasında ağız ve burun tek kullanımlık mendille kapatılmalıdır. Mendilin bulunmadığı durumlarda dirsek içi kullanılmalıdır.\n- Mümkünse kalabalık yerlere ve hasta yoğunluğunun fazla olması nedeniyle sağlık merkezlerine gidilmemelidir. Gidilmesi gerekiyorsa diğer kişilerle temas en aza indirilmelidir.\n- Çiğ veya az pişmiş hayvansal ürünleri yemekten kaçınılmalıdır.\n- Çiftlikler, canlı hayvan pazarları ve kesimevleri gibi hastalığı bulaştırma açısından riskli alanlarda bulunulmamalıdır.\n- Seyahat sonrası herhangi bir solunum yolu semptomu gelişirse maske takarak en yakın sağlık kuruluşuna başvurulmalı, doktora seyahat öyküsü hakkında bilgi verilmelidir.",
    },
    {
      "Soru":
          "Kargo ile gelen paket veya ürünlerden COVID-19 bulaşma riski var mıdır?",
      "Cevap":
          "Virüsler cansız ortamlarda kısa süre sonra ölmektedir. Bu nedenle mektup veya kargo paketlerinden COVID-19 bulaşması beklenmemektedir. Dünya Sağlık Örgütü, CDC ve ECDC’nin bu konuda kısıtlaması yoktur. Esas bulaş yolu virüsü taşıyan kişi ile yakın temastır. Kargoyu getiren kişiyle yakın temas edilmemeli, paket alındıktan sonra eller en az 20 saniye boyunca su ve sabunla yıkanmalıdır.",
    },
    {
      "Soru": "Burnu tuzlu suyla yıkamak COVID-19'a yakalanmayı önler mi?",
      "Cevap":
          "Burnu tuzlu suyla yıkamanın COVID-19’dan korunmaya faydası olacağı düşünülmemektedir.",
    },
    {
      "Soru": "Sirke kullanımı COVID-19'a yakalanmayı önler mi?",
      "Cevap":
          "Sirke kullanmanın COVID-19’dan korunmaya faydası olacağı düşünülmemektedir.",
    },
    {
      "Soru": "Koronavirüs testimin sonucunu nasıl öğrenebilirim?",
      "Cevap":
          "Test sonucunuzu Bakanlığımızın E-nabız uygulaması üzerinden kolayca öğrenebilirsiniz. Eğer bilgisayarınız veya akıllı telefonunuz yoksa aile hekiminizden öğrenebilirsiniz.",
    },
    {
      "Soru": "Karantina/izolasyon sürem ne zaman doluyor?",
      "Cevap":
          "Yakın temaslılar 10 gün boyunca karantinada kalır. Karantina dönemi süresince herhangi bir semptom gelişmeyen kişilerin karantinası, PCR yapılmaksızın, 10. günün sonunda biter. Ancak bu kişiler toplumda uyulması gereken tedbirlere devam ederler.Ayrıca yakın temaslı olan ve izlem süresince semptom gelişmeyen kişilerde, PCR testi sonucuna göre 7. günün sonunda karantina sonlandırılabilir. PCR testi, ancak kapasitenin uygun olduğu durumlarda, en erken 5. günden sonra evde numune alınarak yapılabilir. PCR testi negatif çıkan ve semptom gelişmeyen kişilerde 7. günün sonunda karantina sonlandırılır. Yakın temaslılarda karantina hiçbir şekilde 7 günden önce sonlandırılamaz.Korona testi sonucunuz pozitif ise,Eğer semptomunuz yoksa veya hastalığınız hafif ise (evde tedavi aldıysanız veya hastanede 24 saatten kısa süre yattıysanız) test verdikten sonra izolasyon süreciniz başlar ve 10 gün süre ile izolasyonda kalırsınız.Eğer hastanede yatarak tedavi olduysanız (hastanede 24 saatten uzun süre yatmanız gerektiyse) test verdikten sonra izolasyon süreciniz başlar ve 14 gün süre ile izolasyonda kalırsınız.Eğer yoğun bakımda yatarak tedavi olduysanız veya bağışıklık sisteminizi baskılayan ek bir hastalığınız varsa test verdikten sonra izolasyon süreciniz başlar ve 20 gün süre ile izolasyonda kalırsınız. ",
    },
    {
      "Soru": "Karantinadayken hastaneye gitsem cezalı sayılır mıyım?",
      "Cevap":
          "Hayır. Sağlık ihtiyaçlarınız için her zaman sağlık kuruluşlarına başvurabilirsiniz. Bu başvuru sırasında maskenizi takmalı, diğer kişilerle sosyal mesafeyi korumalı ve sizinle temas edecek sağlık çalışanlarına durumunuzu bildirmelisiniz. Sağlık kuruluşuna varsa özel aracınızla gitmeli, yoksa 112 acil sağlık ekiplerinden yardım almalısınız. ",
    },
    {
      "Soru": "İlaçlarımı nasıl kullanmalıyım?",
      "Cevap":
          "İlaçlarınızı muhakkak hekiminizin veya ilacınızı size teslim eden sağlık görevlisinin önerdiği şekilde kullanmalısınız. Hekiminizin size farklı bir önerisi olmadıysa genel olarak hidroksiklorokin etken maddeli ilacı 5 gün boyunca sabah akşam birer tane; favipiravir etken maddeli ilacı ise ilk gün sabah sekiz, akşam sekiz tane, sonraki günlerde ise sabah üç, akşam üç tane olacak şekilde toplam 5 gün boyunca içmelisiniz.",
    },
    {
      "Soru": "Aile hekimim beni neden arıyor?",
      "Cevap":
          "Aile hekiminiz belirlenen günlerde sizi arayarak genel sağlık durumunuzu soracak, sizi izleyecek, gerekirse il/ilçe sağlık yönetimi, hastane veya 112 acil sağlık ekipleri ile iletişim kurarak sağlık durumunuz hakkında onları bilgilendirecektir. Eğer hasta değil, temaslı iseniz sizde Koronavirüs hastalığı gelişip gelişmediğini anlamak amacıyla sorular soracak, gerekli hallerde sizi hastaneye yönlendirecektir.",
    },
    {
      "Soru":
          "İkamet adresimden farklı bir şehirde iken Koronavirüs hastası veya temaslı olduğum tespit edilirse ikamet adresime geri dönebilir miyim?",
      "Cevap":
          "Bu durumda ikamet adresinize dönmeniz mümkün değildir. Hastalığınızın başka bir ilde tespit edilmesi durumunda sizden bulunduğunuz yerde kalmanız talep edilecek, o ildeki Vefa Destek Ekiplerinin önerdiği ya da belirlenmiş yurtlarda konaklamanız istenecektir.",
    },
    {
      "Soru":
          "İzolasyon ya da karantina süremi tamamlayacağım adreste, aynı il içerisinde olmak koşuluyla değişiklik yapabilir miyim?",
      "Cevap":
          "İzolasyon ya da karantina uygulamasında sağlık yönetiminin amacı diğer kişilerle olan teması engellemek ve bu yolla hastalığın yayılmasını durdurabilmektir. Bu nedenle adres değişikliği yapmak, temasa sebep olacağı için uygun bulunmamaktadır. Ancak yaşlı ya da çocuklar gibi bakıma muhtaç durumdaki kişiler için mümkün olan en az temasla ilçe sağlık yönetimleri ile görüştükten sonra adres değişikliği yapılmaktadır.",
    },
    {
      "Soru": "Temaslı listesinden ismim silinebilir mi?",
      "Cevap":
          "Hayır. Filyasyon çalışmaları sırasında sağlık personeli, testi pozitif çıkan kişi ile görüştükten sonra temaslıları belirlemektedir. Temaslı olarak ismi bildirilen bireylerle iletişim kurularak temasın doğruluğu onaylatılır. Daha sonra isim sisteme girilir ve sonrasında silinemez.",
    },
    {
      "Soru":
          "Koronavirüs hastası anneden emzirirken bebeğine hastalık bulaşır mı?",
      "Cevap":
          "Emzirmek, bebeğin büyümesi ve gelişmesi için önceliklidir. Bu nedenle annenin bebeğini emzirmeye devam etmesi önerilir. Ancak anne hasta olduğu dönemde, bebeğinin bakımını yaparken ve emzirirken bütün izolasyon kurallarına uymalıdır. Bebeğini emzirmeden önce ellerini yıkamalı, maskesini takmalı ve meme başı temizliği yapmalıdır. Sonrasında bebeğini güvenle emzirebilir. Eğer Koronavirüs nedeniyle ilaç kullanıyor iseniz bebeğinizi emzirmemeniz önerilmektedir. İlaç kullandığınız süre içinde sütünüzün sağınız ve dökünüz; ilaç tedaviniz bittikten sonra emzirmeye devam edebilirsiniz.",
    },
    {
      "Soru":
          "Koronavirüs hastasının izolasyon süresini doldurduktan sonra hastalığı bulaştırma riski nedir?",
      "Cevap":
          "İzolasyon süresi dolduktan sonra kişi bulaştırıcı kabul edilmez. Ancak, izolasyon süresi biten kişi, kurallar gereği evinin dışına çıktığı zamanlarda maske takmaya devam etmek zorundadır. Ayrıca sosyal mesafe kuralına uyulması sadece Koronavirüs’ten değil, birçok bulaşıcı hastalıktan korunmak için etkili bir yöntemdir.",
    },
    {
      "Soru": "İzolasyon sürem dolduktan sonra test vermem gerekli mi?",
      "Cevap":
          "Hayır. Size önerilen izlem süresi bittikten sonra gündelik hayatınıza ve işinize dönebilirsiniz. ",
    },
    {
      "Soru": "İş yerim iş göremezlik raporu istiyor nasıl alabilirim?",
      "Cevap":
          "Hastalığınız süresince hastanede yatarak tedavi edilirseniz sizi takip eden hekim, evinizde tedavi görürseniz aile hekimiz tarafından Bakanlığımızın E-rapor sistemi aracılığıyla sağlık raporunuz düzenlenebilir.",
    },
    {
      "Soru": "Evde Koronavirüs hastası var, bizden numune alınacak mı?",
      "Cevap":
          "Saha ekipleri size ilk geldiğinde semptomlarınız var ise sizlerden numune alınmaktadır.",
    },
    {
      "Soru":
          "İzolasyon/karantina sürecinde iken sınava (mülakat vb.) girebilir miyim?",
      "Cevap":
          "Evet. Sınava girmeden önce sınavı yapacak kurumun internet sayfasını kontrol ederek Koronavirüs hakkındaki bilgileri okuyunuz. Sınava giderken maskenizi takın ve sınav girişinde sınav görevlilerine hasta ya da temaslı olduğunuzu bildirin.",
    },
    {
      "Soru":
          "Karantina sürecinde ev veya apartmanı nasıl dezenfekte etmeliyiz?",
      "Cevap":
          "Evinizde ya da apartmanınızda 1/100 sulandırılmış çamaşır suyuyla (5 litre suya küçük çay bardağının yarısı kadar çamaşır suyu) temizlik yapmanız ve ortamı havalandırmanız yeterli olacaktır. ",
    },
    {
      "Soru": " Koronavirüs hastasıyım evde nelere dikkat etmeliyim?",
      "Cevap":
          "- Eve ziyaretçi kabul etmemelisiniz.\n- Başka kişi/kişiler ile aynı ortamı paylaşmak zorunda kaldığınız zaman tıbbi maske takmalısınız.\n- Yemeğinizi aile bireylerinizden ayrı, tek başına yemelisiniz.\n- Bol su tüketmeye ve sağlıklı beslenmeye özen göstermelisiniz.\n - Ev halkına bulaş riskini önlemek için mümkünse diğer kişilerden farklı bir odada, mümkün değil ise iyi havalanan bir odada oturmalı, diğer kişilerden en az 1 metre uzakta olmalı ve tıbbi maske takmalısınız. Maskenizin nemlenmesi halinde yenisi ile değiştirmelisiniz. Özellikle evde yaşayan 60 yaş üstünde ve/veya COVID-19’un ağır seyredebileceği risk faktörü olan bireyler varsa mümkünse aynı evde bulunmamalı ya da temas riskini en aza indirilmelisiniz.\n- Ev içindeki hareketinizi olabildiğince sınırlı tutmalısınız.\n- Varsa ayrı tuvalet ve banyo kullanmalısınız.\n- Ortak tuvalet, banyo kullanılıyorsanız bu alanlar iyi havalandırılmalıdır. Banyo ve tuvaletler günde en az bir kez sulandırılmış çamaşır suyuyla (1/100 normal sulandırmada) temizlenmelidir. 1/100 sulandırılmış çamaşır suyu hazırlanışı: 5 litre suya küçük çay bardağının yarısı kadar çamaşır suyu- Öksürme veya hapşırma sırasında bir mendille (tercihen tek kullanımlık kağıt mendille) ağzınızı kapatmalı, kullanılmış mendillerinizi ağzı kapalı naylon poşetlere koymalı, ikinci bir naylon poşete koyarak atmalı ve ellerinizi sık yıkamalısınız.\n- Kişisel eşyalarınızı başkaları ile paylaşmamalı, ev halkının bardak, tabak, havlu gibi eşyalarını kullanmamalı; eğer kullanmanız gerekirse bunları su ve sabunla yıkanmalısınız. Kullandığınız kıyafetler, havlu, çarşaf gibi tekstil ürünleri 60-90°C’de deterjan ile yıkanmalıdır.\n- Odanızın temizliği esnasında eldiven ve maske kullanılmalıdır. Solunum yolu veya vücut çıkartıları ile kirlenme olması durumunda su, sabun veya deterjanla temizlik yaptıktan sonra, tüm yüzeylerin 1/100 normal sulandırma ile hazırlanmış çamaşır suyuyla temizlenmesi gerekir. Belirgin şekilde kirlenme olduğunda ise 1/10 normal sulandırma ile hazırlanmış çamaşır suyu kullanılmalıdır. ",
    },
    {
      "Soru": "İzolasyon sürem doldu neden sürecim devam ediyor?",
      "Cevap":
          "İzolasyon süreniz dolduktan bir gün sonra Bakanlığımızın sistemi otomatik olarak sürecinizi kapatacaktır.",
    },
    {
      "Soru": "Evde şikayetlerim arttı ne yapmalıyım?",
      "Cevap":
          "Özellikle ateş düşürücü ilaç içmenize rağmen düşmeyen ateşiniz ya da nefes darlığınız varsa maskenizi takarak sağlık kuruluşuna müracaat etmelisiniz.",
    },
    {
      "Soru":
          "İzolasyon süremin sonunda test sonucum yine pozitif çıktı. Nasıl bir tedavi yöntemi uygulanacak?",
      "Cevap":
          "İzolasyon süresinin sonunda hastalara tekrar test önerilmemektedir. Ancak yapılmış ve pozitif saptanmış ise genel sağlık durumunuzun iyi olması durumunda ek bir tedavi uygulanmamaktadır. Ancak, şikayetleriniz artarak devam ediyorsa tekrar sağlık kuruluşuna başvurmalısınız.",
    },
    {
      "Soru": "İlacım bitti tekrar ilaç verilecek mi?",
      "Cevap":
          "Tedavi hekimler tarafından Bakanlığımızın rehberlerine göre düzenlenmektedir. Ancak sağlık durumunuzun kötüleşmesi durumunda başvuracağınız sağlık kuruluşundaki hekim tarafından tedaviniz düzenlenecektir.",
    },
    {
      "Soru":
          "Koronavirüs hastasının vefatından sonra neden temaslılar listesinden düşmüyoruz?",
      "Cevap":
          "Karantinadaki amaç sizi hastalık yönünden takip etmek ve hastalığın belirtilerini erken dönemde tespit edebilmektir. Ayrıca bu yolla, hasta olmanız durumunda diğer kişilere hastalığın bulaşması da engellenecektir. Bu nedenle önemli olan bir Koronavirüs hastasına temas etmenizdir, izlem süresinde hastanın akıbeti belirleyici değildir.",
    },
    {
      "Soru":
          "Koronavirüs hastasının vefat etmesi durumunda kişi nasıl defnedilmeli; kim ilgileniyor?",
      "Cevap":
          "Hasta kişinin vefat etmesi durumunda kişi normal şekilde defnedilmektedir. Burada dikkat edilmesi gereken husus mevtayı yıkayacak görevlinin maske ve eldiven takması, cenazeye olabildiğince az sayıda kişinin katılmasıdır. Defin işlemi sırasında mesafe ve maske kullanımı kurallarına uyulmalıdır. Defin hizmetleri, büyükşehir olan illerde belediyeler, diğer illerde ise müftülükler tarafından sunulmaktadır.",
    },
    {
      "Soru":
          "Koronavirüs hastası ya da temaslı kişi izolasyon/karantina kurallarını ihlal ediyor. Nereye şikâyette bulunabilirim?",
      "Cevap": "Kolluk kuvvetlerine iletebilirsiniz.",
    },
    {
      "Soru":
          "Sadece şikayetleri olan (hasta veya teması olmayan) kişilere evde test yapılıyor mu?",
      "Cevap": "Hayır, yapılmıyor.",
    },
    {
      "Soru":
          "Yurt dışına çıkacağım nerede ve kaç lira ödeyerek test verebilirim?",
      "Cevap":
          "İl sağlık müdürlükleri tarafında belirlenen sağlık kurumlarında ve yetkilendirilen özel hastanelerde 250 TL karşılığında test yaptırabilirsiniz.",
    },
    {
      "Soru": "Yurt dışına çıkacağım. Kaç gün önce test vermem gerekli?",
      "Cevap":
          "Her ülkenin kuralları farklı olduğundan ülkeler farklı zamana ait test isteyebilmektedir. Bu nedenle ülkenin talebi, uçuş saatiniz ve bulunduğunuz ilde laboratuvar sonuçlandırma sürelerini dikkate alarak karar vermelisiniz.",
    },
    {
      "Soru":
          "Test verdim negatif çıktı (şikayetim yoktu, tarama amacıyla). Sistemde neden karantinaya alınmış görünüyorum?",
      "Cevap":
          "Test sonucunuz çıkana kadar sistemde aktif kalırsınız ve karantinada kalmanız gerekir. Test sonucunuz negatif olarak sisteme yansıdıktan sonra süreciniz karantinadan düşer. ",
    },
    {
      "Soru": "İki veya daha fazla pozitif vaka aynı ortamda kalabilir mi?",
      "Cevap":
          "Evet kalabilir. Ortamda virüs miktarı fazla olduğundan temizlik ve havalandırma daha sık aralıklarla yapılmalıdır.  ",
    },
    {
      "Soru":
          "Pozitif ya da temaslı olan kişiler dışarıdan ihtiyaçlarını nasıl sağlayacaklar?",
      "Cevap":
          "Bireyler yakınları ya da ildeki Vefa Destek Ekipleri aracılığıyla ihtiyaçlarını dışarıdan temin edebilirler. ",
    },
    {
      "Soru": "Daha önce hastalığı geçirdim tekrar hastalanmam mümkün müdür?",
      "Cevap":
          "Evet, hastalığa ait bilimsel veriler hastalığı geçiren kişilerde daha sonra hastalığın tekrar geçirilebildiğini göstermektedir. Bu nedenle hastalığı geçirmiş kişilerin izolasyon sürelerinden sonra maske takarak günlük yaşamlarına devam etmeleri gerekmektedir.",
    },
    {
      "Soru":
          "İzolasyon döneminde evde hangi semptomlar gelişirse hastaneye başvurmalıyım ya da 112’yi aramalıyım?",
      "Cevap":
          "Solunumda güçlük,\n-Kalıcı ve geçmeyen göğüs ağrısı,\n-Uyku hali gelişmesi durumunda 112’yi aramalısınız",
    },
    {
      "Soru":
          "Hangi durumlarda ve hangi sıklıkla tarama amacıyla test yaptırmalıyım?",
      "Cevap":
          "Rutin olarak tarama amaçlı test yaptırılması önerilmemektedir. Çünkü test yapıldığı andaki virüs varlığını gösterir; daha sonra hastalık gelişmeyeceği konusunda bilgi vermemektedir. Korunma önlemlerinin alınmasına aynı şekilde devam edilmelidir. ",
    },
    {
      "Soru": "COVID-19 sivrisinekler ile bulaşır mı?",
      "Cevap":
          "COVID-19 hastalığının sivrisinek yoluyla insanlara bulaştığı konusunda herhangi bir bilimsel veri veya kanıt bulunmamaktadır. Şu ana kadar sivrisinek yoluyla insanlara bulaşan bir COVID-19 vakası bildirimi olmamıştır.",
    },
    {
      "Soru":
          "Karantina sürem dolmadan test yaptırdım sonuç negatif çıktı; yine de karantinada 10 günü tamamlamam gerekir mi?",
      "Cevap":
          "Yakın temaslılar 10 gün boyunca karantinada kalır. Karantina dönemi süresince herhangi bir semptom gelişmeyen kişilerin karantinası, PCR yapılmaksızın, 10. günün sonunda biter. Ancak bu kişiler toplumda uyulması gereken tedbirlere devam ederler.Ayrıca yakın temaslı olan ve izlem süresince semptom gelişmeyen kişilerde, PCR testi sonucuna göre 7. günün sonunda karantina sonlandırılabilir. PCR testi, ancak kapasitenin uygun olduğu durumlarda, en erken 5. günden sonra evde numune alınarak yapılabilir. PCR testi negatif çıkan ve semptom gelişmeyen kişilerde 7. günün sonunda karantina sonlandırılır. Yakın temaslılarda karantina hiçbir şekilde 7 günden önce sonlandırılamaz.",
    },
    {
      "Soru":
          "Yakın temaslı olarak karantinaya alınan bir kişi ile maske takmadan görüştüm. Ne yapmalıyım?",
      "Cevap":
          "Karantina altındaki bir kişiyle görüştüyseniz hastalık semptomları açısından kendinizi takip etmeniz gerekir. Görüştüğünüz kişide COVID-19 ortaya çıkarsa kendinizi 10 gün evde izole ediniz, sizde hastalık semptomları ortaya çıkarsa maske takarak en yakın sağlık kurumuna gidiniz.",
    },
    {
      "Soru":
          "COVID-19 nedeniyle ölmüş bir kişinin cenazesine gideceğim. Ölen kişiden bana hastalık bulaşır mı?",
      "Cevap":
          "COVID-19 hastası öldükten sonra hastalık bulaştırmaz, ancak cenaze törenleri kalabalık ortam olduğu için cenazeye katılan diğer kişilerden hastalık bulaşabilir. Bu nedenle cenazeye katılmanız önerilmez. Çok yakınınız ise cenaze töreninin kısa olmasına dikkat ediniz, maske ve sosyal mesafe koşullarını sağlayınız. Evinizde kapalı ortamda taziye ziyareti kabul etmeyiniz.",
    },
    {
      "Soru": "COVID-19 testini nerede yaptırabilirim?",
      "Cevap":
          "COVID-19 semptomlarına (ateş, öksürük, solunum güçlüğü vb.)  sahipseniz size en yakın sağlık kurumuna başvurmanız gerekmektedir. Hekiminizin sizi muayene etmesinin ardından COVID-19’dan şüphelenirse sizden test isteyecektir. ",
    },
    {
      "Soru": "HES Kodu Nedir, Nasıl Alınır?",
      "Cevap":
          "Hayat Eve Sığar (HES) Kodu, Kontrollü Sosyal Hayat döneminde ulaşım, kurum ziyareti veya bireysel iletişim gerektiren kamusal alanda bulunma durumunda COVID-19 açısından herhangi bir risk taşıyıp taşımadığınızı güvenli şekilde paylaşmanızı sağlayan ve böylece salgının takibine destek olan bir uygulamadır.HES Kodu, Hayat Eve Sığar uygulaması veya kısa mesaj (SMS) veya e-Devlet Kapısı üzerinden alınır.Hayat Eve Sığar uygulaması üzerinden HES Kodu almak için “HES Kodlarım” bölümüne girilir. “Yeni Kod Ekle” butonuna tıklanır. “Benim İçin” veya “Çocuklarım İçin” seçeneklerinden biri ve kod kullanım süresi seçilir. HES Kodu ve koda ait karekod oluşturulur. Kod geçerlilik süresi olarak “Süresiz” seçeneği işaretlendiğinde, HES Kodu 18 ay geçerli olacaktır.Kısa mesaj (SMS) yoluyla HES Kodu almak için HES yazıp aralarında boşluk bırakarak sırasıyla T.C. Kimlik Numarası, T.C. Kimlik Seri Numarasının Son 4 Hanesi ve Paylaşım Süresi (gün sayısı olarak) yazılır ve 2023’e kısa mesaj (SMS) olarak gönderilir. (Örnek: HES 12345678901 1234 30).Gelen iki mesajdan ilki HES Kodu’nu, ikincisi koda ait karekodu içerir.Kısa mesaj (SMS) göndererek HES Kodu alırken mesajın sonunda paylaşım süresi (gün sayısı olarak) belirtilmezse kodun süresi 1 yıl ile sınırlı olacaktır, mesajın sonuna paylaşım süresi gün sayısı yazıldığında ise HES Kodu yazılan gün sayısı kadar geçerli olacaktır.e-Devlet Kapısı üzerinden HES Kodu almak için “Kurumlar” sekmesinden “Sağlık Bakanlığı” bölümüne girilir. “HES Kodu Üretme ve Listeleme” başlığına tıklanarak işleme devam edilir.e-Devlet Kapısı üzerinden HES Kodu üç adımda alınır.1. adım: “Kodun Üretileceği Kişi Seçimi” ekranından “Kendi Adıma” ve “18 Yaşını Doldurmamış Çocuğum Adına” seçeneklerinden uygun olan tıklanır.2. adım: “Kod Bilgileri” ekranından kod geçerlilik süresi seçilir. Kod geçerlilik süresi olarak “Süresiz” seçeneği işaretlendiğinde, HES Kodu 18 ay geçerli olacaktır. “Süreli” seçeneği işaretlendiğinde, ekrana gelen takvimden kodun geçerlilik süresi belirlenir.3. adım: HES Kodu alma işlemi tamamlanır.HES Kodu hakkında detaylı bilgi almak için https://hayatevesigar.saglik.gov.tr/ web sitesini ziyaret edebilirsiniz.",
    },
    {
      "Soru": "COVID-19 Hastası ya da Temaslısı Ne Zaman Grip Aşısı Olabilir?",
      "Cevap":
          "COVID-19 hastalarının izolasyon süreleri sona erdiğinde genel durumları iyi ise grip aşısı olmalarına engel yoktur. Uygulanacak aşıya alınacak yanıt açısından lenfopeni, glukortikoid ve kullandığı diğer ilaçlara bağlı immünsüpresyon gibi durumlar göz önüne alınarak aşı yapılma kararının ve zamanının bireysel olarak değerlendirilmesi önerilir. Temaslılar için karantina süreleri bittikten sonra grip aşısı uygulanmasında sakınca yoktur.",
    },
  ];
}
