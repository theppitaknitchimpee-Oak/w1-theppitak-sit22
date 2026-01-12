import 'package:flutter/material.dart'; // importเครื่องมือสร้างUIของGoogleมาใช้

void main() { // voidฟังก์ชันนี้ทำเสร็จแล้วจบเลย ไม่ต้องส่งค่าอะไรกลับมา
  runApp(const MyApp()); // runAppบอกให้เริ่มรันแอปที่ Widget ตัวนี้
}

// extends:การสืบทอดคุณสมบัติบอกว่าMyAppคือลูกของStatelessWidget(ยืมความสามารถพ่อมาใช้)
class MyApp extends StatelessWidget {

  // const:บอกคอมว่าค่านี้จะนิ่งสนิทช่วยให้แอปทำงานเร็วขึ้น
  // super.key:ส่งรหัสบัตรประชาชนKeyไปให้คลาสแม่Super classช่วยจัดการ
  const MyApp({super.key});

  @override // @override: คำสั่งเขียนทับ บอกว่าเราไม่เอาฟังก์ชัน build แบบเดิมๆของพ่อแต่จะเขียนใหม่เองในนี้
  Widget build(BuildContext context) { // Context:แผนที่บอกว่าตอนนี้เราอยู่ส่วนไหนของแอป
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/second': (context) => const SecondPage(),
      },
    );
  }
}

//หน้าที่1(Profileสีน้ำเงิน)

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key}); // const:ใส่เพื่อประหยัดเมมโมรี่เพราะหน้านี้โครงสร้างไม่เปลี่ยน

  @override // @override:ยืนยันว่าจะวาดหน้าจอด้วยคำสั่งข้างล่างนี้
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold:โครงร่างหน้าจอมาตรฐาน(มีที่วาง AppBar, Body, etc.)
      body: Column( // Column: Widgetบนลงล่าง
        children: [ // children: รับได้หลายอย่างเป็น List []
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            width: double.infinity, // double.infinity:ค่ากว้างที่สุดเท่าที่จะเป็นไปได้หรือเต็มจอ
            decoration: const BoxDecoration( // const: การตกแต่งนี้ค่าคงที่ ไม่เปลี่ยน
              color: Color(0xFF1565C0),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(3),
                bottomRight: Radius.circular(3),
              ),
            ),
            child: Column(
              children: [
                const Text( // const: ข้อความนี้เขียนแล้วเขียนเลย ไม่เปลี่ยนทีหลัง
                  "ข้อมูลส่วนตัว",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.purpleAccent,
                    shape: BoxShape.circle, // BoxShape: กำหนดรูปทรงกล่อง
                  ),
                  child: ClipOval( // ClipOval: กรรไกรตัด Widget ให้เป็นวงกลม
                    child: Image.network(
                      "https://i.pinimg.com/736x/de/ab/ba/deabba62d809dc1b730be1babf5a1234.jpg",
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover, // BoxFit.cover: สั่งรูปให้ขยายเต็มพื้นที่โดยไม่เสียสัดส่วน
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Theppitak Nitchimphli",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "theppitak.nitchimpee@e-tech.ac.th",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded( // Expanded: สั่งให้ ดันพื้นที่ให้เต็ม
            child: SingleChildScrollView( //เลื่อนขึ้นลงได้
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // --- ส่วนเบอร์โทร ---
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.phone, color: Colors.green, size: 28),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("เบอร์โทรศัพท์", style: TextStyle(color: Colors.grey)),
                            Text("099-578-2150", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    // --- ส่วนวันเกิด ---
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.pink[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.cake, color: Colors.pink, size: 28),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("วันเกิด", style: TextStyle(color: Colors.grey)),
                            Text("06 กุมภาพันธ์ 2006", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    // --- ส่วนที่อยู่ ---
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.orange[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.location_on, color: Colors.orange, size: 28),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("ที่อยู่", style: TextStyle(color: Colors.grey)),
                            Text("ชลบุรี", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    // --- ส่วนการศึกษา ---
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.purple[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.school, color: Colors.purple, size: 28),
                        ),
                        const SizedBox(width: 15),
                        Expanded( // ใช้ Expanded เพื่อปัดข้อความยาวๆ ลงบรรทัดใหม่
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("การศึกษา", style: TextStyle(color: Colors.grey)),
                              Text("วิทยาลัยเทคโนโลยีภาคตะวันออก (อี.เทค)",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    // --- ปุ่มเปลี่ยนหน้า ---
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton( // ElevatedButton: ปุ่มแบบมีพื้นหลังนูนขึ้นมา
                        onPressed: () => Navigator.pushNamed(context, '/second'), // Arrow Function (=>): เขียนย่อคำสั่ง return
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1565C0),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text("ไปยังหน้า 2", style: TextStyle(fontSize: 18)),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ================= หน้าที่ 2 (Instagram Style) =================

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  // final: ประกาศตัวแปรที่ "ค่าห้ามเปลี่ยน" (Assign ได้ครั้งเดียวตอนเริ่มสร้าง)
  // List<String>: ตัวแปรประเภท "รายการ" ที่ข้างในเก็บ "ข้อความ" (String) เท่านั้น
  final List<String> imageUrls = const [
    "https://i.pinimg.com/1200x/71/33/85/71338549c0b909614424bf81c345071c.jpg",
    "https://i.pinimg.com/736x/d9/12/4e/d9124e0ba3e7179a1833da49dec5546e.jpg",
    "https://i.pinimg.com/736x/7b/fc/37/7bfc3717931bab5fdd81161ba013a9aa.jpg",
    "https://i.pinimg.com/736x/b3/a4/19/b3a4193287ae96dc8fd4b86fe7e4cbb2.jpg",
    "https://i.pinimg.com/1200x/ca/07/1a/ca071a34a3cebb4a986e80b73b31bb5f.jpg",
    "https://i.pinimg.com/736x/d5/85/3a/d5853aeb4f7d60d4f8b4d70c26abc776.jpg",
    "https://i.pinimg.com/736x/bf/2d/b5/bf2db50e1a5f8d4b41957e57ad32ffd6.jpg",
    "https://i.pinimg.com/originals/1a/4c/5b/1a4c5bb4855f4d06caa78471692c5f9a.gif",
    "https://i.pinimg.com/736x/0e/82/8d/0e828d25efbbd8a5ebb4690160e506af.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // pop: คำสั่งปิดหน้านี้เพื่อย้อนกลับ
          },
        ),
        title: const Text(
          "โปรไฟล์",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // CrossAxis: แกนขวาง (แนวนอน) ให้ชิดซ้าย (Start)
            children: [
              // --- ส่วน Header โปรไฟล์ (รูป + สถิติ) ---
              Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      "https://i.pinimg.com/736x/de/ab/ba/deabba62d809dc1b730be1babf5a1234.jpg",
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround, // จัดระยะห่างให้สวยงาม
                      children: [
                        _buildStatColumn("5", "กำลังติดตาม"),

                        Container(
                          height: 35,           // ความสูงของเส้น
                          width: 1,             // ความหนาของเส้น
                          color: Colors.grey.shade300,
                        ),

                        _buildStatColumn("828.1 K", "ผู้ติดตาม"),

                        Container(
                          height: 35,
                          width: 1,
                          color: Colors.grey.shade300,
                        ),

                        _buildStatColumn("329.9 K", "ถูกใจ"),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: const [
                  Text(
                    "Theppitak_Nitchimpee",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.verified, color: Colors.blue, size: 20),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Icon(Icons.music_note, size: 16, color: Colors.grey[600]),
                  Text(" lnwza007", style: TextStyle(color: Colors.grey[600])),
                ],
              ),
              const SizedBox(height: 20),

              // --- ปุ่มกด ---
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1565C0),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "ติดตาม",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.share, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // --- ตารางรูปภาพ ---
              GridView.builder( // Builder: สร้างของแบบ "Lazy" (สร้างเฉพาะที่มองเห็นบนจอ) ประหยัดแรม
                shrinkWrap: true, // true: สั่งให้ GridView หดความสูงเท่าที่จำเป็น (ไม่ยืดจน Error)
                physics: const NeverScrollableScrollPhysics(), // physics: สั่งห้าม GridView เลื่อนเอง (ป้องกันการเลื่อนซ้อนเลื่อน)
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Count: จำนวนคอลัมน์แนวตั้ง
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 2.8 / 3.8, // Ratio: สัดส่วน กว้าง ต่อ สูง
                ),
                itemCount: imageUrls.length, // length: นับจำนวนรูปใน List ว่ามีกี่รูป
                itemBuilder: (context, index) { // index: เลขลำดับ (0, 1, 2...) ว่าตอนนี้กำลังสร้างรูปที่เท่าไหร่
                  return ClipRRect( // ClipRRect: กรรไกรตัดมุมโค้งมน (Rounded Rectangle)
                    borderRadius: BorderRadius.circular(2),
                    child: Image.network(
                      imageUrls[index], // [] : การเข้าถึงข้อมูลใน List ทีละตัว ตามเลข index
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget: ฟังก์ชันนี้จะส่งผลลัพธ์กลับไปเป็น Widget
  // String number: รับค่าเข้ามาเป็นตัวหนังสือ ตั้งชื่อว่า number
  Widget _buildStatColumn(String number, String label) {
    return Column(
      children: [
        Text(number, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
      ],
    );
  }
}